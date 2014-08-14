proc bind {type privs comd script} {
	set moretodo 1
	set comd [string tolower $comd]
	set comd [ndaenc $comd]
	while {0!=$moretodo} {
		set bindnum [rand 1 10000000]
		if {[tnda get "binds/$type/$comd/$bindnum"]!=""} {} {set moretodo 0}
	}
	puts stdout "$script binds/$type/$comd/$bindnum"
	tnda set "binds/$type/$comd/$bindnum" $script
	tnda set "binds/privs/$type/$comd/$bindnum" $privs
	return $bindnum
}

proc unbind {type privs comd id} {
	tnda set "binds/$type/$comd/$id" ""
	tnda set "binds/privs/$type/$comd/$id" ""
}

proc callbinds {type client chan comd args} {
	set camd [ndaenc [string tolower $comd]]
	if {""!=[tnda get "binds/$type/$camd"]} {
		foreach {id script} [tnda get "binds/$type/$camd"] {
			if {[matchattr [nick2hand $client] [tnda get "binds/privs/$type/$camd/$id"] $chan]||[tnda get "binds/privs/$type/$camd/$id"]=="-|-"||[tnda get "binds/privs/$type/$match/$id"]=="-"} {$script {*}$args}
		};return
	}
	#if {""!=[tnda get "binds/$type/-/$comd"]} {foreach {id script} [tnda get "binds/$type/-/$comd"] {$script [lindex $args 0] [lrange $args 1 end]};return}
}

proc callmbinds {type client chan comd args} {
	set camd [ndaenc [string tolower $comd]]
	if {""!=[tnda get "binds/$type"]} {
		foreach {match ids} [tnda get "binds/$type"] {
			if {[string match -nocase [ndadec $match] $comd]} {
			puts stdout "[ndadec $match]"
				foreach {id script} $ids {
					puts stdout "$comd $match $ids"
					if {[matchattr [nick2hand $client] [tnda get "binds/privs/$type/$match/$id"] $chan]
					   ||[tnda get "binds/privs/$type/$match/$id"]=="-|-"
					   ||[tnda get "binds/privs/$type/$match/$id"]=="-"
					} {$script {*}$args;puts stdout "called $script"}
				}
			}
		};return
	}
	#if {""!=[tnda get "binds/$type/-/$comd"]} {foreach {id script} [tnda get "binds/$type/-/$comd"] {$script [lindex $args 0] [lrange $args 1 end]};return}
}

proc putq {q m} {
	if {[llength [tnda get "q/$q"]]!=0} {tnda set "q/$q" [list {*}[tnda get "q/$q"] "$m"]} {tnda set "q/$q" [list "$m"]}
}

proc pruneq {q t} {
	after $t "pruneq $q $t"
	if {[lindex [tnda get "q/$q"] 0]==""} {return}
	puts stdout [lindex [tnda get "q/$q"] 0]
	puts $::sock [lindex [tnda get "q/$q"] 0]
	tnda set "q/$q" [lrange [tnda get "q/$q"] 1 end]
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
