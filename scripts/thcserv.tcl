bind pub -|- "!explode" kerplode
bind pub -|- "!coffee" coffee
bind pub -|- "!lag" lag
bind pub -|- "!penis" penis
bind msgm -|- "VERSION*" versi
bind notc -|- "ECHO*" pong
bind notc -|- "PING*" pong

proc kerplode {nick uh hand to text} {
	putmsg $to "$nick, *!$uh is your Hostmask."
}

proc coffee {nick uh hand to text} {
	switch [expr {int(rand()*4)}] {
	 0 {putmsg $to "\001ACTION hands [lindex [split $text " "] 0] a cup of espresso\001"}
	 1 {putmsg $to "\001ACTION hands [lindex [split $text " "] 0] a cup of Latte\001"}
	 2 {putmsg $to "\001ACTION hands [lindex [split $text " "] 0] a cup of instant coffee\001"}
	 3 {putmsg $to "\001ACTION hands [lindex [split $text " "] 0] a cup of cappucino\001"}
	}
}

proc lag {nick uh hand to text} {
	putnow "PRIVMSG $nick :\001PING [clock clicks -milliseconds] $to \001"
}

proc pong {nick uh hand text} {
	set ms [lindex [split $text " "] 0]
	set dest [lindex [split $text " "] 1]
	#puthelp "NOTICE $nick :Your lag is [expr {[clock clicks -milliseconds] - $ms}] milliseconds according to your client and our measurements."
	if {![string is integer [string index $ms 0]]} {return}
	puthelp "PRIVMSG $dest :$nick, your lag is [expr {[clock clicks -milliseconds] - $ms}] milliseconds according to your client and our measurements."
}

proc versi {nick uh hand chan text} {
	puthelp "NOTICE $nick :\001VERSION Jaffabot-TCL 0.1 Jack D. Johnson\001"
}

proc penis {nick uh hand chan text} {
	set facto [open /dev/urandom r+]
	set rando [read $facto 4]
	scan $rando %c%c%c%c co ct cr cf
	set penilen [expr {($co * (2 ** 24))+($ct * (2 ** 16))+($cr * (2 ** 8))+($cf)}]
	close $facto
	puthelp "PRIVMSG $to :$nick, your penis is [expr {4 + ${penilen} % 36}]cm long according to our measurements."
}

