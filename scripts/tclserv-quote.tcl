bind pub -|- "!quote" quoteservdo
bind pub -|- "!q" quoteservdo
bind pubm -|- "*" quotedo

proc quoteservdo {n uh h chan t} {
	set para [lrange [split $t " "] 0 end]
	set ndacname [ndaenc $chan]
	set subcmd [lindex $para 0]
	set para [lrange $para 1 end]
	switch -nocase -glob -- $subcmd {
		"sea*" {
			set ptn "*[join $para " "]*"
			set qts [quotesearch $chan $ptn]
			if {[llength $qts]} {puthelp "PRIVMSG $chan :\[\002Quotes\002\] Found quotes numbered #[join $qts ",#"]"} {
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] No quotes found for pattern"
			}
		}
		"vi*1st*ma*" {
			set ptn "*[join $para " "]*"
			set qts [quotesearch $chan $ptn]
			if {[llength $qts]} {set qtn [lindex $qts 0];puthelp "PRIVMSG $chan :\[\002Quotes\002\] Quote number #$qtn:";puthelp "PRIVMSG $chan :\[\002Quotes\002\] [nda get "quoteserv/quotes/$ndacname/$qtn"]"} {
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] No quotes found for pattern"
			}
		}
		"ad*" {
			set qt [join $para " "]
			set qtn [expr {([llength [nda get "quoteserv/quotes/$ndacname"]]/2)+3}]
			nda set "quoteserv/quotes/$ndacname/$qtn" $qt
			nda set "quoteserv/setter/$ndacname/$qtn" $h
			puthelp "PRIVMSG $chan :\[\002Quotes\002\] Added quote number #$qtn to database."
		}
		"de*" {
			set qtn "[lindex $para 0]"
			if {![string is integer $qtn]} {puthelp "PRIVMSG $chan :\[\002Quotes\002\] Please use a valid integer (without the #)"}
			if {[nda get "quoteserv/setter/$ndacname/$qtn"]!=$h&&"*"!=[nda get "quoteserv/setter/$ndacname/$qtn"]} {puthelp "PRIVMSG $chan :\[\002Quotes\002\] The setter needs to do this.";return}
			nda set "quoteserv/quotes/$ndacname/$qtn" ""
			puthelp "PRIVMSG $chan :\[\002Quotes\002\] Blanked quote number #$qtn in database."
		}
		"ali*" {
			set qtl "[lindex $para 0]"
			set qtn "[lindex $para 1]"
			if {![string is integer $qtn]} {puthelp "PRIVMSG $chan :\[\002Quotes\002\] Please use a valid integer (without the #)"}
			nda set "quoteserv/labels/$ndacname/[ndaenc $qtl]" "$qtn"
			puthelp "PRIVMSG $chan :\[\002Quotes\002\] Aliased $qtn to $qtl"
		}
		"he*" {
			set helpfile {             ---- Quotes Help ----
!quote search - Search for quotes matching
!quote view1stmatch - Search for quotes matching and view first matching quote.
!quote view - View quote
!quote add - Add quote.
!quote alias <label> <number> - Add quote-name.
!quote del - Delete quote. Requires halfops or above.
@<quotelabel> - View quote labelled <quotelabel> (used for factoids)
End of help for Q.}
			foreach {helpline} [split $helpfile "\r\n"] {
				putserv "NOTICE $n :$helpline"
			}
		}
		"vi*" {
			set qtn "[lindex $para 0]"
			if {![string is integer $qtn]} {puthelp "PRIVMSG $chan :\[\002Quotes\002\] Please use a valid integer (without the #)"}
			set qt [nda get "quoteserv/quotes/$ndacname/$qtn"]
			if {$qt != ""} {
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] <[nda get "quoteserv/setter/$ndacname/$qtn"]> Quote number #$qtn:"
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] $qt"
			}
		}
		"*" {
			set qtn "$subcmd"
			if {![string is integer $qtn]} {puthelp "PRIVMSG $chan :\[\002Quotes\002\] Please use a valid integer (without the #)"}
			set qt [nda get "quoteserv/quotes/$ndacname/$qtn"]
			if {$qt != ""} {
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] <[nda get "quoteserv/setter/$ndacname/$qtn"]> Quote number #$qtn:"
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] $qt"
			}
		}
	}
}

proc quotedo {nick uh hand chan payload} {
	set payload [split $payload " "]
	set ndacname [ndaenc $chan]
	switch -glob -nocase -- [lindex $payload 0] {
		"@up" {return}
		"@request" {return}
		"@*" {
			set qtn [string range [lindex $payload 0] 1 end]
			puts stdout "[nda get "quoteserv/labels/$ndacname"]"
			set qt [nda get "quoteserv/quotes/$ndacname/[nda get "quoteserv/labels/$ndacname/[ndaenc $qtn]"]"]
			if {$qt != ""} {
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] Quote label #$qtn:"
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] $qt"
			} {
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] Quote label #$qtn not found."
			}
		}
		"&*" {
			set qtn [string range [lindex $payload 0] 1 end]
			set qt [nda get "quoteserv/quotes/$ndacname/[nda get "quoteserv/labels/$ndacname/$qtn"]"]
			if {$qt != ""} {
				puthelp "PRIVMSG $chan :\[\002Quotes\002\] [lindex $payload 1]: $qt"
			}
		}
	}
}

proc quotesearch {chan pattern} {
	set ndacname [string map {/ [} [::base64::encode [string tolower $chan]]]
	set ret [list]
	foreach {qnum qvalue} [nda get "quoteserv/quotes/$ndacname"] {
		if {[string match -nocase $pattern $qvalue]} {lappend ret $qnum}
	}
	return $ret
}

putlog "\[Quotes\] LOADED!"
