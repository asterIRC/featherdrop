#!/usr/bin/env tclsh
# Basic tcl services program.
# Adapted for featherdrop... nothing really needs changing

package require tie
package require base64
package require sha1
#set b64 [split "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789[]" {}]

source b64.tcl

proc pwhash {pass} {
	global b64
	set hash [::sha1::sha1 -hex $pass]
	return "SHA1/$hash"
}

proc rand {minn {maxx 0}} {
	if {!$maxx} {set maxx $minn;set minn 0}
	if {$minn==$maxx} {return $maxx}
	set maxnum [expr {$maxx - $minn}]
	set fp [open /dev/urandom r]
	set bytes [read $fp 6]
	close $fp
	scan $bytes %c%c%c%c%c%c ca co ce cu ci ch
	set co [expr {$co + pow(2,8)}]
	set ce [expr {$ce + pow(2,16)}]
	set cu [expr {$cu + pow(2,24)}]
	set ci [expr {$ci + pow(2,32)}]
	set ch [expr {$ch + pow(2,40)}]
	return [expr {$minn+(int($ca+$co+$ce+$cu+$ci+$ch)%$maxnum)}]
}

proc mysrc {script} {
	set fp [open $script r]
	set ev [read $fp]
	close $fp
	uplevel "#0" $ev
}
mysrc nda.tcl
::tie::tie nd file [lindex $argv 0].db

proc loadconf {tn} {mysrc [lindex $::argv 0].$tn}
foreach {file} [lsort [glob ./core/*.tcl]] {
	mysrc $file
}
proc loadmod {module} {mysrc ./modules/$file.tcl}

vwait forever
