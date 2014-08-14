proc bind {type privs comd script} {
	set moretodo 1
	while {0!=$moretodo} {
		set bindnum [rand 1 10000000]
		if {[tnda get "binds/$type/$comd/$bindnum"]!=""} {} {set moretodo 0}
	}
	tnda set "binds/$type/$comd/$bindnum" $script
	tnda set "binds/privs/$type/$comd/$bindnum" $privs
	return $bindnum
}

proc unbind {type privs comd id} {
	tnda set "binds/$type/$comd/$id" ""
	tnda set "binds/privs/$type/$comd/$id" ""
}
proc callbind {type client chan comd args} {
	if {""!=[tnda get "binds/$type/$comd"]} {
		foreach {id script} [tnda get "binds/$type/$comd"] {
			if {[matchattr [nick2hand $client] [tnda get "binds/privs/$type/$comd/$id"] $chan]} {$script {*}$args}
		};return
	}
	#if {""!=[tnda get "binds/$type/-/$comd"]} {foreach {id script} [tnda get "binds/$type/-/$comd"] {$script [lindex $args 0] [lrange $args 1 end]};return}
}

proc putq {q m} {
	if {[tnda get "q/$q"]!=""} {tnda set "q/$q" [concat [tnda get "q/$q"] "$m"]} {tnda set "q/$q" [list "$m"]}
}

proc pruneq {q t} {
	puts $::sock ":$::botnick [lindex [tnda get "q/$q"] 0]"
	tnda set "q/$q" [lrange [tnda get "q/$q"] 1 end]
	after $t "pruneq $q $t"
}

proc putmsg {targ msg} {
	putq quick "PRIVMSG $targ :$msg"
}

proc putdcc {idx msg} {
	puts $idx $msg
}

after 300 {pruneq now 300}
after 600 {pruneq serv 600}
after 900 {pruneq quick 900}
after 1200 {pruneq help 1200}
