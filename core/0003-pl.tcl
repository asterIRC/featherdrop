set ::partylinememb [list]
namespace eval pl {
	proc ::pl::accept {chan addr port} {
		fconfigure $chan -blocking 0 -buffering line
		fileevent $chan readable [list ::pl::getusername $chan $addr]
		puts $chan ""
	}

	proc ::pl::getpassword {chan addr} {
		set uname [tnda get "pline/usernames/$chan"]
		if {[passwdok $uname [string trim [gets $chan] "\r\n "]]} {putdcc $chan "You have authenticated successfully.";::pl::connection $chan $addr;fileevent $chan readable [list ::pl::plmain $chan $addr]} {puts $chan "Negative on that, Winnipeg";close $chan;tnda set "pline/usernames/$chan" ""}
	}

	proc ::pl::connection {chan addr} {
		callmbinds "chon" "=[tnda get "pline/usernames/$chan"]" "*" "[tnda get "pline/usernames/$chan"]" [tnda get "pline/usernames/$chan"] $chan
		global partylinememb
		dict set partylinememb $chan 1
		if {[file exists bot.motd]} {
			set fd [open bot.motd r]
			set cont [read $fd]
			close $fd
			set cont [string map [list "%botnick%" $::botnick "%defnick%" $::nick] $cont]
			puts $chan $cont
		}
	}

	proc ::pl::plmain {chan addr} {
		global partylinememb
		if {[eof $chan]} {dict set partylinememb $chan 0;callmbinds "chof" "=[tnda get "pline/usernames/$chan"]" "*" "[tnda get "pline/usernames/$chan"]" [tnda get "pline/usernames/$chan"] $chan}
		gets $chan line
		set line [string trim $line "\r\n"]
		set comd [split $line " "]
		set cmd [lindex $comd 0]
		set payload [join [lrange $comd 1 end] " "]
		if {[string index $cmd 0] == "."} {callbinds "dcc" "=[tnda get "pline/usernames/$chan"]" "*" "[string range $comd 1 end]" [tnda get "pline/usernames/$chan"] $chan $payload} {
			foreach {memb s} $::partylinememb {if {$s} {putdcc $memb "<[tnda get "pline/usernames/$chan"]> $line"}}
		}
	}

	proc ::pl::newuser {chan addr} {
		close $chan
	}

	proc ::pl::getusername {chan addr} {
		# Currently using open telnets.
		gets $chan line
		set l [split $line " "]
		switch -glob -- [lindex $l 0] {
			"*" {
				tnda set "pline/usernames/$chan" [lindex $l 0]
				if {![validuser [lindex $l 0]]} {close $chan}
				puts $chan "\nEnter your password."
				fileevent $chan readable [list ::pl::getpassword $chan $addr]
			}
		}
	}
}

bind dcc -|- "quit" dcc:quit
bind chon -|- "*" dcc:chon
bind chof -|- "*" dcc:chof
bind msgm -|- "CHAT*" ctcp:chat
package require ip

proc ctcp:chat {n uh h t} {
	puthelp "PRIVMSG $n :DCC CHAT CHAT [::ip::toInteger $::bindhost] $::lastlisten"
	puthelp "NOTICE $n :DCC Chat ($::bindhost port $::lastlisten)"
}

proc dcc:quit {handle chan text} {
	callmbinds "chof" "=[tnda get "pline/usernames/$chan"]" "*" "[tnda get "pline/usernames/$chan"]" [tnda get "pline/usernames/$chan"] $chan
	putdcc $chan "*** Ja mata!"
	close $chan
}

proc dcc:chon {handle idx} {
	foreach {memb s} $::partylinememb {if {$s && ($memb != $idx)} {putdcc $memb "-!- $handle \[$idx\] has joined the party line."}}
}

proc dcc:chof {handle idx} {
	foreach {memb s} $::partylinememb {if {$s && ($memb != $idx)} {putdcc $memb "-!- $handle \[$idx\] has left the party line."}}
}
