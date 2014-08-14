set numversion 10800000

proc ircmain {sck} {
	gets $sck input
	if {[eof $sck]} {puts stderr "Will reconnect, closing link"; close $sck;return}
	set one [string match ":*" "$input"]
	set line [string trimleft "$input" ":"]
	set line [string trimright "$line" "\r\n"]
	set gotsplitwhere [string first " :" "$line"]
	if {$gotsplitwhere==-1} {set comd [split $line " "]} {set comd [split [string range "$line" 0 [expr {$gotsplitwhere - 1}]] " "]}
	set payload [split [string range "$line" [expr {$gotsplitwhere + 2}] end] " "]
	tnda set "userhosts/[ndaenc [lindex [split [lindex $comd 0] "!"] 0]]" [lindex $comd 0]
	switch -nocase -- [lindex $comd $one] {
		"433" {
			puts $sck "NICK [alternick $::nick]"
			puts stdout "Server didn't like our nick, choosing a different one."
		}
		"NICK" {
			tnda set "userhosts/[ndaenc [lindex $comd 2]]" [tnda get "userhosts/[ndaenc [lindex [split [lindex $comd 0] "!"] 0]]"]
			tnda set "userhosts/[ndaenc [lindex [split [lindex $comd 0] "!"] 0]]" ""
			callmbinds "nick" [lindex $comd 2] "*" "* [lindex $comd 2]" [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex $comd 2]] "*" [lindex $comd 2]
		}

		"PRIVMSG" {
			if {![string match "*[string index [lindex $comd 2] 0]*" [tnda get "isupport/[ndaenc CHANTYPES]"]]} {
				callbinds "msg" [lindex $comd 0] "*" [lindex $payload 0] [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [join [lrange $payload 1 end] " "]
				callmbinds "msgm" [lindex $comd 0] "*" [join $payload " "] [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [join [lrange $payload 1 end] " "]
			} {
				callbinds "pub" [lindex $comd 0] [lindex $comd 2] [lindex $payload 0] [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [lindex $comd 2] [join [lrange $payload 1 end] " "]
				callmbinds "pubm" [lindex $comd 0] [lindex $comd 2] "[lindex $comd 2] [join $payload " "]" [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [lindex $comd 2] [join $payload " "]
			}
		}

		"NOTICE" {
			if {![string match "*[string index [lindex $comd 2] 0]*" [tnda get "isupport/[ndaenc CHANTYPES]"]]} {
				callmbinds "notc" [lindex $comd 0] "*" [join $payload " "] [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [join [lrange $payload 1 end] " "]
			} {
				callmbinds "pnotc" [lindex $comd 0] [lindex $comd 2] "[lindex $comd 2] [join $payload " "]" [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [lindex $comd 2] [join $payload " "]
			}
		}


		"001" {
			after 1000 {init-server}
		}

		"005" {
			foreach {tok} [lrange $comd 3 end] {
				foreach {key val} [split $tok "="] {
					if {$key == "PREFIX"} {
						set v [string range $val 1 end]
						set mod [split $v ")"]
						set modechar [split [lindex $mod 1] {}]
						set modepref [split [lindex $mod 0] {}]
						foreach {c} $modechar {x} $modepref {
							tnda set "prefix/$c" $x
						}
						tnda set "i/ops" [split [string map {h {} v {}} $modepref] {}]
						tnda set "i/prefixmodes" [split $modepref {}]
					}
					if {$key == "CHANMODES"} {
						set fields [split $val ","]
						tnda set "i/listmodes" [concat [split [lindex $fields 0] {}] [tnda get "i/prefixmodes"]]
						tnda set "i/keymodes" [split [lindex $fields 1] {}]
						tnda set "i/limitmodes" [split [lindex $fields 2] {}]
						tnda set "i/flagmodes" [split [lindex $fields 3] {}]
					}
					tnda set "isupport/[ndaenc $key]" $val
					puts stdout "$key $val ISUPPORT"
				}
			}
		}

		"KICK" {
			callmbinds "kick" [lindex [split [lindex $comd 0] "!"] 0] [lindex $comd 0] "[lindex $comd 2] [lindex $comd 3] [join $payload " "]" [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [lindex $comd 2] [lindex $comd 3] [join $payload " "]
		}
		"MODE" {
			set ctr 3
			foreach {c} [split [lindex $comd 3] {}] {
				if {[lsearch -exact $c [tnda get "i/listmodes"]]!=-1 || [lsearch -exact $c [tnda get "i/keymodes"]]!=-1 || [lsearch -exact $c [tnda get "i/limitmodes"]]!=-1} {incr ctr;set usepar 1}
				switch -glob -- $c {
					"+" {set state 1}
					"-" {set state 0}
					"*" {callmbinds "mode" [lindex [split [lindex $comd 0] "!"] 0] [lindex $comd 2] "[lindex $comd 2] [expr {$state ? "+" : "-"}]$c" [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [lindex $comd 2] "[expr {$state ? "+" : "-"}]$c" "[expr {$usepar ? [lindex $comd $ctr] : ""}]"}
				}
				set usepar 0
			}
		}
		"353" {
			foreach {pfx mode} [tnda get "i/prefix"] {
                                set pfxmatch($pfx) $mode
                        }
                        foreach {name} $payload {
                                set no ""
                                set nn ""
                                foreach {nc} [split $name {}] {
                                        if {[info exists pfxmatch($nc)]} {append no $pfxmatch($nc)} {append nn $nc}
                                }
                                if {$no==""} {set no "="}
                                tnda set "culist/[ndaenc [lindex $comd 4]]" [concat [tnda get "culist/[ndaenc [lindex $comd 4]]"] $nn]
                                tnda set "oplist/[ndaenc [lindex $comd 4]]/$nn" $no
			}
		}

		"352" {
			tnda set "userhosts/[ndaenc [lindex $comd 7]]" "[lindex $comd 4]@[lindex $comd 5]"
		}

		"JOIN" {
			if {[lindex [split [lindex $comd 0] "!"] 0] == $::botnick} {putq help "WHO [lindex $comd 2]"}
			set lis [tnda get "culist/[ndaenc [lindex $comd 2]]"]
			lappend lis [lindex [split [lindex $comd 0] "!"] 0]
			tnda set "culist/[ndaenc [lindex $comd 2]]" $lis
			callmbinds join [lindex [split [lindex $comd 0] "!"] 0] [lindex $comd 2] "[lindex $comd 2] [lindex $comd 0]" [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [lindex $comd 2]
		}

		"PART" {
			set lis [tnda get "culist/[ndaenc [lindex $comd 2]]"]
			set lis [lreplace $lis [lsearch -exact $lis [lindex [split [lindex $comd 0] "!"] 0]] [lsearch -exact $lis [lindex [split [lindex $comd 0] "!"] 0]]]
			tnda set "culist/[ndaenc [lindex $comd 2]]" $lis
			callmbinds part [lindex [split [lindex $comd 0] "!"] 0] [lindex $comd 2] "[lindex $comd 2] [lindex $comd 0]" [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] [lindex $comd 2] [join $payload " "]
		}

		"QUIT" {
			callmbinds sign [lindex [split [lindex $comd 0] "!"] 0] [lindex $comd 2] "* [lindex $comd 0]" [lindex [split [lindex $comd 0] "!"] 0] [lindex [split [lindex $comd 0] "!"] 1] [nick2hand [lindex [split [lindex $comd 0] "!"] 0]] "*" [join $payload " "]
			tnda set "userhosts/[ndaenc [lindex [split [lindex $comd 0] "!"] 0]]" ""
		}
		"PING" {
			if {$one} {puts $sck "PONG $::botnick :[join $payload " "]"} {puts $sck "PONG [join [concat [lindex $comd 1] $payload] " "]"}
			puts stdout "ponged"
		}
	}
}

proc pushmode {chan mode args} {
	putq quick "MODE $chan $mode [join $args " "]"
}

proc alternick {nick} {
	global alternicks botnick
	if {![info exists alternicks]} {set alternicks 1}
	set altechar "`[]-_^1234567890"
	set char [string index $altechar [expr {[incr $alternicks] % [string length $altechar]}]]
	set rut $nick
	append rut $char
	set botnick $rut
	return $rut
}

proc doconn {} {
	if {[info exists ::sock]} {if {![eof $::sock]} {return}}
	global reconcount sock botnick
	set botnick $::nick
	incr reconcount
	set serve [lindex $::servers [expr {$reconcount % [llength $::servers]}]]
	set sr [split $serve ":"]
	set srn [lindex $sr 0]
	set srp [lindex $sr 1]
	set sock [connect $srn $srp ircmain]
	after 500
	puts $sock "NICK $::nick"
	puts $sock "USER $::username * * :Featherdrop"
	after 8000 doconn
}

if {![info exists nick]} {loadconf 1}
set botnick $nick
loadconf 2
doconn
