package require tls

proc connect {addr port script} {
	set opts [list]
	if {[string index $port 0] == "+"} { set port [string range $port 1 end] ; set comd [list ::tls::socket -tls1 1 -ssl3 0 -ssl2 0]} {set comd socket}
	set sck [{*}$comd -myaddr $::bindhost $addr $port]
	fconfigure $sck -blocking 0 -buffering none
	fileevent $sck readable [concat $script $sck]
	return $sck
}

proc listen {port type {sc ""}} {
	global lastlisten
	if {$type=="all"} {set script ::pl::accept} {set script $sc}
	if {[string index $port 0] == "+"} { set port [string range $port 1 end] ; set comd ::tls::socket } {set comd socket; set lastlisten $port}
	set sck [$comd -server $script -myaddr $::bindhost $port]
}

