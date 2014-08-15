# Thanks znc...
proc utimer {seconds tcl-command} {after [expr $seconds * 1000] ${tcl-command}}
proc timer {minutes tcl-command} {after [expr $minutes * 60 * 1000] ${tcl-command}}
proc utimers {} {set t {}; foreach a [after info] {lappend t "0 [lindex [after info $a] 0] $a"}; return $t}
proc timers {} {set t {}; foreach a [after info] {lappend t "0 [lindex [after info $a] 0] $a"}; return $t}
proc killtimer id {return [after cancel $id]}
proc killutimer id {return [after cancel $id]}
proc ndaenc {n} {
	return [string map {/ [} [::base64::encode [string tolower $n]]]
}

proc setudef {args} {}
proc getudef {args} {}
proc unixtime {} {
	return [clock format [clock seconds] -format %s]
}

proc putserv {msg} {
	putq serv "$msg"
}

proc puthelp {msg} {
	putq help "$msg"
}

proc putquick {msg} {
	putq quick "$msg"
}

proc putnow {msg} {
	putq now "$msg"
}

proc putlog {msg} {
	puts stdout "$msg"
}

proc putloglev {lev mask msg} {
	#puts stdout "$lev $mask $msg"
}

proc putcmdlog {args} {
	#puts stdout "$lev $mask $msg"
}

proc ndadec {n} {
	return [::base64::decode [string map {[ /} $n]]
}

proc matchattr {handle attr {chan "*"}} {
	set handle [string tolower $handle]
	if {-1!=[string first "&" $attr]} {set and 1} {set and 0}
	set gattr [lindex [split $attr "&|"] 0]
	set cattr [lindex [split $attr "&|"] 1]
	set isattrg 0
	foreach {c} [split [nda get "eggcompat/attrs/global/$handle"] {}] {
		foreach {k} [split $gattr {}] {
			if {$c == "-"} {set isattrg 1}
			if {$c == $k} {set isattrg 1}
		}
	}
	set isattrc 0
	if {"*"!=$chan} {
		foreach {c} [split [nda get "eggcompat/attrs/[ndaenc $chan]/$handle"] {}] {
			foreach {k} [split $cattr {}] {
				if {$c == "-"} {set isattrc 1}
				if {$c == $k} {set isattrc 1}
			}
		}
	} {set isattrc $isattrg}
	if {$and && ($isattrg == $isattrc) && ($isattrc == 1)} {return 1}
	if {!$and && ($isattrg || $isattrc)} {return 1}
	return 0
}

proc chattr {handle attr {chan "*"}} {
	set handle [string tolower $handle]
	if {$chan == "*"} {
		set del [list]
		set app ""
		set state app
		foreach {c} [split $attr {}] {
			if {"+"==$c} {set state app;continue}
			if {"-"==$c} {set state del;continue}
			if {$state=="del"} {
				lappend del $c ""
			}
			if {$state=="app"} {
				lappend del $c ""
				append app $c
			}
		}
		nda set "eggcompat/attrs/global/$handle" [join [concat [string map $del [nda get "eggcompat/attrs/global/$handle"]] $app] ""]
	} {
		set del [list]
		set app ""
		set state app
		foreach {c} [split $attr {}] {
			if {"+"==$c} {set state app;continue}
			if {"-"==$c} {set state del;continue}
			if {$state=="del"} {
				lappend del $c ""
			}
			if {$state=="app"} {
				lappend del $c ""
				append app $c
			}
		}
		puts stdout [ndaenc $chan]
		nda set "eggcompat/attrs/[ndaenc $chan]/$handle" [join [concat [string map $del [nda get "eggcompat/attrs/[ndaenc $chan]/$handle"]] $app] ""]
	}
}

proc channels {} {
	set ret [list]
	foreach {chan _} [nda get "channels"] {
		lappend ret [ndadec $chan]
	}
	return $ret
}

proc chanlist {chan {flags "-|-"}} {
	set ret [list]
	foreach {n} [tnda get "culist/[ndaenc $chan]"] {
		if {[matchattr [nick2hand $n] $flags $chan]||$flags=="-|-"||$flags=="-"} {lappend ret $n}
	}
	return $ret
}

proc onchan {nick {chan "*"}} {
	if {"*"==$chan} {
		foreach {chan _} [tnda get "culist"] {
			foreach {n} $_ {
				if {$n == $nick} {return 1}
			}
		}
	} {
		foreach {n} [tnda get "culist/[ndaenc $chan]"] {
			if {$n == $nick} {return 1}
		}
	}
	return 0
}

namespace eval channel {
	proc ::channel::add {chan {flags ""}} {
		nda set "channels/[ndaenc $chan]/reg" 1
		set $chan $flags
		putserv "JOIN $chan"
	}

	proc ::channel::del {chan} {
		nda set "channels/[ndaenc $chan]" [list]
		nda set "eggcompat/chansets/[ndaenc $chan]" [list]
	}

	proc ::channel::info {chan} {
		set ret [list]
		::foreach {stt val} [nda get "eggcompat/chansets/[ndaenc $chan]"] {
			if {$val} {lappend ret "+$stt"} {lappend ret "-$stt"}
		}
		return $ret
	}

	proc ::channel::get {chan flag} {
		if {[::set enda [nda get "eggcompat/chansets/[ndaenc $chan]/[ndaenc [string map {+ ""} $flag]]"]]!=""} {return $enda} {return 0}
	}
	proc ::channel::set {chan flags {args ""}} {
		if {[llength $flags] != 1} {
			foreach {flag} $flags {arg} $args {
				::set bit [string index $flag 0]
				if {$bit=="+"&&$arg==""} {::set bitt 1} elseif {$bit=="+"} {::set bitt $arg} {::set bitt 0}
				::set flag [string range $flag 1 end]
				uplevel "#0" nda set "eggcompat/chansets/[ndaenc $chan]/[ndaenc [string map {+ ""} $flag]]" $bitt
			}
		} {
			::set flags [lindex $flags 0]
			::set arg [lindex $args 0]
			::set bit [string index $flags 0]
			if {$bit=="+"&&$arg==""} {::set bitt 1} elseif {$bit=="+"} {::set bitt $arg} {::set bitt 0}
			puts stdout "$bitt"
			::set flag [string range $flags 1 end]
			uplevel "#0" nda set "eggcompat/chansets/[ndaenc $chan]/[ndaenc [string map {+ ""} $flag]]" $bitt
		}
	}
	namespace export *
	namespace ensemble create
}

proc passwdok {n p} {
	set chkp [pwhash $p]
	set isp [nda get "usernames/$n/pass"]
	if {$isp==""} {return 1}
	if {$chkp == $isp} {return 1}
	return 0
}

proc usetpass {n p} {
	set chkp [pwhash $p]
	nda set "usernames/$n/pass" $chkp
}

proc validuser {n} {
	if {""==[nda get "usernames/$n"]} {return 0} {return 1}
}

proc validchan {n} {
	if {""==[nda get "channels/[ndaenc $n]"]} {return 0} {return 1}
}

proc userlist {} {
	set ret [list]
	foreach {u _} [nda get "usernames"] {
		lappend ret $u
	}
	return $ret
}

proc deluser {username} {
	if {![validuser $username]} {return 0}
	nda set "usernames/$username" ""
}

proc adduser {username {hostmask ""}} {
	if {[validuser $username]} {return 0}
	if {[string match "*/*" $username]} {return 0}
	if {$hostmask != ""} {set moretodo 1} {set moretodo 0}
	while {0!=$moretodo} {
                set bindnum [rand 1 10000000]
                if {[nda get "usernames/$username/hostmasks/$bindnum"]!=""} {} {set moretodo 0}
        }
	if {$hostmask != ""} {nda set "usernames/$username/hostmasks/$bindnum" $hostmask}
	nda set "usernames/$username/reg" 1
	return 1
}

proc addhost {username {hostmask ""}} {
	if {$hostmask != ""} {set moretodo 1} {set moretodo 0}
	while {0!=$moretodo} {
                set bindnum [rand 1 10000000]
                if {[nda get "usernames/$username/hostmasks/$bindnum"]!=""} {} {set moretodo 0}
        }
	if {$hostmask != ""} {nda set "usernames/$username/hostmasks/$bindnum" $hostmask}
	return 1
}

proc delhost {username bostmask} {
	foreach {bindnum hostmask} [nda get "usernames/$username/hostmasks"] {
		if {[string tolower $hostmask] == [string tolower $bostmask]} {set bindzum $bindnum}
	}
	if {[info exists bindzum]} {nda set "usernames/$username/hostmasks/$bindzum" ""}
	return 1
}

proc user-chattr {from msg} {
	set ndacname [ndaenc [lindex $msg 0 2]]
	set handle [lindex $msg 0 0]
	set hand [lindex $msg 0 0]
	set attrs [lindex $msg 0 1]
	set chan [lindex $msg 0 2]
	set ch [lindex $msg 0 2]
	foreach {c} [split $attrs {}] {
		if {$c == "+"} {continue}
		if {$c == "-"} {continue}
		if {$c == "k"} {set c "mn|mnol"}
		if {$c == "v"} {set c "mn|lmno"}
		if {$c == "l"} {set c "mn|mno"}
		if {$c == "o"} {set c "mn|omn"}
		if {$c == "m"} {set c "mn|mn"}
		if {$c == "n"} {set c "n|n"}
		if {$c == "a"} {set c "mn|mn"}
		if {![matchattr [nick2hand $from] $c $chan]} {
			return
		}
	}
	if {""==$chan} {chattr $hand $attrs} {chattr $hand $attrs $chan}
}

proc nick2hand {nick} {
	foreach {u} [userlist] {
		foreach {id hm} [nda get "usernames/$u/hostmasks"] {
			if {[string match $hm [tnda get "userhosts/[ndaenc $nick]"]]} {return $u}
		}
	}
}

proc hand2nick {nick} {
	foreach {u} [userlist] {
		foreach {id hm} [tnda get "userhosts"] {
			if {[string match $hm [nda get "usernames/$u/hostmasks"]]} {return $id}
		}
	}
}

proc getuser {nick datafield {dataval "body"}} {
	puts stdout "usernames/$nick/setuser/[ndaenc $datafield]/[ndaenc $dataval] $datafield $dataval [nda get "usernames/$nick/setuser/[ndaenc $datafield]/[ndaenc $dataval]"]"
	return [nda get "usernames/$nick/setuser/[ndaenc $datafield]/[ndaenc $dataval]"]
}

proc setuser {nick datafield {dataval "body"} {val ""}} {
	if {[string tolower $datafield] == "pass"} {usetpass $nick $dataval}
	if {[string tolower $datafield] == "hosts"} {addhost $nick $dataval}
	return [nda set "usernames/$nick/setuser/[ndaenc $datafield]/[ndaenc $dataval]" $val]
}

proc chandname2name {channame} {return $channame}
proc channame2dname {channame} {return $channame}

proc islinked {bot} {return [expr {([tnda get "bots/$bot/linked"]!="")&&[tnda get "bots/$bot/linked"]!=0}]}
after 10000 {
	foreach {chan} [channels] {
		puthelp "JOIN $chan"
	}
}
bind kick -|- "*" kickrejoin

proc kickrejoin {n uh h c t m} {
	puts stdout "kickrejoin $n $uh $h $c $t $m"
	if {$t == $::botnick} {
		puthelp "JOIN $c"
		putq rejoin "JOIN $c"
		putq rejoin "JOIN $c"
		putq rejoin "JOIN $c"
		putq rejoin "JOIN $c"
		putq rejoin "JOIN $c"
	}
}

set chanfile [lindex $::argv 0].chan
set userfile [lindex $::argv 0].user

proc isbotnick {n} {return [expr {$::botnick == $n}]}
proc ischanban {n c} {return 0}
proc wasop {n c} {return 0}
proc isop {n c} {return [expr {[string match "*o*" [tnda get "oplist/[ndaenc $c]/$n"]]}]}
