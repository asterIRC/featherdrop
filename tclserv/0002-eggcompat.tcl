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
	}
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
	foreach {chan _} [nda get "channels"] {
		lappend ret $chan
	}
	return $ret
}

namespace eval channel {
	proc ::channel::get {chan flag} {
		if {[::set enda [nda get "eggcompat/chansets/[ndaenc $chan]/[ndaenc [string map {+ ""} $flag]]"]]!=""} {return $enda} {return 0}
	}
	proc ::channel::set {chan flags} {
		if {[llength $flags] != 1} {
			foreach {flag} $flags {
				::set bit [string index $flag 0]
				if {$bit=="+"} {::set bitt 1} {::set bitt 0}
				::set flag [string range $flag 1 end]
				uplevel "#0" nda set "eggcompat/chansets/[ndaenc $chan]/[ndaenc [string map {+ ""} $flag]]" $bitt
			}
		} {
			::set flags [lindex $flags 0]
			::set bit [string index $flags 0]
			if {$bit=="+"} {::set bitt 1} {::set bitt 0}
			puts stdout "$bitt"
			::set flag [string range $flags 1 end]
			uplevel "#0" nda set "eggcompat/chansets/[ndaenc $chan]/[ndaenc [string map {+ ""} $flag]]" $bitt
		}
	}
	namespace export *
	namespace ensemble create
}

proc validuser {n} {
	if {""==[nda get "usernames/$n"]} {return 0} {return 1}
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
	foreach {hand hm} [nda get "hostmasks"] {
		if {[string match $hm [tnda get "userhosts/$nick"]]} {return $hand}
	}
}

proc getuser {nick datafield {dataval "body"}} {
	return [nda get "usernames/$nick/setuser/[ndaenc $datafield]/[ndaenc $dataval]"]
}

proc setuser {nick datafield {dataval "body"} {val ""}} {
	return [nda set "usernames/$nick/setuser/[ndaenc $datafield]/[ndaenc $dataval]" $val]
}

proc chandname2name {channame} {return $channame}
proc channame2dname {channame} {return $channame}

proc islinked {bot} {return [expr {([tnda get "bots/$bot/linked"]!="")&&[tnda get "bots/$bot/linked"]!=0}]}
