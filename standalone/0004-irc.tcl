proc ircmain {sck} {
	gets $sck input
	if {[eof $sck]} {puts stderr "Will reconnect, closing link"; close $sck;return}
	set one [string match ":*" "$input"]
	set line [string trimleft "$input" ":"]
	set line [string trimright "$line" "\r\n"]
	set gotsplitwhere [string first " :" "$line"]
	if {$gotsplitwhere==-1} {set comd [split $line " "]} {set comd [split [string range "$line" 0 [expr {$gotsplitwhere - 1}]] " "]}
	set payload [split [string range "$line" [expr {$gotsplitwhere + 2}] end] " "]
	switch -nocase -- [lindex $comd $one] {
		"433" {
			puts $sck "NICK [alternick $::nick]"
			puts stdout "Server didn't like our nick, choosing a different one."
		}
		"NICK" {
			tnda set "userhosts/[ndaenc [lindex $comd 2]]" [tnda get "userhosts/[ndaenc [lindex [split [lindex $comd 0]] "!"] 0]"]
			tnda set "userhosts/[ndaenc [lindex [split [lindex $comd 0]] "!"] 0]" ""
			callmbinds "nick" [lindex $comd 2] "*" "* [lindex $comd 2]" [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex $comd 2]] "*" [lindex $comd 2]
		}

		"PRIVMSG" {
			if {![string match "*[string index [lindex $comd 2] 0]*" [tnda get "isupport/[ndaenc CHANTYPES]"]]]} {
				callbinds "msg" [lindex $comd 0] "*" [lindex $payload 0] [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [join [lrange $payload 1 end] " "]
				callmbinds "msgm" [lindex $comd 0] "*" [join $payload " "] [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [join [lrange $payload 1 end] " "]
			} {
				callbinds "pub" [lindex $comd 0] [lindex $comd 2] [lindex $payload 0] [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [join [lrange $payload 1 end] " "]
				callmbinds "pubm" [lindex $comd 0] [lindex $comd 2] "[lindex $comd 2] [join $payload " "]" [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [lindex $comd 2] [join $payload " "]
			}
		}

		"NOTICE" {
			if {![string match "*[string index [lindex $comd 2] 0]*" [tnda get "isupport/[ndaenc CHANTYPES]"]]]} {
				callmbinds "notc" [lindex $comd 0] "*" [join $payload " "] [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [join [lrange $payload 1 end] " "]
			} {
				callmbinds "pnotc" [lindex $comd 0] [lindex $comd 2] "[lindex $comd 2] [join $payload " "]" [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [lindex $comd 2] [join $payload " "]
			}
		}

		"001" {
			callbinds init-server "*" "*" "*" init-server
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
						tnda set "ops" [split [string map {h {} v {}} $modepref] {}]
						tnda set "prefixmodes" [split $modepref {}]
					}
					if {$key == "CHANMODES"} {
						set fields [split $val ","]
						tnda set "listmodes" [concat [split [lindex $fields 0] {}] [tnda get "prefixmodes"]]
						tnda set "keymodes" [split [lindex $fields 1] {}]
						tnda set "limitmodes" [split [lindex $fields 2] {}]
						tnda set "flagmodes" [split [lindex $fields 3] {}]
					}
					tnda set "isupport/[ndaenc $key]" $val
					puts stdout "$key $val ISUPPORT"
				}
			}
		}

		"KICK" {
			callmbinds "kick" [lindex [split [lindex $comd 0]] "!"] 0] [lindex $comd 0] "[lindex $comd 2] [lindex $comd 3] [join $payload " "]" [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [lindex $comd 2] [lindex $comd 3] [join $payload " "]
		}
		"MODE" {
			set ctr 3
			foreach {c} [split [lindex $comd 3] {}] {
				if {[lsearch -exact $c [tnda get "listmodes"]]!=-1 || [lsearch -exact $c [tnda get "keymodes"]]!=-1 || [lsearch -exact $c [tnda get "limitmodes"]]!=-1} {incr ctr;set usepar 1}
				switch -glob -- $c {
					"+" {set state 1}
					"-" {set state 0}
					"*" {callmbinds "mode" [lindex [split [lindex $comd 0]] "!"] 0] [lindex $comd 2] "[lindex $comd 2] [expr {$state ? "+" : "-"}]$c" [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [lindex $comd 2] "[expr {$state ? "+" : "-"}]$c" "[expr {$usepar ? [lindex $comd $ctr] : ""}]"}
				}
				set usepar 0
			}
		}
		"JOIN" {
			set lis [tnda get "culist/[lindex $comd 2]"]
			lappend lis [lindex [split [lindex $comd 0]] "!"] 0]
			tnda set "culist/[lindex $comd 2]" $lis
			callmbinds join [lindex [split [lindex $comd 0]] "!"] 0] [lindex $comd 2] "[lindex $comd 2] [lindex $comd 0]" [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [lindex $comd 2]
		}

		"PART" {
			set lis [tnda get "culist/[lindex $comd 2]"]
			set lis [lreplace [lsearch -exact $lis [lindex [split [lindex $comd 0]] "!"]] [lsearch -exact $lis [lindex [split [lindex $comd 0]] "!"]] $lis]
			tnda set "culist/[lindex $comd 2]" $lis
			callmbinds part [lindex [split [lindex $comd 0]] "!"] 0] [lindex $comd 2] "[lindex $comd 2] [lindex $comd 0]" [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] [lindex $comd 2] [join $payload " "]
		}

		"QUIT" {
			callmbinds sign [lindex [split [lindex $comd 0]] "!"] 0] [lindex $comd 2] "* [lindex $comd 0]" [lindex [split [lindex $comd 0]] "!"] 0] [lindex [split [lindex $comd 0]] "!"] 1] [nick2hand [lindex [split [lindex $comd 0]] "!"] 0]] "*" [join $payload " "]
			tnda set "userhosts/[ndaenc [lindex [split [lindex $comd 0]] "!"] 0]" ""
		}
		"PING" {
			if {$one} {puts $sck "PONG $::botnick :[join $payload " "]"} {puts $sck "PONG [join [concat [lindex $comd 1] $payload] " "]"}
			puts stdout "ponged"
		}
	}
}

proc alternick {nick} {
	global alternicks botnick
	set altechar "`[]-_^1234567890"
	set char [string index $altechar [expr {[incr $alternicks] % [string length $altechar]}]]
	set rut $nick
	append rut $char
	set botnick $rut
	return $rut
}

proc doconn {} {
	if {![eof $::sock]} {return}
	global reconcount sock botnick
	set botnick $::nick
	incr reconcount
	set serve [lindex $::servers [expr {$reconcount % [llength $::servers]}]]
	set sr [split $serve "%"]
	set srn [lindex $sr 0]
	set srp [lindex $sr 1]
	set sock [connect $srn $srp ircmain]
	puts $sock "NICK $::nick"
	puts $sock "USER $::username * * :Featherdrop"
	after 8000 doconn
}

doconn
