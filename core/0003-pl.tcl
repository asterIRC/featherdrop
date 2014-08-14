namespace eval pl {
	proc ::pl::accept {chan addr port} {
		fconfigure $chan -blocking 0 -buffering line
		fileevent $chan readable [list ::pl::getusername $chan $addr]
		puts $chan ""
	}

	proc ::pl::getpassword {chan addr} {
		set uname [tnda get "unreg/usernames/$chan"]
		close $chan
	}

	proc ::pl::getusername {chan addr} {
		# Currently using open telnets.
		gets $chan line
		set l [split $line " "]
		switch -glob -- [lindex $l 0] {
			"NEW" {
				puts $chan "\r\nDon't abuse the partyline, and your friends can be on it too. Thanks for registering."
				fileevent $chan readable [list ::pl::newuser $chan $addr]
			}
			"*" {
				tnda set "unreg/usernames/$chan" [lindex $l 0]
				puts $chan "\r\nEnter your password."
				fileevent $chan readable [list ::pl::getpassword $chan $addr]
			}
		}
	}
}
