package require tls

proc connect {addr port script} {
	if {[string index $port 0] == "+"} { set port [string range $port 1 end] ; set comd ::tls::socket } {set comd socket}
	set sck [$comd $addr $port]
	fconfigure $sck -blocking 0 -buffering line
	fileevent $sck readable [concat $script $sck]
	return $sck
}

proc listen {port type {sc ""}} {
	if {$type=="all"} {set script ::pl::accept} {set script $sc}
	if {[string index $port 0] == "+"} { set port [string range $port 1 end] ; set comd [list ::tls::socket -verify 0] } {set comd socket}
	set sck [{*}$comd -server $script -myaddr $::bindhost $port]
}

