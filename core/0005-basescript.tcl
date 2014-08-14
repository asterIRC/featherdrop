bind msg -|- "chanset" msgchanset

proc msgchanset {n uh h t} {
	if {![matchattr $h n|n [lindex $t 0]]} {putquick "NOTICE $n :You haven't the permissions.";return}
	channel set {*}[split $t " "]
	putquick "NOTICE $n :If I haven't died, then the chanset worked."
}

puts stdout "[matchattr j4jackj n|n] j4jackj matchattr"
