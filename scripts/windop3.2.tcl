#########################################################################################
####                                     Windop                                      ####
#########################################################################################
####                               Version 3.2 on tcl                                ####
####                                Made by Windop Team                              ####
####                     You can contact us on #windop@Undernet                      ####
####                               http://www.windop.com                             ####
####                        Thank reporting bugs or mistake..                        ####
####          on https://sourceforge.net/tracker/?group_id=78872&atid=554710         ####
#########################################################################################
####------------------------------N----N--3333---X----X------------------------------####
####------------------------------NN---N------3---X--X-------------------------------####
####------------------------------N-N--N----33-----XX--------------------------------####
####------------------------------N--N-N----33-----XX--------------------------------####
####------------------------------N---NN------3---X--X-------------------------------####
####------------------------------N----N--3333---X----X------------------------------####
#########################################################################################
#### What's Windop?                                                                  ####
####    Windop is a clone of Undernet Cservice X. The only difference is that it can ####
####    be runned on an eggdrop.                                                     ####
#### Why WINdop ?                                                                    ####
####    For sure, that's not because we like Windows ;). But it's because that the   ####
####    first version was developed in VisualBasic. It wasn't realy good and was very####
####    slow. So we ported it to TCL, so runnable on most os that eggdrops support.  ####
#########################################################################################
####                                                                                 ####
#### What's new?                                                                     ####
####     Language available: 1 - English                                             ####
####                         2 - French                                              ####
####                         3 - Romanian                                            ####
####                         4 - Hungarian                                           ####
####                         5 - Swedish                                             ####
####                         6 - Spanish                                             ####
####                         7 - Norwegian                                           ####
####                         8 - Danish                                              ####
####                         9 - Italian                                             ####
####                        10 - Turkish                                             ####
####  v3.2                                                                           ####
####    -Command CYCLE added (make the bot cycle from a channel)                     ####
####    -Command ACTION added (make the bot do an action on a channel)               ####
####    -MySQL support with the addon                                                ####
####    -Auto check for new version (you can disable it for fastess rehash)          ####
####    -Broadcast bug fixed                                                         ####
####    -Jump bug fixed                                                              ####
####    -Fast or slow say and action                                                 ####
####  v3.1                                                                           ####
####    -New language: Norwegian and Danish                                          ####
####    -Float-Limit                                                                 ####
####    -Devoice bug fixed                                                           ####
####    -Added defaut ban expire value settable                                      ####
####    -Kick pattern                                                                ####
####    -Dont kick op on flood added                                                 ####
####    -Bug with Accent in Autotopic fixed                                          ####
####    -Purge reason added                                                          ####
####    -You can now set your default language for the admin report                  ####
####    -You can now set the sendmail path and the from adresse for registration     ####
####    -You can now set if you want to be admin reported with notice or msg         ####
####  v3.0                                                                           ####
####	-Suspend, Unsuspend command                                                  ####
####	-Reguser and Regid command                                                   ####
####	-Access list sorted by level number                                          ####
####	-Seen bug in some command fixed                                              ####
####	-Username have no more host                                                  ####
####	-Command addhost and remhost removed                                         ####
####	-Command Join and Part added                                                 ####
####	-Command status modded to show if the bot is on the channel                  ####
####	-Bug of these little \ before [ ] fixed                                      ####
####	-Lifetime added to the ban command                                           ####
####	-New language: Hungarian,Swdish,Spannish                                     ####
####                                                                                 ####
####                                                                                 ####
#########################################################################################
#### If you want to change the number of second between each notice, change the line ####
#### #define msgrate 2 to #define msgrate 0 in the server.c source of the eggdrop.   ####
####     Warning: This can cause instability of your eggdrop and can result to a     ####
####              quit of the server with a Excess Flood.                            ####
#########################################################################################
####                                                                                 ####
####      PLEASE, REPORT EVERY MODIFIACATION TO nitro@n3x.net. THANKS :o)            ####
#########################################################################################
#### Special thanx to:                                                               ####
####            TheDevil     <-> Translating Windop to Romanian                      ####
####            dRomMeDar    <-> Tanslating Windop to Swedish                        ####
####            Snakepit     <-> Tanslating Windop to Hungarian                      ####
####            StMaster     <-> Translating Windop to Spanish                       ####
####            Modig        <-> Translating Windop to Norwegian                     ####
####            React        <-> Tanslating Windop to Danish                         ####
####  Dal Bosco Michele "CD" <-> Translating Windop to Italian                       ####
####            Tiger        <-> Translating Windop to Turkish
#########################################################################################
#### You would like to participate for the translation of this script into your      ####
#### language?? Then, you can contact us at this url nitro1710 at hotmail dot com    ####
#########################################################################################
####                           MADE FOR EGGDROP 1.6.X                                ####
#########################################################################################


###########################################
###               SETUP                 ###
###   You can change these line below   ###
###########################################
####Flood setting
	set dop(def_chan-flood) "10:1"
	set dop(def_deop-flood) "10:1"
	set dop(def_kick-flood) "10:1"
	set dop(def_join-flood) "10:1"
	set dop(def_ctcp-flood) "10:1"
#####Commands on channel
	#[ON: 1, OFF: 0] - Show channel commands into the showcommands
	set dop(showchancom) 1
	#[ON: 1, OFF: 0] - Channel's command on/off
	set dop(chancom) 1
	#Channel command char
	set dop(chanchar) "!"
#####Auto check for new version of windop every 21 o'clock
	set dop(upautocheck) 1
#####Bot motd.. This char will make a new line: 
	set dop(botmotd) "   Using windop version 3.2   Available on http://www.windop.com"
#####Report admin actions
	#[ON: 1, OFF: 0]
	set dop(adminreport) 0
	#Report channel
	set dop(adminreportchan) "#admin-chan"
	#In wich language admin command are reported?
	set dop(adminreportlang) 1
	#If you don't want to report on channel via notice put 0 to this
	set dop(adminreportnotice) 0

#####Channel owner say&action
#####This will make an owner of a channel to be able to talk to a channel
#####You have to go down and make set dop(msg) 800 to 500 if you want channel owner to make it talk.
#####Do the same thing for action if you want channel owner to make the bot make actions.
	#[ON: 1, OFF: 0]
	set dop(chanownsay) 1

	#Fast say [ON: 1, OFF: 0]
	set dop(fastsay) 1

#####Language setted by default (1. English, 2. French, 3. Romanian, 4. Hungarian...)
	set dop(deflang) 1
#####Add the username in the kick reason
	#[ON: 1, OFF: 0]
	set dop(kickusername) 1
#####Channel misc
	#After how many second the bot will remove a ban
	set dop(defban) 120
#####Password
	#Minimum password length
	set dop(passlen) 6
#####Purge reason
	set dop(defpurgereason) "Channel purged without any reason"

#####Mysql ADDON
#Warning, if you don't have this addon, it may crash your eggdrop!
	set dop(mysqladddon) 0

#####Flood control ! If someone is logged into the bot, it will bypass the flood kick and let him on the channel! And the second,
#####what is the miminum access to have to get free from kick!
	set dop(dontkicklogged) 0
	set dop(dkickminaccess) 10

#####Self registering
	#[ON: 1, OFF: 0]
	set dop(regusers) 1
	#Email verification (your need sendmail)
	set dop(regemail) 0
	#Not accepted email (blackList)
	set dop(nomail) "*.cum"
	#Email registration subject
	set dop(regusersubject) "Windop User Registration"
	#Email registration from adress
	set dop(regfrommail) "Windop team <Windop@foobar.com>"
	#Sendmail path!
	set dop(sendmailp) "/usr/sbin/sendmail"

###########################################
###Let this line to 1 else some windop command will crap :P
###Try to put it to 1 too in the .conf if it doesnt work here
set double-help 1

##### Min access #######
set dop(access) 0
set dop(login) 0
set dop(showignore) 0
set dop(newpass) 0
set dop(dauth) 0
set dop(conline) 501
set dop(help) 0
set dop(uptime) 0
set dop(verify) 0
set dop(status) 1
set dop(info) 0
set dop(showcommands) 0
set dop(op) 100
set dop(deop) 100
set dop(voice) 25
set dop(devoice) 25
set dop(invite) 100
set dop(ban) 75
set dop(unban) 75
set dop(topic) 50
set dop(quit) 900
set dop(rehash) 900
set dop(jump) 900
set dop(clearmode) 400
set dop(kick) 50
set dop(set) 450
set dop(banlist) 1
set dop(adduser) 400
set dop(remuser) 400
set dop(removeall) 750
set dop(addchan) 750
set dop(remchan) 750
set dop(cycle) 500
set dop(addignore) 600
set dop(remignore) 600
set dop(chanlist) 501
set dop(addhand) 501
set dop(remhand) 501
set dop(msg) 500
set dop(listhand) 501
set dop(action) 500
set dop(modinfo) 400
set dop(broadcast) 800
set dop(chaninfo) 0
set dop(motd) 0
set dop(reguser) 0
set dop(regid) 0
set dop(pass) 0
set dop(join) 450
set dop(part) 500
set dop(suspend) 100
set dop(unsuspend) 100
#########################

##Don't change anything below this line (AT YOUR OWN RISK !)
unbind msg - op *msg:op
unbind msg - voice *msg:voice
unbind msg - invite *msg:invite
unbind msg - pass *msg:pass
bind msg -|- login dop:login
bind msg -|- dauth dop:dauth
bind msg -|- op dop:op
bind msg -|- deop dop:deop
bind msg -|- voice dop:voice
bind msg -|- devoice dop:devoice
bind msg -|- access dop:access
bind msg -|- ban dop:ban
bind msg -|- unban dop:unban
bind msg -|- chaninfo dop:chaninfo
bind msg -|- kick dop:kick
bind msg -|- banlist dop:banlist
bind msg -|- verify dop:verify
bind msg -|- adduser dop:adduser
bind msg -|- remuser dop:remuser
bind msg -|- topic dop:topic
bind msg -|- showcommands dop:showcommands
bind msg -|- modinfo dop:modinfo
bind msg -|- search dop:search
bind msg -|- invite dop:invite
bind msg -|- uptime dop:uptime
bind msg -|- status dop:status
bind msg -|- join dop:join
bind msg -|- part dop:part
bind msg -|- info dop:info
bind msg -|- showignore dop:ignorelist
bind msg -|- help dop:help
bind msg -|- set dop:set
bind msg -|- motd dop:motd
bind msg -|- clearmode dop:clearmode
bind pub -|- [string trim $dop(chanchar)]online dop:online
bind msg -|- broadcast dop:broadcast
bind msg -|- addchan dop:addchan
bind msg -|- remchan dop:remchan
bind msg -|- removeall dop:removeall
bind msg -|- register dop:addchan
bind msg -|- purge dop:remchan
bind msg -|- reguser dop:reguser
bind msg -|- addhand dop:addhand
bind msg -|- remhand dop:remhand
bind msg -|- cycle dop:cycle
bind msg -|- suspend dop:suspend
bind msg -|- unsuspend dop:unsuspend
bind msg -|- msg dop:msg
bind msg -|- say dop:msg
bind msg -|- action dop:action
bind msg -|- listhand dop:listhand
bind msg -|- chanlist dop:chanlist
bind msg -|- addignore dop:addignore
bind msg -|- remignore dop:remignore
bind msg -|- quit dop:quit
bind msg -|- shutdown dop:quit
bind msg -|- jump dop:jump
bind msg -|- rehash dop:rehash
bind msg -|- regid dop:regid
bind msg -|- pass dop:pass
bind pub -|- [string trim $dop(chanchar)]op dop:cop
bind pub -|- [string trim $dop(chanchar)]chaninfo dop:cchaninfo
bind pub -|- [string trim $dop(chanchar)]join dop:cjoin
bind pub -|- [string trim $dop(chanchar)]part dop:cpart
bind pub -|- [string trim $dop(chanchar)]suspend dop:csuspend
bind pub -|- [string trim $dop(chanchar)]unsuspend dop:cunsuspend
bind pub -|- [string trim $dop(chanchar)]deop dop:cdeop
bind pub -|- [string trim $dop(chanchar)]voice dop:cvoice
bind pub -|- [string trim $dop(chanchar)]devoice dop:cdevoice
bind pub -|- [string trim $dop(chanchar)]kick dop:ckick
bind pub -|- [string trim $dop(chanchar)]ban dop:cban
bind pub -|- [string trim $dop(chanchar)]unban dop:cunban
bind pub -|- [string trim $dop(chanchar)]topic dop:ctopic
bind pub -|- [string trim $dop(chanchar)]motd dop:cmotd
bind pub -|- [string trim $dop(chanchar)]access dop:caccess
bind pub -|- [string trim $dop(chanchar)]clearmode dop:cclearmode
bind pub -|- [string trim $dop(chanchar)]status dop:cstatus
bind pub -|- [string trim $dop(chanchar)]set dop:cset
bind pub -|- [string trim $dop(chanchar)]shutdown dop:cquit
bind pub -|- [string trim $dop(chanchar)]quit dop:cquit
bind pub -|- [string trim $dop(chanchar)]banlist dop:cbanlist
bind pub -|- [string trim $dop(chanchar)]modinfo dop:cmodinfo
bind pub -|- [string trim $dop(chanchar)]action dop:caction
bind pub -|- [string trim $dop(chanchar)]remuser dop:cremuser
bind pub -|- [string trim $dop(chanchar)]adduser dop:cadduser
bind pub -|- [string trim $dop(chanchar)]removeall dop:cremoveall
bind pub -|- [string trim $dop(chanchar)]verify dop:cverify
bind pub -|- [string trim $dop(chanchar)]info dop:cinfo
bind pub -|- [string trim $dop(chanchar)]cycle dop:ccycle
bind pub -|- [string trim $dop(chanchar)]search dop:csearch
bind pub -|- [string trim $dop(chanchar)]remchan dop:cremchan
bind pub -|- [string trim $dop(chanchar)]purge dop:cremchan
bind pub -|- [string trim $dop(chanchar)]rehash dop:crehash
bind pub -|- [string trim $dop(chanchar)]addchan dop:caddchan
bind pub -|- [string trim $dop(chanchar)]register dop:caddchan
bind pub -|- [string trim $dop(chanchar)]chanlist dop:cchanlist
bind pub -|- [string trim $dop(chanchar)]msg dop:cmsg
bind pub -|- [string trim $dop(chanchar)]say dop:cmsg
bind pub -|- [string trim $dop(chanchar)]broadcast dop:cbroadcast
bind pub -|- [string trim $dop(chanchar)]addhand dop:caddhand
bind pub -|- [string trim $dop(chanchar)]remhand dop:cremhand
bind pub -|- [string trim $dop(chanchar)]listhand dop:clisthand
bind pub -|- [string trim $dop(chanchar)]addignore dop:caddignore
bind pub -|- [string trim $dop(chanchar)]remignore dop:cremignore
bind pub -|- [string trim $dop(chanchar)]jump dop:cjump
bind pub -|- [string trim $dop(chanchar)]showcommands dop:cshowcommands
bind pub -|- [string trim $dop(chanchar)]showignore dop:cignorelist
bind pub -|- [string trim $dop(chanchar)]help dop:chelp
bind dcc n dopusers dop:dccusers
bind dcc n dopchans dop:dccchans
bind dcc n dophelp dop:dcchelp
bind dcc n dopnick dop:dccnick
bind dcc n dopexp dop:dccexp

bind bot b EXP dop:botexp
bind bot b EXPR dop:botexpr

bind bot b DOPCHANSR dop:dopchans
bind bot b DOPCHANS dop:dopchansr

bind sign - * dop:dauthq
bind part - * dop:dauthpart 
bind raw - 001 dop:dauthall
bind join - * dop:autoop
bind mode - * dop:mode
bind nick - * dop:chnick
bind time - "30 * * * *" dop:updatetopics
bind time - "00 * * * *" dop:updatetopics
bind time - "00 21 * * *" dop:checkupdate
bind flud - * dop:fludcheck

set dop(tclversionn) "3.2"
set dop(tclversion) "Windop version $dop(tclversionn) (http://www.windop.com)"

#set ctcp-version "$dop(tclversion)"

proc dop:fludcheck {nick host hand type chan} {
	global dop
	if {$dop(dontkicklogged) == 1} {
		set access [dopGetuser $hand xtra dop:owner.access]
		if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
			return 0
		}
		if {[dopGetuser $hand xtra dop:auth] != 1} {
			return 0
		}
		if {[dopGetuser $hand xtra dop:authhost] != $host} {
			return 0
		}
		if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
			return 0
		}
		if {$access > $dop(dkickminaccess)} {
			return 1
		}
	}
	return 0
}

##Thanx to Jedi for the Idea
proc dop:dauthpart {nick host hand chan reason} { 
	global dop chanfile
	set found 0
	foreach channel [channels] { 
		if {[onchan $nick $channel] && [string tolower $channel] != [string tolower $chan]} { 
			set found 1
		} 
	} 
	if {$found == 0} { 
		dop:dauthq $nick $host $hand $chan $reason
	} {
		if {[string tolower [dop:readfile "$chanfile.dop" "$chan.floatlimit"]] == "on"} {
			if {[dop:readfile "$chanfile.dop" "$chan.floatperiod"] < 20} {
				dop:writefile "$chanfile.dop" "$chan.floatperiod" 20
			}
			utimer [dop:readfile "$chanfile.dop" "$chan.floatperiod"] "dop:setlimit $chan"
		}
	}
}

proc dop:reguser {nick host hand arg} {
	global dop botnick
	if {$dop(regusers) == 1} {
		if {[lindex $arg 1] == ""} {
			puthelp "NOTICE $nick :[dop:lang $hand 103 ""]"
			return 0
		}
		if {[dopGetuser $hand xtra dop:auth] == 1} {
			puthelp "NOTICE $nick :[dop:lang $hand 162 "$hand"]"
			return 0
		}
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			puthelp "NOTICE $nick :[dop:lang $hand 162 "$hand"]"
			return 0
		}
		if {[string tolower [dopGetuser $hand xtra dop:authnick]] == [string tolower $nick]} {
			puthelp "NOTICE $nick :[dop:lang $hand 162 "$hand"]"
			return 0
		}
		set hand [join [lindex [split $arg] 0]]
		set email [string tolower [join [lindex [split $arg] 1]]]
		if {[dopValiduser $hand]} {
			puthelp "NOTICE $nick :[dop:lang $hand 105 "[dop:lang $hand 125 ""]"]"
			return 0
		}
		foreach user [userlist] {
			if {[strlwr [dopGetuser $user xtra dop:email]] == [strlwr $email]} {
				puthelp "NOTICE $nick :[dop:lang $hand 105 "Email"]"
				return 0
			}
		}
		foreach nemail $dop(nomail) {
			if {[string match $nemail $email]} {
				puthelp "NOTICE $nick :[dop:lang $hand 106 "$dop(nomail)"]"
				return 0
			}
		}
		if {![string match "*@*.*" $email]} {
			puthelp "NOTICE $nick :[dop:lang $hand 301 ""]"
			return 0
		}

		set id "[rand 100000][rand 100000][rand 100000]"
		adduser $hand
		set temp [chattr $hand -hp]
		dopSetuser $hand xtra dop:verify $id
		dopSetuser $hand xtra dop:email $email
		dopSetuser $hand xtra dop:vdate [unixtime]
		if {$dop(regemail) == 1} {
			set fd [open "| $dop(sendmailp) -f \"$dop(regfrommail)\" -t" "w"]
			puts $fd "To: $email"
			puts $fd "From: $dop(regfrommail)"
			puts $fd "Subject: $dop(regusersubject)"
			puts $fd "[dop:lang $hand 124 "$hand $botnick $id"]\n"
			puts $fd "[dop:lang $hand 157 "$botnick $id"]"
			close $fd
			puthelp "NOTICE $nick :[dop:lang $hand 245 "$hand $email"]"
		} else {
			puthelp "NOTICE $nick :[dop:lang $hand 124 "$hand $botnick $id"]. [dop:lang $hand 157 "$botnick $id"]"
		}
	}
}

proc dop:regid {nick host hand arg} {
	global dop botnick
	set id [join [lindex [split $arg] 0]]
	set found 0
	if {$dop(regusers) == 1} {
		if {$id == ""} {
			puthelp "NOTICE $nick :[dop:lang $hand 126 ""]"
			return 0
		}
		foreach user [userlist] {
			if {[strlwr [dopGetuser $user xtra dop:verify]] == [strlwr $id]} {
				puthelp "NOTICE $nick :[dop:lang $hand 249 "$user [dopGetuser $user xtra dop:email]"]"
				puthelp "NOTICE $nick :[dop:lang $hand 250 "$botnick $user"]"
				dopSetuser $user xtra dop:verify ""
				dopSetuser $user xtra dop:vdate ""
				set found 1
			}
		}
		if {$found == 0} {
			puthelp "NOTICE $nick :[dop:lang $hand 251 ""]"
		}
	}

}

proc dop:pass {nick host hand arg} {
	global dop botnick
	if {$hand != "" && $hand != "*"} {	
		set pass [join [lindex [split $arg] 0]]
		set npass [join [lindex [split $arg] 1]]
	} else {
		set hand [join [lindex [split $arg] 0]]	
		set pass [join [lindex [split $arg] 1]]
		set npass [join [lindex [split $arg] 2]]
	}

	if {$pass == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 252 ""]"
		return 0
	}
	if {![dopValiduser $hand]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$hand"]"
		return 0
	}
	if {$dop(regusers) == 1} {
		if {[dopGetuser $hand xtra dop:verify] > 1} {
			puthelp "NOTICE $nick :[dop:lang $hand 259 ""]"
			return 0
		}
	}
	if {$npass != ""} {
		if {![dopPasswdok $hand $pass]} {
			puthelp "NOTICE $nick :[dop:lang $hand 253 "$hand"]"
			return 0
		}
		if {[string length $npass] < $dop(passlen)} {
			puthelp "NOTICE $nick :[dop:lang $hand 254 "$dop(passlen)"]"
			return 0
		}
		dopSetuser $hand pass $npass ""
		setuser $hand pass $npass
		puthelp "NOTICE $nick :[dop:lang $hand 255 "$npass"]"
		return 0
	} else {
		if {![dopPasswdok $hand ""]} {
			puthelp "NOTICE $nick :[dop:lang $hand 256 "$botnick"]"
			return 0
		}
	}
	if {[string length $pass] < $dop(passlen)} {
		puthelp "NOTICE $nick :[dop:lang $hand 254 "$dop(passlen)"]"
		return 0
	}
	dopSetuser $hand pass $pass ""
	setuser $hand pass $pass
	puthelp "NOTICE $nick :[dop:lang $hand 255 "$pass"]"
}

proc dop:chnick {nick host hand chan nnick} {
	if {![dopValiduser $hand]} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		return 0
	}
	set host [dop:notild $host]
	delhost $hand "$nick!*$host"
	setuser $hand hosts "$nnick!*$host"
	dopSetuser $hand xtra dop:authnick $nnick
}
proc dop:botexp {bot command arg} {
	set numd [join [lindex [split $arg] 0]]
	set hand [join [lindex [split $arg] 1]]
	set idx [join [lindex [split $arg] 2]]

	if {[matchattr $hand +n]} {
		set found 0
		foreach user [userlist] {
			set seen [dopGetuser $user xtra dop:lastlog]
			if {$seen == 0 || $seen == "" || $seen == "never"} {
				set seen "[dop:lang $hand 2 ""]"
				set day "100000"
			} {
				set day [lindex [dop:ctime $seen] 3]
				set seen [dop:seen $user]
			}
			
			if {$day >= $numd} {
				set found 1
				putbot $bot "EXPR $hand $idx $user $seen"
			}
		}
		if {$found == 0} {
			putbot $bot "EXPR $hand $idx"
		}
	}

}

proc dop:botexpr {bot command arg} {
	set hand [join [lindex [split $arg] 0]]
	set idx [join [lindex [split $arg] 1]]
	set user [join [lindex [split $arg] 2]]
	set seen [join [lindex [split $arg] 3]]
	if {$user == ""} {
		putidx $idx "$bot -> [dop:lang $hand 240 ""]"
		return 0
	}
	
	putidx $idx "$bot -> [dop:lang $hand 3 "$user $seen"]"
}

proc dop:dccexp {hand idx arg} {
	global dop 
	set numd [join [lindex [split $arg] 0]]
	set bots [join [lrange [split $arg] 1 end]]

	if {$numd < 0 || $numd > 10000} {
		set bots [lrange $arg 0 end]
		set numd 3
	}

	if {$numd == ""} { set numd 3 }
	putdcc $idx "[dop:lang $hand 1 ""]"
	set found 0
	foreach user [userlist] {
		set seen [dopGetuser $user xtra dop:lastlog]
		if {$seen == 0 || $seen == "" || $seen == "never"} {
			set seen "[dop:lang $hand 2 ""]"
			set day "100000"
		} {
			set day [lindex [dop:ctime $seen] 3]
			set seen [dop:seen $user]
		}
		if {$day >= $numd && ![matchattr $user +b]} {
			set found 1
			putdcc $idx "[dop:lang $hand 3 "$user $seen"]"
		}
	}
	if {$found == 0} {
		putdcc $idx "[dop:lang $hand 240 ""]"
	}
	if {$bots != ""} {
		if {$bots == "*"} {
			putallbots "EXP $numd $hand $idx"
			return 0
		}
		foreach bot $bots {
			putbot $bot "EXP $numd $hand $idx"
		}
	}
}

proc dop:dccusers {hand idx arg} {
	global dop  	
	set flag [lrange $arg 0 end]
	foreach user [userlist] {
		if {$flag != ""} {
			if {![matchattr $user $flag]} {
				continue
			} else {
				if {[string match $flag $user]} {
					continue
				}

			}
		}
		set chan ""
		set channels 0
		set hosts [getuser $user hosts]
		set identified [dopGetuser $user xtra dop:auth]
		set lang [dopGetuser $user xtra dop:lang]
		if {$identified == 1} {
			set identified "[dop:lang $user 4 ""]"
		} { 			
			set identified "[dop:lang $user 5 ""]"
		}
		set seen [dop:seen $user]
		if {$seen == 0} {
			set seen [dop:lang $hand 2 ""]
		}
		set email [dopGetuser $user xtra dop:email]

		set vdate ""
		if {[dopGetuser $user xtra dop:vdate] != ""} {
			set vdate [dop:vctime [dopGetuser $user xtra dop:vdate]]
			set vdate [dop:lang $hand 258 "$vdate"]
		}

		putdcc $idx "\002$user"
		putdcc $idx "  \002[dop:lang $hand 6 ""]:\002 $hosts"
		putdcc $idx "  \002[dop:lang $hand 7 ""]: $identified"
		putdcc $idx "  \002[dop:lang $hand 8 ""]:\002 $lang"
		putdcc $idx "  \002[dop:lang $hand 9 ""]:\002 $seen"
		putdcc $idx "  \002[dop:lang $hand 257 ""]\002 $email $vdate"
		putdcc $idx "  \002[dop:lang $hand 10 ""]:\002"

		foreach chan [channels] {
			set access [dopGetuser $user xtra dop:$chan.access]
			if {$access > 0} {
				incr channels 1
				putdcc $idx "    $chan -> $access"
			}
		}
		if {[dopGetuser $user xtra dop:owner.access] > 500} {
			putdcc $idx "    * -> [dopGetuser $user xtra dop:owner.access]"
		}
		if {$channels == 0} {
			if {[dopGetuser $user xtra dop:owner.access] < 500} {
				putdcc $idx "    [dop:lang $hand 11 ""]."
			}
		}
	}
}
proc dop:dccchans {hand idx arg} {
	global dop chanfile
	set bots [join [lrange [split $arg] 0 end]]
	foreach chan [channels] {
		set user ""
		set users 0
		set url [dop:readfile "$chanfile.dop" "$chan.url"]
		set desc [dop:readfile "$chanfile.dop" "$chan.desc"]
		set keywords [dop:readfile "$chanfile.dop" "$chan.keywords"]
		putdcc $idx "\002$chan"
		foreach user [userlist] {
			set hosts [getuser $user hosts]
			set access [dopGetuser $user xtra dop:$chan.access]
			if {$access > 0} {
				incr users 1
				putdcc $idx "    $user ($access)"
			}
		}
		if {$users == 0} {
			putdcc $idx "    [dop:lang $hand 11 ""]."
		}
		if {$url != ""} {
			putdcc $idx "    [dop:lang $hand 12 ""]: $url"
		}
		if {$desc != ""} {
			putdcc $idx "    [dop:lang $hand 13 ""]: $desc"
		}
		if {$keywords != ""} {
			putdcc $idx "    [dop:lang $hand 14 ""]: $keywords"
		}
	}
	if {$bots != ""} {
		if {$bots == "*"} {
			putallbots "DOPCHANS $hand $idx"
			return 0
		}
		foreach bot $bots {
			putbot $bot "DOPCHANS $hand $idx"
		}
	}
}
proc dop:dopchansr {bot command arg} {
	set hand [join [lindex [split $arg] 0]]
	set idx [join [lindex [split $arg] 1]]

	global dop chanfile
	foreach chan [channels] {
		set user ""
		set usersr ""
		set users 0
		set url [dop:readfile "$chanfile.dop" "$chan.url"]
		set desc [dop:readfile "$chanfile.dop" "$chan.desc"]
		set keywords [dop:readfile "$chanfile.dop" "$chan.keywords"]

		foreach user [userlist] {
			set hosts [getuser $user hosts]
			set access [dopGetuser $user xtra dop:$chan.access]
			
			if {$access > 0} {
				incr users 1
				append usersr "$user%$access|"
			}
		}
		if {$users == 0} {
			set usersr "-|"
		}
		putbot $bot "DOPCHANSR $idx $hand $chan$usersr$url$desc$keywords"
	}
}

proc dop:dopchans {bot command arg} {
	set idx [join [lindex [split $arg] 0]]
	set hand [join [lindex [split $arg] 1]]
	set msg [join [lrange [split $arg] 2 end]]

	set chan [join [lindex [split $msg ""] 1]]
	set user [join [lindex [split $msg ""] 2]]
	set url [join [lindex [split $msg ""] 3]]
	set desc [join [lindex [split $msg ""] 4]]
	set keywords [join [lindex [split $msg ""] 5]]
	set usersplit [join [lrange [split $user "|"] 0 end]]
	
	putdcc $idx "$bot->\002$chan"
	set users 0
	set url ""
	set desc ""
	set keywords ""
	foreach user $usersplit {
		set name [join [lindex [split $user "%"] 0]]
		set access [join [lindex [split $user "%"] 1]]
		if {$name != "-"} {
			incr users 1
			putidx $idx "$bot->    $name ($access)"
		}
	}
	if {$users == 0} {
		putidx $idx "$bot->    [dop:lang $hand 11 ""]."
	}
	if {$url != ""} {
		putidx $idx "$bot->    [dop:lang $hand 12 ""]: $url"
	}
	if {$desc != ""} {
		putidx $idx "$bot->    [dop:lang $hand 13 ""]: $desc"
	}
	if {$keywords != ""} {
		putidx $idx "$bot->    [dop:lang $hand 14 ""]: $keywords"
	}
	
}
proc dop:dccnick {hand idx arg} {
	global dop botnick nick
	set nnick [lindex $arg 0]
	if {$nnick == ""} {
		putidx $idx "[dop:lang $hand 15 ""]: $botnick"
		return 0
	}
	set nick $nnick
	putidx $idx "[dop:lang $hand 15 ""]: $botnick"
}
proc dop:dcchelp {hand idx arg} {
	global dop
	putidx $idx "[dop:lang $hand 16 ""]:"
	putidx $idx "  \002.dopusers"
	putidx $idx "  \002.dopchans"
	putidx $idx "  \002.dopnick"
	putidx $idx "  \002.dopexp \[[dop:lang $hand 17 ""]\] \[[dop:lang $hand 241 ""]\]"
}
proc dop:updatetopics {min hour day month year} {
	global dop chanfile	
	foreach chan [channels] {
		set at [dop:readfile "$chanfile.dop" "$chan.at"]
		if {$at == "on"} {
			dop:writefile "$chanfile.dop" "$chan.atr" "1"
		}
	}
}
proc dop:mode {nick host hand chan mode victim} {
	global chanfile botnick
	if {[dop:readfile "$chanfile.dop" "$chan.noop"] == "on"} {
		dop:noopset $chan
	}
	if {[string match "*+o*" $mode]} {
		if {[dop:readfile "$chanfile.dop" "$chan.strictop"] == "on"} {
			dop:writefile "$chanfile.dop" "$chan.strictopn" "1"
			dop:strictop $chan
		}
	}
}
proc dop:settopic {chan now} {
	global chanfile
	set at [dop:readfile "$chanfile.dop" "$chan.at"]
	set atr [dop:readfile "$chanfile.dop" "$chan.atr"]

	if {$at == "on"} {
		if {$atr == 1 || $now == 1} {
			set desc [dop:readfile "$chanfile.dop" "$chan.desc"]
			set url [dop:readfile "$chanfile.dop" "$chan.url"]
			if {$url != ""} { set url " ($url)" }
			puthelp "TOPIC $chan :$desc$url"
			dop:writefile "$chanfile.dop" "$chan.atr" "0"
		}
	}
}

proc dop:autoop {nick host hand chan} {
	global dop chanfile

	if {[string tolower [dop:readfile "$chanfile.dop" "$chan.floatlimit"]] == "on"} {
		if {[dop:readfile "$chanfile.dop" "$chan.floatperiod"] < 20} {
			dop:writefile "$chanfile.dop" "$chan.floatperiod" 20
		}
		utimer [dop:readfile "$chanfile.dop" "$chan.floatperiod"] "dop:setlimit $chan"
	}

	dop:settopic $chan 0
	if {[dopGetuser $hand xtra dop:owner.access] < 501} {
		if {[dopGetuser $hand xtra dop:$chan.access] < 75} {
			return 0
		}
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.suspend] > 0 && [dopGetuser $hand xtra dop:owner.access] < 501} {
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.automode] == "op"} { 
		pushmode $chan +o $nick
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.automode] == "voice"} { 
		pushmode $chan +v $nick
		return 0
	}
}
proc dop:setlimit {chan} {
	global dop chanfile
	
	if {[string tolower [dop:readfile "$chanfile.dop" "$chan.floatlimit"]] == "on"} {
		if {[dop:readfile "$chanfile.dop" "$chan.floatmargin"] < 2} {
			dop:writefile "$chanfile.dop" "$chan.floatmargin" 3
		}
		if {[dop:readfile "$chanfile.dop" "$chan.floatmax"] < 0} {
			dop:writefile "$chanfile.dop" "$chan.floatmax" 0
		}
		if {[dop:readfile "$chanfile.dop" "$chan.floatperiod"] < 0} {
			dop:writefile "$chanfile.dop" "$chan.floatperiod" 20
		}
		if {[dop:readfile "$chanfile.dop" "$chan.floatgrace"] < 0} {
			dop:writefile "$chanfile.dop" "$chan.floatgrace" 3
		}
		set usercnt 0
		foreach user [chanlist $chan] {
			incr usercnt 1
		}
		set curlim [dop:getlimit $chan]
		set limit 0
		incr limit $usercnt
		incr limit [dop:readfile "$chanfile.dop" "$chan.floatmargin"]
		
		set floatgrace [dop:readfile "$chanfile.dop" "$chan.floatgrace"]
		set grace [expr $curlim - $limit]

		if {$grace >= $floatgrace} {
			if {$limit > [dop:readfile "$chanfile.dop" "$chan.floatmax"] && [dop:readfile "$chanfile.dop" "$chan.floatmax"] != 0} {
				set limit [dop:readfile "$chanfile.dop" "$chan.floatmax"]
			}
			pushmode $chan +l $limit
		}
		if {$grace <= [expr $floatgrace * -1]} {
			if {$limit > [dop:readfile "$chanfile.dop" "$chan.floatmax"] && [dop:readfile "$chanfile.dop" "$chan.floatmax"] != 0} {
				set limit [dop:readfile "$chanfile.dop" "$chan.floatmax"]
			}
			pushmode $chan +l $limit
		}
		
	}
}

proc dop:chelp {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:help $nick $host $hand "$arg"
}
proc dop:help {nick host hand arg} {
	global dop botnick
	set com [string tolower [lindex $arg 0]]

	if {$com == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 18 ""]"
		return 0
	}
	switch -- $com {
		"op" { 
			puthelp "NOTICE $nick :[dop:lang $hand 19 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 20 "$botnick"]"
			}
		"deop" { 
			puthelp "NOTICE $nick :[dop:lang $hand 21 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 22 ""]"
			}
		"voice" { 
			puthelp "NOTICE $nick :[dop:lang $hand 23 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 24 ""]"
			}
		"devoice" { 
			puthelp "NOTICE $nick :[dop:lang $hand 25 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 26 ""]"
			}
		"join" { 
			puthelp "NOTICE $nick :[dop:lang $hand 267 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 268 "$botnick"]"
			}
		"part" { 
			puthelp "NOTICE $nick :[dop:lang $hand 269 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 270 "$botnick"]"
			}
		"suspend" { 
			puthelp "NOTICE $nick :[dop:lang $hand 271 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 272 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 273 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 274 ""]"
			}
		"unsuspend" { 
			puthelp "NOTICE $nick :[dop:lang $hand 275 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 276 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 277 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 278 ""]"
			}
		"access" { 
			puthelp "NOTICE $nick :[dop:lang $hand 27 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 28 ""]"
			}
		"login" { 
			puthelp "NOTICE $nick :[dop:lang $hand 29 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 30 ""]"
			}
		"dauth" { 
			puthelp "NOTICE $nick :[dop:lang $hand 31 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 32 ""]"
			}
		 "help" { 
			puthelp "NOTICE $nick :[dop:lang $hand 33 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 34 ""]"
			}
		"uptime" { 
			puthelp "NOTICE $nick :[dop:lang $hand 35 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 36 ""]"
			}
		"verify" { 
			puthelp "NOTICE $nick :[dop:lang $hand 37 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 38 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 39 ""]"
			}
		"status" { 
			puthelp "NOTICE $nick :[dop:lang $hand 40 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 41 ""]"
			}
		"info" { 
			puthelp "NOTICE $nick :[dop:lang $hand 42 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 43 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 44 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 45 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 46 ""]"
			}
		"showcommands" { 
			puthelp "NOTICE $nick :[dop:lang $hand 47 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 48 ""]"
			}
		 "ban" { 
			puthelp "NOTICE $nick :[dop:lang $hand 49 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 50 "$botnick"]"
			}
		"unban" { 
			puthelp "NOTICE $nick :[dop:lang $hand 51 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 52 "$botnick"]"
			}
		"reguser" { 
			puthelp "NOTICE $nick :[dop:lang $hand 279 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 280 "$botnick"]"
			}
		"cycle" { 
			puthelp "NOTICE $nick :[dop:lang $hand 295 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 296 "$botnick"]"
			}
		"regid" { 
			puthelp "NOTICE $nick :[dop:lang $hand 281 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 282 "$botnick"]"
			}
		"pass" { 
			puthelp "NOTICE $nick :[dop:lang $hand 283 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 284 "$botnick"]"
			}
		"topic" { 
			puthelp "NOTICE $nick :[dop:lang $hand 53 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 54 "$botnick"]"
			}
		"clearmode" { 
			puthelp "NOTICE $nick :[dop:lang $hand 55 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 56 ""]"
			}
		"kick" { 
			puthelp "NOTICE $nick :[dop:lang $hand 57 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 58 "$botnick"]"
			}
		"set" { 
			puthelp "NOTICE $nick :[dop:lang $hand 59 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 60 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 61 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 62 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 63 ""]"
			}
		"invite" { 
			puthelp "NOTICE $nick :[dop:lang $hand 64 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 65 "$botnick"]"
			}
		"banlist" { 
			puthelp "NOTICE $nick :[dop:lang $hand 66 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 67 ""]"
			}
		"adduser" { 
			puthelp "NOTICE $nick :[dop:lang $hand 68 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 69 ""]"
			}
		"remuser" { 
			puthelp "NOTICE $nick :[dop:lang $hand 70 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 71 ""]"
			}
		"modinfo" { 
			puthelp "NOTICE $nick :[dop:lang $hand 72 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 73 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 74 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 75 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 76 ""]"
			puthelp "NOTICE $nick :[dop:lang $hand 77 ""]"
			}
		"showignore" { 
			puthelp "NOTICE $nick :[dop:lang $hand 80 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 81 "$botnick"]"
			}
		"chaninfo" { 
			puthelp "NOTICE $nick :[dop:lang $hand 82 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 83 ""]"
			}
		"motd" { 
			puthelp "NOTICE $nick :[dop:lang $hand 84 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 85 "$botnick $botnick"]"
			}
		"search" { 
			puthelp "NOTICE $nick :[dop:lang $hand 86 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 87 "$botnick"]"
			puthelp "NOTICE $nick :[dop:lang $hand 88 ""]"
			}
		default {
			puthelp "NOTICE $nick :[dop:lang $hand 89 ""]"
			}
	}

}
proc dop:cmotd {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:motd $nick $host $hand ""
}
proc dop:motd {nick host hand arg} {
	global dop botnick
	
	puthelp "NOTICE $nick :$botnick's MOTD"
	set motd1 [lindex [split $dop(botmotd) ""] 0]
	set motd2 [lindex [split $dop(botmotd) ""] 1]
	set motd3 [lindex [split $dop(botmotd) ""] 2]
	set motd4 [lindex [split $dop(botmotd) ""] 3]
	set motd5 [lindex [split $dop(botmotd) ""] 4]
	set motd6 [lindex [split $dop(botmotd) ""] 5]
	if {$motd1 != ""} { puthelp "NOTICE $nick :$motd1" }
	if {$motd2 != ""} { puthelp "NOTICE $nick :$motd2" }
	if {$motd3 != ""} { puthelp "NOTICE $nick :$motd3" }
	if {$motd4 != ""} { puthelp "NOTICE $nick :$motd4" }
	if {$motd5 != ""} { puthelp "NOTICE $nick :$motd5" }
	if {$motd6 != ""} { puthelp "NOTICE $nick :$motd6" }


}

proc dop:cremoveall {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:removeall $nick $host $hand "$chan"
}
proc dop:removeall {nick host hand arg} {
	global dop botnick
	set chan [join [lindex [split $arg] 0]]
	set access [dopGetuser $hand xtra dop:owner.access]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 90 ""]"
		return 0
	}
	
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$access < $dop(removeall)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 94 "$nick $host $hand $access $chan"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 94 "$nick $host $hand $access $chan"]"
		}
	}
	set zap 0
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(removeall)} {
				foreach user [userlist] {
					if {[dopGetuser $user xtra dop:$chan.access] > 0} {
						dopSetuser $user xtra dop:$chan.access 0
						incr zap 1
					}
				}
			}
		}
	}
	puthelp "NOTICE $nick :[dop:lang $hand 95 "$zap $chan"]"
}

proc dop:uptime {nick host hand arg} {
	global dop uptime
      #set tmp [catch {exec uptime} uptime]

	set access [dopGetuser $hand xtra dop:owner.access]

	set tmp [dop:ctime $uptime]
	set day [lindex $tmp 3]
	set hour [lindex $tmp 2]
	set minute [lindex $tmp 1]
	set second [lindex $tmp 0]
	if {$hour < 10} { set hour "0$hour" }
	if {$minute < 10} { set minute "0$minute" }
	if {$second < 10} { set second "0$second" }

	set tmp ""
	append tmp "$day [dop:lang $hand 96 ""], $hour:$minute:$second"
	set chans 0
	foreach ch [channels] {
		incr chans 1
	}
	set nmbbot 0
	foreach bot [bots] {
		incr nmbbot
	}
	puthelp "NOTICE $nick :[dop:lang $hand 97 ""]: $tmp, [dop:lang $hand 98 ""]: $chans, [dop:lang $hand 99 ""]: $dop(tclversion), [dop:lang $hand 100 ""]: $nmbbot"
}
proc dop:cshowcommands  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:showcommands $nick $host $hand "$chan $arg"
}
proc dop:showcommands {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 101 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }

	if {[dopGetuser $hand xtra dop:auth] != 1} {
		set access 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		set access 0
	}	
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		set access 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		set access 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		set access 0
	}
	
	set cmd ""
	set cmds "anything:1000 op:$dop(op) deop:$dop(deop) voice:$dop(voice) devoice:$dop(devoice) ban:$dop(ban) removeall:$dop(removeall) "
	append cmds "topic:$dop(topic) unban:$dop(unban) kick:$dop(kick) banlist:$dop(banlist) adduser:$dop(adduser) "
	append cmds "remuser:$dop(remuser) register:$dop(addchan) chanlist:$dop(chanlist) purge:$dop(remchan) suspend:$dop(suspend) unsuspend:$dop(unsuspend) "
	append cmds "set:$dop(set) say:$dop(msg) broadcast:$dop(broadcast) addhand:$dop(addhand) join:$dop(join) part:$dop(part) "
	append cmds "remhand:$dop(remhand) listhand:$dop(listhand) access:$dop(access) dauth:$dop(dauth) showcommands:$dop(showcommands) "
	append cmds "modinfo:$dop(modinfo) uptime:$dop(uptime) info:$dop(info) verify:$dop(verify) clearmode:$dop(clearmode) "
	append cmds "shutdown:$dop(quit) showignore:$dop(showignore) addignore:$dop(addignore) remignore:$dop(remignore) "
	append cmds "chaninfo:$dop(chaninfo) motd:$dop(motd) invite:$dop(invite) rehash:$dop(rehash) jump:$dop(jump) status:$dop(status) "
	append cmds "action:$dop(action) cycle:$dop(cycle) "
	
	if {$dop(regusers) == 1} {
		append cmds "reguser:$dop(reguser) regid:$dop(regid) pass:$dop(pass) "
	}

	if {$dop(chancom) == 1 && $dop(showchancom) == 1} {
		append cmds "[string trim $dop(chanchar)]op:$dop(op) [string trim $dop(chanchar)]deop:$dop(deop) [string trim $dop(chanchar)]removeall:$dop(removeall) "
		append cmds "[string trim $dop(chanchar)]voice:$dop(voice) [string trim $dop(chanchar)]devoice:$dop(devoice) "
		append cmds "[string trim $dop(chanchar)]ban:$dop(ban) [string trim $dop(chanchar)]topic:$dop(topic) "
		append cmds "[string trim $dop(chanchar)]unban:$dop(unban) [string trim $dop(chanchar)]kick:$dop(kick) "
		append cmds "[string trim $dop(chanchar)]online:$dop(conline) [string trim $dop(chanchar)]clearmode:$dop(clearmode) "
		append cmds "[string trim $dop(chanchar)]status:$dop(status) [string trim $dop(chanchar)]set:$dop(set) "
		append cmds "[string trim $dop(chanchar)]banlist:$dop(banlist) [string trim $dop(chanchar)]modinfo:$dop(modinfo) "
		append cmds "[string trim $dop(chanchar)]remuser:$dop(remuser) [string trim $dop(chanchar)]adduser:$dop(adduser) "
		append cmds "[string trim $dop(chanchar)]verify:$dop(verify) [string trim $dop(chanchar)]purge:$dop(remchan) "
		append cmds "[string trim $dop(chanchar)]register:$dop(addchan) [string trim $dop(chanchar)]chanlist:$dop(chanlist) "
		append cmds "[string trim $dop(chanchar)]say:$dop(msg) [string trim $dop(chanchar)]broadcast:$dop(broadcast) "
		append cmds "[string trim $dop(chanchar)]addhand:$dop(addhand) [string trim $dop(chanchar)]remhand:$dop(remhand) "
		append cmds "[string trim $dop(chanchar)]listhand:$dop(listhand) [string trim $dop(chanchar)]showignore:$dop(showignore) "
		append cmds "[string trim $dop(chanchar)]showcommands:$dop(showcommands) [string trim $dop(chanchar)]addignore:$dop(addignore) "
		append cmds "[string trim $dop(chanchar)]remignore:$dop(remignore) [string trim $dop(chanchar)]chaninfo:$dop(chaninfo) "
		append cmds "[string trim $dop(chanchar)]motd:$dop(motd) [string trim $dop(chanchar)]rehash:$dop(rehash) "
		append cmds "[string trim $dop(chanchar)]jump:$dop(jump) [string trim $dop(chanchar)]shutdown:$dop(quit) [string trim $dop(chanchar)]info:$dop(info) "
		append cmds "[string trim $dop(chanchar)]unsuspend:$dop(unsuspend) [string trim $dop(chanchar)]suspend:$dop(suspend) "
		append cmds "[string trim $dop(chanchar)]action:$dop(action) [string trim $dop(chanchar)]cycle:$dop(cycle) "
	}
	for {set b 0} {$b < 1001} {incr b} {
		set i($b) ""
	}
	foreach cmd $cmds {
		set level [lindex [split $cmd ":"] 1]
		append i($level) "[lindex [split $cmd ":"] 0] "
	}
	
	set e 1001
	for {set a 0} {$a < 1001} {incr a} {
		incr e -1
		if {$i($e) != ""} { 
			if {$access >= $e} {
				if {$e < 10} {
					puthelp "notice $nick :[dop:lang $hand 102 ""]    $e: $i($e)"
				} {
					if {$e < 100} {
						puthelp "notice $nick :[dop:lang $hand 102 ""]   $e: $i($e)"
					} {
						if {$e < 1000} {
							puthelp "notice $nick :[dop:lang $hand 102 ""]  $e: $i($e)"
						} {
							puthelp "notice $nick :[dop:lang $hand 102 ""] $e: $i($e)"
						}
					}
				}
			}
		}
	}
	return 0
}
proc dop:caddignore {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:addignore $nick $host $hand "$arg"
}
proc dop:addignore {nick host hand arg} {
	global dop 	
	set reason ""
	set hosts [join [lindex [split $arg] 0]]	
	if {$hosts == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 107 ""]"
		return 0
	}
	set reason [lrange $arg 1 end]
	set access [dopGetuser $hand xtra dop:owner.access]
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(addignore)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 108 "$nick $host $hand $access $hosts"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 108 "$nick $host $hand $access $hosts"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(addignore)} {
				if {$reason == ""} { set reason "[dop:lang $hand 109 ""]" }
				newignore $hosts $nick $reason
				puthelp "NOTICE $nick :[dop:lang $hand 110 "$hosts"]"
			}
		}
	}
}
proc dop:cremignore {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:remignore $nick $host $hand "$arg"
}
proc dop:remignore {nick host hand arg} {
	global dop
	set hosts [join [lindex [split $arg] 0]]
	if {$hosts == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 111 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:owner.access]
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(remignore)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		puthelp "NOTICE $nick :[dop:lang "adminreportuser" 112 "$nick $host $hand $access $hosts"]"
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(remignore)} {
				killignore $hosts
				puthelp "NOTICE $nick :[dop:lang $hand 113 "$hosts"]"
			}
		}
	}
}
proc dop:cjump  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:jump $nick $host $hand "$arg"
}
proc dop:jump {nick host hand arg} {
	global dop
	set server [join [lrange [split $arg] 0 end]]
	if {[join [lindex [split $arg] 1]] == "" && [join [lindex [split $arg] 0]] != ""} {
		append server " 6667"
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:owner.access]
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(jump)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$server == ""} {
		set serva "Next server in list"
	} {
		set serva $server
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			putquick "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 114 "$nick $host $hand $access $serva"]"
		} {
			putquick "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 114 "$nick $host $hand $access $serva"]"

		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(jump)} {
				jump $server
			}
		}
	}


}
proc dop:cquit  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:quit $nick $host $hand "$arg"
}
proc dop:quit {nick host hand arg} {
	global dop
	set reason [join [lrange [split $arg] 0 end]]
	if {$reason == ""} {
		set reason "[dop:lang $hand 115 ""]"
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:owner.access]
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(quit)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			putquick "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 116 "$nick $host $hand $access"]"
		} {
			putquick "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 116 "$nick $host $hand $access"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(quit)} {
				die "$reason"
			}
		}
	}


}
proc dop:cchanlist  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:chanlist $nick $host $hand "$chan $arg"
} 
proc dop:chanlist {nick host hand arg} {
	global dop
	set access [dopGetuser $hand xtra dop:owner.access]
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(chanlist)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 117 "$nick $host $hand $access"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 117 "$nick $host $hand $access"]"
		}
	}
	set found 0
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(chanlist)} {
				foreach chan [channels] {
					puthelp "NOTICE $nick :- $chan"
					set found 1
				}
			}
 		}
	}
	if {$found == 0} { 
		puthelp "NOTICE $nick :[dop:lang $hand 118 ""]"
	} {
		puthelp "NOTICE $nick :[dop:lang $hand 119 ""]"
	}


}
proc dop:caction  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:action $nick $host $hand "$chan $arg"
}
proc dop:action {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set msg [join [lrange [split $arg] 1 end]]

	if {$dop(chanownsay) == 1} {
		set access [dopGetuser $hand xtra dop:$chan.access]
		if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	} {
		set access [dopGetuser $hand xtra dop:owner.access]
	}
	if {$msg == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 293 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(action)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 294 "$nick $host $hand $access $chan $msg"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 294 "$nick $host $hand $access $chan $msg"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(action)} {
				if {$dop(fastsay) == 1} {
					putquick "PRIVMSG $chan :\001ACTION $msg\001"
				} {
					puthelp "PRIVMSG $chan :\001ACTION $msg\001"
				}
			}
		}
	}


}
proc dop:cmsg  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:msg $nick $host $hand "$chan $arg"
}
proc dop:msg {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set msg [join [lrange [split $arg] 1 end]]

	if {$dop(chanownsay) == 1} {
		set access [dopGetuser $hand xtra dop:$chan.access]
		if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	} {
		set access [dopGetuser $hand xtra dop:owner.access]
	}
	
	
	if {$msg == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 120 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(msg)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 121 "$nick $host $hand $access $chan $msg"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 121 "$nick $host $hand $access $chan $msg"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(msg)} {
				if {$dop(fastsay) == 1} {
					putquick "PRIVMSG $chan :$msg"
				} {
					puthelp "PRIVMSG $chan :$msg"
				}
			}
		}
	}


}
proc dop:cbroadcast  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:broadcast $nick $host $hand "$arg"
}
proc dop:broadcast {nick host hand arg} {
	global dop
	set msg [join [lrange [split $arg] 0 end]]
	set access [dopGetuser $hand xtra dop:owner.access]
	if {$msg == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 122 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(msg)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 123 "$nick $host $hand $access $msg"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 123 "$nick $host $hand $access $msg"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(msg)} {
				foreach chan [channels] {
					puthelp "PRIVMSG $chan :$msg"
				}
			}
		}
	}


}
proc dop:crehash  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:rehash $nick $host $hand "$arg"
}
proc dop:rehash {nick host hand arg} {
	global dop
	set access [dopGetuser $hand xtra dop:owner.access]
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(rehash)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 127 "$nick $host $hand $access"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 127 "$nick $host $hand $access"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(rehash)} {
				rehash
				puthelp "NOTICE $nick :[dop:lang $hand 128 ""]"
			}
		}
	}


}
proc dop:caddhand  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:addhand $nick $host $hand "$arg"
}
proc dop:addhand {nick host hand arg} {
	global dop
	set hands [join [lindex [split $arg] 0]]
	set email [join [lindex [split $arg] 1]]
	set access [dopGetuser $hand xtra dop:owner.access]
	if {$hands == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 129 ""]"
		return 0
	}

	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopValiduser $hands]} {
		puthelp "NOTICE $nick :[dop:lang $hand 130 "$hands"]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(addhand)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 131 "$nick $host $hand $access $hands"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 131 "$nick $host $hand $access $hands"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(addhand)} {
				adduser $hands
				set temp [chattr $hands -hp]
				puthelp "NOTICE $nick :[dop:lang $hand 132 "$hands"]"
				dopSetuser $hands xtra dop:lang $dop(deflang)
				if {$email != ""} {
					dopSetuser $hands xtra dop:email $email
				}
			}
		}
	}


}
proc dop:cchaninfo  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:chaninfo $nick $host $hand "$chan"
}
proc dop:chaninfo {nick host hand arg} {
	global dop chanfile
	set chan [join [lindex [split $arg] 0]]
	
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 133 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set found 0
	foreach user [userlist] {
		if {[dopGetuser $user xtra dop:$chan.access] == 500} {
			puthelp "NOTICE $nick :[dop:lang $hand 134 "$chan"]"
			if {[dop:seen $user] != 0 || [dop:seen $user] != ""} {
				set seen "[dop:lang $hand 135 "[dop:seen $user]"]"
			}
			puthelp "NOTICE $nick :$user $seen"
			set found 1
			set url [dop:readfile "$chanfile.dop" "$chan.url"]
			set desc [dop:readfile "$chanfile.dop" "$chan.desc"]
			set keywords [dop:readfile "$chanfile.dop" "$chan.keywords"]
			if {$desc != ""} {
				puthelp "NOTICE $nick :[dop:lang $hand 13 ""]: $desc"
			}
			if {$keywords != ""} {
				puthelp "NOTICE $nick :[dop:lang $hand 14 ""]: $keywords"
			}
			if {$url != ""} {
				puthelp "NOTICE $nick :[dop:lang $hand 12 ""]: $url"
			}
		}
	}
	if {$found == 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 136 "$chan"]"
	}

}
proc dop:clisthand  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:listhand $nick $host $hand "$chan $arg"
}
proc dop:listhand {nick host hand arg} {
	global dop
	set access [dopGetuser $hand xtra dop:owner.access]
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(listhand)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 137 "$nick $host $hand $access"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 137 "$nick $host $hand $access"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(listhand)} {
				foreach user [userlist] {
					set vdate ""
					if {[dopGetuser $user xtra dop:vdate] != ""} {
						set vdate [dop:vctime [dopGetuser $user xtra dop:vdate]]
						set vdate [dop:lang $hand 258 "$vdate"]
					}
					if {[dopGetuser $user xtra dop:owner.access] > 500} {
						puthelp "NOTICE $nick :[dop:lang $hand 138 "$user"] $vdate"
					}
					if {[dopGetuser $user xtra dop:owner.access] < 1} {
						puthelp "NOTICE $nick :[dop:lang $hand 139 "$user"] $vdate"
					}
				}
				puthelp "NOTICE $nick :[dop:lang $hand 140 ""]"
			}
		}
	}

}
proc dop:cremhand  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:remhand $nick $host $hand "$arg"
}
proc dop:remhand {nick host hand arg} {
	global dop 	
	set hands [join [lindex [split $arg] 0]]
	set access [dopGetuser $hand xtra dop:owner.access]
	if {$hands == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 141 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![dopValiduser $hands]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$hands"]"
		return 0
	}
	set accesss [dopGetuser $hands xtra dop:owner.access]
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $accesss} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$access < $dop(remhand)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 142 "$nick $host $hand $access $hands"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 142 "$nick $host $hand $access $hands"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(remhand)} {
				if {$access >= $accesss} {
					deluser $hands
					dopRemuser $hands
					puthelp "NOTICE $nick :[dop:lang $hand 143 "$hands"]"
					boot $hands "[dop:lang $hand 143 "$hands"]"
				}
			}
		}
	}


}
proc dop:caddchan  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:addchan $nick $host $hand "$arg"
}
proc dop:addchan {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set owner [join [lindex [split $arg] 1]]
	set access [dopGetuser $hand xtra dop:owner.access]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 144 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(addchan)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 145 "$chan"]"
		return 0
	}
	if {![dop:vrfychannel $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 146 "$nick $host $hand $access $chan"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 146 "$nick $host $hand $access $chan"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(addchan)} {
				channel add $chan
				puthelp "NOTICE $nick :[dop:lang $hand 147 "$chan"]"
				channel set $chan flood-chan $dop(def_chan-flood)
				channel set $chan flood-join $dop(def_join-flood)
				channel set $chan flood-ctcp $dop(def_ctcp-flood)
				channel set $chan flood-kick $dop(def_kick-flood)
				channel set $chan flood-deop $dop(def_deop-flood)
				if {$owner != ""} {
					if {[dopValiduser $owner]} {
						dopSetuser $owner xtra dop:$chan.access 500
						puthelp "NOTICE $nick :[dop:lang $hand 177 "$owner $chan 500"]"
					} {
						puthelp "NOTICE $nick :[dop:lang $hand 104 "$owner"]"
						return 0
					}
				}
			}
		}
	}
 
}
proc dop:cremchan  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:remchan $nick $host $hand "$arg"
}
proc dop:remchan {nick host hand arg} {
	global dop chanfile
	set chan [join [lindex [split $arg] 0]]
	set access [dopGetuser $hand xtra dop:owner.access]
	set reason [join [lrange [split $arg] 1 end]]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 148 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(remchan)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$reason == ""} {
		set reason $dop(defpurgereason)
	}
	if {$dop(adminreport) == 1} {
		if {$dop(adminreportnotice) == 1} {
			puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 149 "$nick $host $hand $access $chan ($reason)"]"
		} {
			puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 149 "$nick $host $hand $access $chan ($reason)"]"
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(remchan)} {
				putserv "PART $chan :$reason"
				channel remove $chan
				puthelp "NOTICE $nick :[dop:lang $hand 150 "$chan"]"
				dop:writefile "$chanfile.dop" "$chan.noop" ""
				dop:writefile "$chanfile.dop" "$chan.strictop" ""
				dop:writefile "$chanfile.dop" "$chan.url" ""
				dop:writefile "$chanfile.dop" "$chan.desc" ""
				dop:writefile "$chanfile.dop" "$chan.autotopic" ""
				dop:writefile "$chanfile.dop" "$chan.floatlimit" ""
				dop:writefile "$chanfile.dop" "$chan.floatmargin" ""
				dop:writefile "$chanfile.dop" "$chan.floatmax" ""
				dop:writefile "$chanfile.dop" "$chan.floatperiod" ""
				foreach user [userlist] {
					set automode [dopGetuser $user xtra dop:$chan.automode]
					set access [dopGetuser $user xtra dop:$chan.access]
					if {$access > 0} {
						dopSetuser $user xtra dop:$chan.access ""
					}
					if {$automode != ""} {
						dopSetuser $user xtra dop:$chan.automode ""
					}
				}
			}
		}
	}


}
proc dop:cverify  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:verify $nick $host $hand "$arg"
}
proc dop:verify {nick host hand arg} {
	global dop botnick
	set nicks [join [lindex [split $arg] 0]]
	set rhand $hand
	set hand [nick2hand $nicks]
	set rnick [hand2nick $hand]
	set userhost "![getchanhost $nicks]"
	
	if {[string tolower $nicks] == [string tolower $botnick]} {
		puthelp "NOTICE $nick :[dop:lang $rhand 151 "$nicks"]"
		return 0
	}

	if {$hand == ""} { set hand "*" }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		set hand "*"
	}
	if {$userhost == "!"} { 
		set userhost ""
		set hand ""
	}
	switch -- $hand {
		"*" { puthelp "NOTICE $nick :[dop:lang $rhand 152 "$nicks $userhost"]" }
		"" { puthelp "NOTICE $nick :[dop:lang $rhand 153 "$nicks"]" }
		default { 
			if {[dopGetuser $hand xtra dop:owner.access] > 500 && [dopGetuser $hand xtra dop:owner.access] < 949} {
				puthelp "NOTICE $nick :[dop:lang $rhand 154 "$rnick $userhost $hand"]"
				return 0
			}
			if {[dopGetuser $hand xtra dop:owner.access] > 949 && [dopGetuser $hand xtra dop:owner.access] < 1000} {
				puthelp "NOTICE $nick :[dop:lang $rhand 242 "$rnick $userhost $hand"]"
				return 0
			}
			if {[dopGetuser $hand xtra dop:owner.access] == 1000} {
				puthelp "NOTICE $nick :[dop:lang $rhand 243 "$rnick $userhost $hand"]"
				return 0
			}

			puthelp "NOTICE $nick :[dop:lang $rhand 155 "$rnick $userhost $hand"]"
		}
	}
}
proc dop:login {nick host rhand arg} {
	global dop
	set pass [join [lindex [split $arg] 1]]
	set hand [join [lindex [split $arg] 0]]

	if {$pass == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 161 ""]"
		return 0
	}
	if {![dopValiduser $hand]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$hand"]"
		return 0
	}
	if {[dopPasswdok $hand ""]} {
		puthelp "NOTICE $nick :[dop:lang $hand 158 ""]"
		return 0
	}
	#set hand [getuser $hand handle]
	if {[dopGetuser $hand xtra dop:auth] == 1 && [hand2nick $hand] != "" && [dopGetuser $hand xtra dop:authnick] == $nick && [dopGetuser $hand xtra dop:authhost] == $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 246 "$hand"]"
		puthelp "NOTICE $nick :[dop:lang $hand 247 "[dopGetuser $hand xtra dop:authnick]![dopGetuser $hand xtra dop:authhost]"]"
		set accessss [dopGetuser $hand xtra dop:owner.access]
		if {$accessss > 500} {
				if {$dop(adminreport) == 1} {
					if {$dop(adminreportnotice) == 1} {
						puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 164 "$nick $host $hand $accessss"]"
					} {
						puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 164 "$nick $host $hand $accessss"]"
					}
				}
		}
		return 0
	}
	if {[matchattr $hand n]} {
		set found 0
		foreach user [userlist] {
			if {[dopGetuser $user xtra dop:owner.access] > 0} {
				set found 1
			}
		}
		if {$found == 0} {
			dopSetuser $hand xtra dop:owner.access 1000
		}
	}
	if {![dopPasswdok $hand ""]} {
		if {![dopPasswdok $hand $pass]} {
			puthelp "NOTICE $nick :[dop:lang $rhand 163 "$hand"]"
			dopSetuser $hand xtra dop:auth 0
			delhost $hand "[dopGetuser $hand xtra dop:authnick]!*[dop:notild [dopGetuser $hand xtra dop:authhost]]"
			dopSetuser $hand xtra dop:authhost "*"
			dopSetuser $hand xtra dop:authnick ""
			delhost $hand "$nick!*[dop:notild $host]"
			set accessss [dopGetuser $hand xtra dop:owner.access]
			if {$accessss > 500} {
					if {$dop(adminreport) == 1} {
						if {$dop(adminreportnotice) == 1} {
							puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 164 "$nick $host $hand $accessss"]"
						} {
							puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 164 "$nick $host $hand $accessss"]"
						}
					}
			}
		}
		if {[dopPasswdok $hand $pass]} {
			setuser $hand hosts "$nick!*[dop:notild $host]"
			dopSetuser $hand xtra dop:auth 1
			if {"$nick!*[dop:notild $host]" != "[dopGetuser $hand xtra dop:authnick]!*[dop:notild [dopGetuser $hand xtra dop:authhost]]"} {
				delhost $hand "[dopGetuser $hand xtra dop:authnick]!*[dop:notild [dopGetuser $hand xtra dop:authhost]]"
			}
			dopSetuser $hand xtra dop:authhost $host
			dopSetuser $hand xtra dop:authnick $nick
			dopSetuser $hand xtra dop:lastlog [unixtime]
			
			set accessss [dopGetuser $hand xtra dop:owner.access]
			if {$accessss > 500} {
					if {$dop(adminreport) == 1} {
						if {$dop(adminreportnotice) == 1} {
							puthelp "NOTICE $dop(adminreportchan) :[dop:lang "adminreportuser" 166 "$nick $host $hand $accessss"]"
						} {
							puthelp "PRIVMSG $dop(adminreportchan) :[dop:lang "adminreportuser" 166 "$nick $host $hand $accessss"]"
						}
					}
			}
			#set hand [nick2hand [hand2nick $hand]]
			puthelp "NOTICE $nick :[dop:lang $rhand 165 "$hand"]"
			if {$dop(mysqladddon) == 1} {
				dopCheckmail $hand $nick
			}
			foreach chan [channels] {
				switch -- [dopGetuser $hand xtra dop:$chan.automode] {
					"op" { pushmode $chan +o $nick }
					"voice" { pushmode $chan +v $nick }
				}
			}
		}
	}
}
proc dop:dauth {nick host hand arg} {
	global dop
	set hand [join [lindex [split $arg] 0]]
	set pass [join [lindex [split $arg] 1]]
	if {$pass == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 167 ""]"
		return 0
	}
	if {![dopValiduser $hand]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$hand"]"
		return 0
	}
	if {![dopPasswdok $hand $pass]} {
		puthelp "NOTICE $nick :[dop:lang $hand 168 "$hand"]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 248 "$hand"]"
		return 0
	}
	puthelp "NOTICE $nick :[dop:lang $hand 169 "$hand"]"
	delhost $hand "[dopGetuser $hand xtra dop:authnick]!*[dop:notild [dopGetuser $hand xtra dop:authhost]]"
	dopSetuser $hand xtra dop:auth 0
	dopSetuser $hand xtra dop:authhost "*"
	dopSetuser $hand xtra dop:authnick ""
}
proc dop:cadduser  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:adduser $nick $host $hand "$chan $arg"
}
proc dop:adduser {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 1]]
	set accesss [join [lindex [split $arg] 2]]
	if {[strlwr $chan] == "*"} {
		set chan "owner"
	}
	if {$accesss == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 173 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![dopValiduser $nicks]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$nicks"]"
		return 0
	}
	if {![validchan $chan]} {
		if {[strlwr $chan] != "owner"} {
			puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
			return 0
		}
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	set accessss [dopGetuser $nicks xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access <= $accesss} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$accessss > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 174 "$nicks $chan $accessss"]"
		return 0
	}
	if {$access < $dop(adduser)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[strlwr $chan] != "owner"} {
		if {$accesss > 500} {
			puthelp "NOTICE $nick :[dop:lang $hand 175 ""]"
			return 0
		}
		if {$accesss < 1} {
			puthelp "NOTICE $nick :[dop:lang $hand 176 ""]"
			return 0
		}
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(adduser)} {
				if {$access > $accesss} {
					if {$accesss == 500} {
						set found 0
						foreach user [userlist] {
							if {[dopGetuser $user xtra dop:$chan.access] == 500} {
								puthelp "NOTICE $nick :[dop:lang $hand 244 ""]"
								return 0
							}
						}

					}
					dopSetuser $nicks xtra dop:$chan.access $accesss
					puthelp "NOTICE $nick :[dop:lang $hand 177 "$nicks $chan $accesss"]"
				}
			}
		}
	}

}
proc dop:cremuser  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:remuser $nick $host $hand "$chan $arg"
}
proc dop:remuser {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 1]]
	if {[strlwr $chan] == "*"} {
		set chan "owner"
	}
	if {$nicks == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 178 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		if {$chan != "owner"} {
			puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
			return 0
		}
	}
	if {![dopValiduser $nicks]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$nicks"]"
		return 0
	}
	if {[dopGetuser $nicks xtra dop:$chan.access] < 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 179 "$nicks $chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	set accesss [dopGetuser $nicks xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }

	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $accesss} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$access < $dop(remuser)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(remuser)} {
				if {$access > $accesss} {
					dopSetuser $nicks xtra dop:$chan.automode ""
					dopSetuser $nicks xtra dop:$chan.access ""
					puthelp "NOTICE $nick :[dop:lang $hand 180 "$nicks $chan"]"
				}
			}
		}
	}

}
proc dop:csuspend  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:suspend $nick $host $hand "$chan $arg"
}
proc dop:cunsuspend  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:unsuspend $nick $host $hand "$chan $arg"
}
proc dop:suspend {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 1]]
	set level [join [lindex [split $arg] 2]]
	if {[strlwr $chan] == "*"} {
		set chan "owner"
	}
	if {$nicks == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 171 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		if {$chan != "owner"} {
			puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
			return 0
		}
	}
	if {![dopValiduser $nicks]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$nicks"]"
		return 0
	}
	if {[dopGetuser $nicks xtra dop:$chan.access] < 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 179 "$nicks $chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	set accesss [dopGetuser $nicks xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $nicks xtra dop:owner.access] >= 501} { set accesss [dopGetuser $nicks xtra dop:owner.access] }

	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $accesss} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$level < 1 || $level > 1000} {
		set level $access
	}
	if {$level > $access} {
		puthelp "NOTICE $nick :[dop:lang $hand 79 ""]"
		return 0
	}
	if {$access < $dop(suspend)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(suspend)} {
				if {$access > $accesss} {
					dopSetuser $nicks xtra dop:$chan.suspend $level
					puthelp "NOTICE $nick :[dop:lang $hand 170 "$nicks $chan"]"
				}
			}
		}
	}

}
proc dop:unsuspend {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 1]]
	if {[strlwr $chan] == "*"} {
		set chan "owner"
	}
	if {$nicks == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 172 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		if {$chan != "owner"} {
			puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
			return 0
		}
	}
	if {![dopValiduser $nicks]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$nicks"]"
		return 0
	}
	if {[dopGetuser $nicks xtra dop:$chan.access] < 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 179 "$nicks $chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	set accesss [dopGetuser $nicks xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }

	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $accesss} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	set level [dopGetuser $nicks xtra dop:$chan.suspend]
	if {$level > $access} {
		puthelp "NOTICE $nick :[dop:lang $hand 266 ""]"
		return 0
	}
	if {$access < $dop(unsuspend)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(unsuspend)} {
				if {$access > $accesss} {
					dopSetuser $nicks xtra dop:$chan.suspend 0
					puthelp "NOTICE $nick :[dop:lang $hand 265 "$nicks $chan"]"
				}
			}
		}
	}

}
proc dop:cmodinfo  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:modinfo $nick $host $hand "$chan $arg"
}
proc dop:modinfo {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 2]]
	set variable [join [lindex [split $arg] 1]]
	set valeur [join [lindex [split $arg] 3]]
	if {[strlwr $chan] == "*"} {
		set chan "owner"
	}
	if {$valeur == ""} {
                puthelp "NOTICE $nick :[dop:lang $hand 181 ""]"
                return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![dopValiduser $nicks]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$nicks"]"
		return 0
	}
	if {[dopGetuser $nicks xtra dop:$chan.access] < 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 179 "$nicks $chan"]"
		return 0
	}
	if {![validchan $chan]} {
		if {$chan != "owner"} {
			puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
			return 0
		}
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	set accesss [dopGetuser [string tolower $nicks] xtra dop:$chan.access]	
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(modinfo)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	if {$access <= $accesss} {
		if {$variable == "automode"} {
			if {$access != 500} {
				puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
				return 0
			}
		} {
			puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
			return 0
		}
	}

	if {[strlwr $variable] != "automode"} {
		if {[strlwr $chan] != "owner"} {
			if {$valeur > 500} {
				puthelp "NOTICE $nick :[dop:lang $hand 175 ""]"
				return 0
			}
			if {$valeur < 1} {
				puthelp "NOTICE $nick :[dop:lang $hand 176 ""]"
				return 0
			}
		} else {
			if {$valeur < 1 || $valeur > 999} {
					puthelp "NOTICE $nick :[dop:lang $hand 176 ""]"
					return 0
			}
		}
	}
	if {$access < $dop(modinfo)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(modinfo)} {
				if {[string tolower $variable] == "access"} {
					if {$valeur < $access} {
						dopSetuser $nicks xtra dop:$chan.access $valeur
						puthelp "NOTICE $nick :[dop:lang $hand 182 "$nicks $chan $valeur"]"
					} {
						puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
						return 0
					}
				}
				if {[string tolower $variable] == "automode"} {
					switch -- [string tolower $valeur] {
						"op" {
							dopSetuser $nicks xtra dop:$chan.automode $valeur
							puthelp "NOTICE $nick :[dop:lang $hand 183 "$nicks $chan"]"
						}
						"voice" {
							dopSetuser $nicks xtra dop:$chan.automode $valeur
							puthelp "NOTICE $nick :[dop:lang $hand 184 "$nicks $chan"]"
						}
						"none" {
							dopSetuser $nicks xtra dop:$chan.automode off
							puthelp "NOTICE $nick :[dop:lang $hand 185 "$nicks $chan"]"
						}
						default { puthelp "NOTICE $nick :[dop:lang $hand 181 ""]" }
					}
				} 			
			}
		}
	}

}
proc dop:cop {nick host hand chan arg} { 	
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:op $nick $host $hand "$chan $arg"
}
proc dop:cdeop {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:deop $nick $host $hand "$chan $arg"
}
proc dop:cvoice {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:voice $nick $host $hand "$chan $arg"
}
proc dop:cdevoice {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:devoice $nick $host $hand "$chan $arg"
}
proc dop:cset  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:set $nick $host $hand "$chan $arg"
}
proc dop:set {nick host hand arg} {
	global dop chanfile
	set chan [join [lindex [split $arg] 0]]
	set setting [join [lindex [split $arg] 1]]
	set value [join [lrange [split $arg] 2 end]]

	if {$value == ""} {
		if {[strlwr $chan] != "invisible" && [strlwr $chan] != "lang"} {
			puthelp "NOTICE $nick :[dop:lang $hand 186 ""]"
			return 0
		}
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		if {[strlwr $chan] != "invisible" && [strlwr $chan] != "lang"} {
			puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
			return 0
		}
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[strlwr $chan] == "invisible"} {
		if {[strlwr $setting] == "on"} {
			dopSetuser $hand xtra dop:invisible "on"
			puthelp "NOTICE $nick :[dop:lang $hand 187 ""]"
			return 0
		}
		if {[strlwr $setting] == "off"} {
			dopSetuser $hand xtra dop:invisible "off"
			puthelp "NOTICE $nick :[dop:lang $hand 188 ""]"
			return 0
		}
		puthelp "NOTICE $nick :[dop:lang $hand 189 ""]"
		return 0
	}

	if {[strlwr $chan] == "lang"} {
		if {[strlwr $setting] <= $dop(numlang) && [strlwr $setting] >= 1} {
			dopSetuser $hand xtra dop:lang "[strlwr $setting]"
			puthelp "NOTICE $nick :[dop:lang $hand 190 "[strlwr $setting]"]"
			return 0
		} else {
			puthelp "NOTICE $nick :[dop:lang $hand 191 "$dop(numlang)"]"
			return 0
		}
	}

	if {$access < $dop(set)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(set)} {
				switch -- [string tolower $setting] {
					"deop-flood" {
						channel set $chan flood-deop $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "DeopFlood $chan $value"]"
					}
					"kick-flood" {
						channel set $chan flood-kick $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "KickFlood $chan $value"]"
					}
					"join-flood" {
						channel set $chan flood-join $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "JoinFlood $chan $value"]"
					}
					"chan-flood" {
						channel set $chan flood-chan $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "ChanFlood $chan $value"]"
					}
					"ctcp-flood" {
						channel set $chan flood-ctcp $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "CtcpFlood $chan $value"]"
					}
					"mode" {
						channel set $chan chanmode $value
						set mode [getchanmode $chan]
						puthelp "NOTICE $nick :[dop:lang $hand 192 "MODE $chan $value"]"
					}
					"autotopic" {
						if {[strlwr $value] == "on" || [strlwr $value] == "off"} {
							if {[strlwr $value] == "on"} { 
								dop:writefile "$chanfile.dop" "$chan.at" "on"
								dop:settopic $chan 1
							}
							if {[strlwr $value] == "off"} { 
								dop:writefile "$chanfile.dop" "$chan.at" ""
								dop:writefile "$chanfile.dop" "$chan.atr" ""
							}
							puthelp "NOTICE $nick :[dop:lang $hand 192 "AUTOTOPIC $chan $value"]"
						} {
							puthelp "NOTICE $nick :[dop:lang $hand 193 ""]"
						}
					}
					"noop" {
						if {[strlwr $value] == "on" || [strlwr $value] == "off"} { 
							dop:writefile "$chanfile.dop" "$chan.noop" "$value"
							puthelp "NOTICE $nick :[dop:lang $hand 192 "NOOP $chan $value"]"
							dop:noopset $chan
						} {
							puthelp "NOTICE $nick :[dop:lang $hand 194 ""]"
						}
					}
					"floatlim" {
						if {[strlwr $value] == "on" || [strlwr $value] == "off"} { 
							dop:writefile "$chanfile.dop" "$chan.floatlimit" "$value"
							dop:setlimit $chan
							puthelp "NOTICE $nick :[dop:lang $hand 192 "FLOATLIMIT $chan $value"]"
							if {[strlwr $value] == "off"} {
								pushmode $chan -l
							}
						} {
							puthelp "NOTICE $nick :[dop:lang $hand 287 ""]"
						}
					}
					"floatmargin" {
						set value [expr $value]
						if {$value > 1 && $value < 21} { 
							dop:writefile "$chanfile.dop" "$chan.floatmargin" "$value"
							dop:setlimit $chan
							puthelp "NOTICE $nick :[dop:lang $hand 192 "FLOATMARGIN $chan $value"]"
						} {
							puthelp "NOTICE $nick :[dop:lang $hand 288 ""]"
						}
					}
					"floatperiod" {
						set value [expr $value]
						if {$value > 19 && $value < 201} { 
							dop:writefile "$chanfile.dop" "$chan.floatperiod" "$value"
							dop:setlimit $chan
							puthelp "NOTICE $nick :[dop:lang $hand 192 "FLOATPERIOD $chan $value"]"
						} {
							puthelp "NOTICE $nick :[dop:lang $hand 290 ""]"
						}
					}
					"floatmax" {
						set value [expr $value]
						if {$value >= 0 && $value < 65536} { 
							dop:writefile "$chanfile.dop" "$chan.floatmax" "$value"
							dop:setlimit $chan
							puthelp "NOTICE $nick :[dop:lang $hand 192 "FLOATMAX $chan $value"]"
						} {
							puthelp "NOTICE $nick :[dop:lang $hand 289 ""]"
						}
					}
					"floatgrace" {
						set value [expr $value]
						if {$value >= 0 && $value < 19} { 
							dop:writefile "$chanfile.dop" "$chan.floatgrace" "$value"
							dop:setlimit $chan
							puthelp "NOTICE $nick :[dop:lang $hand 192 "FLOATGRACE $chan $value"]"
						} {
							puthelp "NOTICE $nick :[dop:lang $hand 291 ""]"
						}
					}
					"url" {
						if {[strlwr $value] == "none"} { 
							dop:writefile "$chanfile.dop" "$chan.url" ""
							puthelp "NOTICE $nick :[dop:lang $hand 195 "URL $chan"]"
							dop:settopic $chan 1
							return 0
						}
						dop:writefile "$chanfile.dop" "$chan.url" $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "URL $chan $value"]"
						dop:settopic $chan 1
					}
					"desc" {
						if {[strlwr $value] == "none"} { 
							dop:writefile "$chanfile.dop" "$chan.desc" ""
							puthelp "NOTICE $nick :[dop:lang $hand 195 "DESCRIPTION $chan"]"
							dop:settopic $chan 1
							return 0
						}
						dop:writefile "$chanfile.dop" "$chan.desc" $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "DESCRIPTION $chan $value"]"
						dop:settopic $chan 1
					}
					"description" {
						if {[strlwr $value] == "none"} { 
							dop:writefile "$chanfile.dop" "$chan.desc" ""
							puthelp "NOTICE $nick :[dop:lang $hand 195 "DESCRIPTION $chan"]"
							dop:settopic $chan 1
							return 0
						}
						dop:writefile "$chanfile.dop" "$chan.desc" $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "DESCRIPTION $chan $value"]"
						dop:settopic $chan 1
					}
					"keywords" {
						if {[strlwr $value] == "none"} { 
							dop:writefile "$chanfile.dop" "$chan.keywords" ""
							puthelp "NOTICE $nick :[dop:lang $hand 195 "KEYWORDS $chan"]"
							return 0
						}
						dop:writefile "$chanfile.dop" "$chan.keywords" $value
						puthelp "NOTICE $nick :[dop:lang $hand 192 "KEYWORDS $chan $value"]"
					}
					"strictop" {
						if {[strlwr $value] == "on" || [strlwr $value] == "off"} { 
							dop:writefile "$chanfile.dop" "$chan.strictop" "$value"
							puthelp "NOTICE $nick :[dop:lang $hand 192 "STRICTOP $chan $value"]"
							dop:strictop $chan
						} {
							puthelp "NOTICE $nick :[dop:lang $hand 196 ""]"
						}
					}
					default { puthelp "NOTICE $nick :[dop:lang $hand 186 ""]" }
				}
			}
		}
	}

}
proc dop:ckick {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:kick $nick $host $hand "$chan $arg"
}
proc dop:cban {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0 	}
	if {$hand == "*"} {
		return 0
	}
	dop:ban $nick $host $hand "$chan $arg"
}
proc dop:cunban {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:unban $nick $host $hand "$chan $arg"
}
proc dop:ctopic {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:topic $nick $host $hand "$chan $arg"
}
proc dop:invite {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 197 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(invite)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[onchan $nick $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 198 "$chan"]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
			if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(invite)} {
				puthelp "INVITE $nick $chan"
			}
		}
	}

}
proc dop:op {nick host hand arg} {
	global dop chanfile
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lrange [split $arg] 1 end]]

	if {$nicks == ""} { set nicks "$nick" }
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 199 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(op)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dop:readfile "$chanfile.dop" "$chan.noop"] == "on"} {
		puthelp "NOTICE $nick :[dop:lang $hand 200 "$chan"]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(op)} {
				dop:pushmode $chan +o $nicks
			}
		}
	}

}
proc dop:cjoin {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:join $nick $host $hand "$arg"
}
proc dop:cpart {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:part $nick $host $hand "$arg"
}
proc dop:join {nick host hand arg} {
	global dop chanfile
	set chan [join [lindex [split $arg] 0]]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 260 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(join)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
			if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(join)} {
				channel set $chan -inactive
				putserv "JOIN $chan"
			}
		}
	}

}
proc dop:ccycle {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:cycle $nick $host $hand "$chan"
}
proc dop:cycle {nick host hand arg} {
	global dop chanfile
	set chan [join [lindex [split $arg] 0]]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 292 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(cycle)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
			if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(cycle)} {
				putserv "PART $chan :Cycling"
			}
		}
	}

}



proc dop:part {nick host hand arg} {
	global dop chanfile
	set chan [join [lindex [split $arg] 0]]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 261 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(part)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
			if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(part)} {
				putserv "PART $chan :[dop:lang $hand 262 "$nick"]"
				channel set $chan +inactive
			}
		}
	}

}
proc dop:deop {nick host hand arg} {
	global dop botnick
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lrange [split $arg] 1 end]]
	if {$nicks == ""} { set nicks "$nick" }
	set me [strlwr $botnick]
	set nicks [strlwr $nicks]
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 201 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(deop)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[strlwr $nicks] == $me} { 
		puthelp "NOTICE $nick :[dop:lang $hand 202 "$botnick"]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
			if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(deop)} {
				dop:pushmode $chan -o $nicks
			}
		}
	}

}
proc dop:voice {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lrange [split $arg] 1 end]]
	if {$nicks == ""} { set nicks "$nick" }
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 203 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0 	
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(voice)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(voice)} {
				dop:pushmode $chan +v $nicks
			}
		}
	}

}
proc dop:devoice {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lrange [split $arg] 1 end]]
	if {$nicks == ""} { set nicks "$nick" }
	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 204 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(devoice)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(devoice)} {
				dop:pushmode $chan -v $nicks
			}
		}
	}

}
proc dop:ban {nick host hand arg} {
	global dop botnick
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 1]]
	set life [join [lindex [split $arg] 2]]
	if {$life >= 0 && $life < 100000} {
		if {$life == 0} {
			set life ""
		}
		set reason [join [lrange [split $arg] 3 end]]
	} else {
		set reason [join [lrange [split $arg] 2 end]]
		if {$dop(defban) != 0} {
			set life $dop(defban)
		}
	}
	if {$nicks == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 205 ""]"
		return 0
	}
	if {$reason == ""} {
		set reason "No reason"
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(ban)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(ban)} {
				if {![onchan $nicks $chan]} {
					if {[string tolower $nicks] == [string tolower $botnick]} {
						puthelp "NOTICE $nick :[dop:lang $hand 202 "$botnick"]."
						return 0
					}
					set nicks [dop:notild $nicks]
					newchanban $chan $nicks $nick $reason $life
					pushmode $chan +b $nicks
					puthelp "NOTICE $nick :[dop:lang $hand 286 "$nicks $chan"]"
				} {
					set list [strlwr [chanlist $chan]]
					foreach user $list {
						if {$user == [string tolower $nicks]} {
							if {[string tolower $nicks] == [string tolower $botnick]} {
								puthelp "NOTICE $nick :[dop:lang $hand 202 "$botnick"]."
								return 0
							}
							set bhost [lindex [split [maskhost $user![getchanhost $user $chan]] "@"] 1]
							set identd [lindex [split [getchanhost $user $chan] "@"] 0]
							set identd [dop:notild $identd]
							set mask "*!*$identd@$bhost"
							if {$dop(kickusername) == 1} {
								set reason "($hand) $reason"
							}
							newchanban $chan $mask $nick $reason $life
							putserv "KICK $chan $nicks :$reason"
							pushmode $chan +b $mask
							puthelp "NOTICE $nick :[dop:lang $hand 286 "$mask $chan"]"
						}
					}
				}
			}
		}
	}

}
proc dop:kick {nick host hand arg} {
	global dop botnick
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 1]]
	set reason [join [lrange [split $arg] 2 end]]
	if {$nicks == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 206 ""]"
		return 0
	}
	if {$reason == ""} {
		set reason "No reason"
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	set me [strlwr $botnick]
	set nicks [strlwr $nicks]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(kick)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {$nicks == $me} { 
		puthelp "NOTICE $nick :[dop:lang $hand 202 "$botnick"]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(kick)} {
				if {[onchan $nicks $chan]} {
					if {$dop(kickusername) == 1} {
						putserv "KICK $chan $nicks :($hand) $reason"
					} {
						putserv "KICK $chan $nicks :$reason"
					}
				} {
					if {$access > 200} {
						set nicks [string tolower $nicks]
						foreach pers [chanlist $chan] {
							set hosts [string tolower "$pers![getchanhost $pers $chan]"]
							if {[string match $nicks $hosts]} {
								if {$dop(kickusername) == 1} {
									puthelp "KICK $chan $pers :($hand) $reason"
								} {
									puthelp "KICK $chan $pers :$reason"
								}
							}
						}
					}
				}
			}
		}
	}
}
proc dop:topic {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set topic [join [lrange [split $arg] 1 end]]
	if {$topic == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 207 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(topic)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(topic)} {
				putserv "TOPIC $chan :($hand) $topic"
			}
		}
	}
}
proc dop:unban {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 1]]
	if {$nicks == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 208 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(unban)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	if {[dopGetuser $hand xtra dop:auth] == 1} {
		
		if {$access >= $dop(ban)} {
			#Problem here, cannot know if the ban is set on the chan.. So even if the ban doesn't exist :S
			killchanban $chan $nicks
			pushmode $chan -b $nicks
			puthelp "NOTICE $nick :[dop:lang $hand 209 "$nicks"]"
			
		}
	}
}
proc dop:cbanlist  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:banlist $nick $host $hand "$chan $arg"
}
proc dop:banlist {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set nicks [join [lindex [split $arg] 1]]

	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 210 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(banlist)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(banlist)} {
				foreach bans [banlist $chan] {
					set mask [lindex $bans 0]
					set by [lindex $bans 5]
					puthelp "NOTICE $nick :[dop:lang $hand 211 "$mask $by"]"
				}
				puthelp "NOTICE $nick :[dop:lang $hand 212 ""]"
			}
		}
	}
}
proc dop:cinfo  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:info $nick $host $hand "$arg"
}
proc dop:info {nick host hand arg} {
	global dop
	set nicks [join [lindex [split $arg] 0]]
	if {$nicks == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 213 ""]"
		return 0
	}
	if {[validchan $nicks]} {
		dop:chaninfo $nick $host $hand $arg
		return 0
	}

	if {![validuser $nicks]} {
		puthelp "NOTICE $nick :[dop:lang $hand 104 "$nicks"]"
		return 0
	}
	set user $nicks
	set who2 [getuser $nicks handle]

	set access [dopGetuser $user xtra dop:owner.access]
	set accesss [dopGetuser $hand xtra dop:owner.access]
	set hosts [getuser $user hosts]

	if {$access == ""} { set access 0 }
	if {$accesss == ""} { set accesss 0 }

	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		set accesss 0
	}

	if {[dopGetuser $user xtra dop:invisible] == "on"} {
		if {[strlwr $hand] != [strlwr $user]} {
			if {$accesss <= $access} {
				puthelp "NOTICE $nick :[dop:lang $hand 214 ""]"
				return 0
			}
		}
	}
			
	puthelp "NOTICE $nick :[dop:lang $hand 215 "$who2"]"
	puthelp "NOTICE $nick :[dop:lang $hand 216 ""]"
			
	set rnick [hand2nick $user]
	set hostmask "$rnick![getchanhost $rnick]"

 	if {$rnick != "" && [dopGetuser $user xtra dop:auth] == 1} {
         	puthelp "NOTICE $nick :  $hostmask"
	} {
         	puthelp "NOTICE $nick :  [dop:lang $hand 217 ""]"
	}

	if {[dopGetuser $user xtra dop:invisible] == "on"} {
		puthelp "NOTICE $nick :[dop:lang $hand 218 "On"]"
	}
	if {[dopGetuser $user xtra dop:invisible] == "off"} {
		puthelp "NOTICE $nick :[dop:lang $hand 218 "Off"]"
	}
	if {[dopGetuser $user xtra dop:invisible] == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 218 "Off"]"
	}
	puthelp "NOTICE $nick :[dop:lang $hand 8 ""]: [dopGetuser $user xtra dop:lang]"
	
	set tmp [dop:seen $user]
			
	if {$tmp != 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 9 ""]: $tmp ago."
	}


	if {[dopGetuser $hand xtra dop:auth] != 1} {
		set hand "*"
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		set hand "*"
	}

	set vdate ""
	if {[dopGetuser $user xtra dop:vdate] != ""} {
		set vdate [dop:vctime [dopGetuser $user xtra dop:vdate]]
		set vdate [dop:lang $hand 258 "$vdate"]
	}
	if {[strlwr $hand] == [strlwr $user] || $access < $accesss} {
		puthelp "NOTICE $nick :[dop:lang $hand 257 ""] [dopGetuser $user xtra dop:email] $vdate"
	}

	if {[strlwr $hand] == [strlwr $user] || $access < $accesss} {
		set temp ""
		if {[dopGetuser $user xtra dop:owner.access] > 500} {
			set temp "|* \([dopGetuser $user xtra dop:owner.access]\)"
		}
		foreach chan [channels] {
			set access [dopGetuser $user xtra dop:$chan.access]
			if {$access > 0} {
				append temp "|$chan \($access\)"
			}
		} 
		if {$temp == ""} { 
			set temp "[dop:lang $hand 11 ""]"
		} {
			set temp [split $temp "|"]
			set count 0
			foreach chan $temp {
				incr count 1
			}
			set tmp ""
			set a 0
			foreach chan $temp {
				incr a 1
				if {$chan != ""} {
					if {$a == $count} {
						append tmp "$chan "
					} {
						append tmp "$chan, "
					}
				}
			}
		}


		puthelp "NOTICE $nick :[dop:lang $hand 219 ""]: $tmp"
	}
}
proc dop:caccess {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:access $nick $host $hand "$chan $arg"
}
proc dop:access {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]
	set mtc [join [lindex [split $arg] 1]]
	set mtc2 [join [lindex [split $arg] 2]]

	if {[strlwr $chan] == "*"} {
		set chan "owner"
	}
	if {$mtc == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 220 ""]"
		return 0
	}
	if {![validchan $chan]} {
		if {$chan != "owner"} {
			puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
			return 0
		}
	}

	set found 0
	set list ""
	foreach user [userlist] {
		if {[dopGetuser $user xtra dop:$chan.access] >= 1} {
			if {[strlwr $mtc] == "-min" || [strlwr $mtc] == "-max" || [strlwr $mtc] == "-op" || [strlwr $mtc] == "-voice"} {
				if {[strlwr $mtc] == "-min"} {
					if {[strlwr $chan] != "owner" && $mtc2 > 500} { puthelp "NOTICE $nick :[dop:lang $hand 221 ""]" }
					if {[dopGetuser $user xtra dop:$chan.access] < $mtc2} { continue }
				}
				if {[strlwr $mtc] == "-max"} {
					if {$mtc2 < 1} { puthelp "NOTICE $nick :[dop:lang $hand 222 ""]" }
					if {[dopGetuser $user xtra dop:$chan.access] > $mtc2} { continue }
				}
				if {[strlwr $mtc] == "-op"} {
					if {[string tolower [dopGetuser $user xtra dop:$chan.automode]] != "op"} { continue }
				}
				if {[strlwr $mtc] == "-voice"} {
					if {[string tolower [dopGetuser $user xtra dop:$chan.automode]] != "voice"} { continue }
				}
				if {[strlwr $mtc] == "-none"} {
					if {[string tolower [dopGetuser $user xtra dop:$chan.automode]] != "none"} { continue }
					if {[string tolower [dopGetuser $user xtra dop:$chan.automode]] != ""} { continue }
				}
			} {
				if {![string match [strlwr $mtc] [strlwr $user]]} {
					continue
				}
			}
			append list "$user:[dopGetuser $user xtra dop:$chan.access] "

			set found 1
			
		}
	}
#EXPERIMENTAL-------
	set e 1001
	if {$found == 1} {
		for {set a 0} {$a < 1001} {incr a} {
			incr e -1
			foreach users $list {
				set spl [split $users ":"]
				set user [lindex $spl 0]
				if {[lindex $spl 1] == $e} {
					set access [dopGetuser $user xtra dop:$chan.access]
					set hosts [getuser $user hosts]
					
					set automode "NONE"
					switch -- [dopGetuser $user xtra dop:$chan.automode] {
						"op" { set automode "OP" }
						"voice" { set automode "VOICE" }
						"off" { set automode "NONE" }
						"none" { set automode "NONE" }
					}

					if {[dopGetuser $user xtra dop:auth] == 1} {
						puthelp "NOTICE $nick :[dop:lang $hand 223 "$user $access LU"]"
					} {
						puthelp "NOTICE $nick :[dop:lang $hand 223 "$user $access L"]"
					}

					puthelp "NOTICE $nick :[dop:lang $hand 224 "$chan $automode"]"
					if {[dop:seen $user] != 0 && [dop:seen $user] != ""} {
						puthelp "NOTICE $nick :[dop:lang $hand 225 "[dop:seen $user]"]"
					}
					if {[dopGetuser $user xtra dop:$chan.suspend] > 0} {
						puthelp "NOTICE $nick :[dop:lang $hand 78 "[dopGetuser $user xtra dop:$chan.suspend]"]"
					}
				}
			}
		}
	}
#-------EXPERIMENTAL

	if {$found == 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 226 ""]"
		return 0
	}
	puthelp "NOTICE $nick :[dop:lang $hand 227 ""]"
}
proc dop:cstatus  {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:status $nick $host $hand "$chan $arg"
}
proc dop:status {nick host hand arg} {
	global dop chanfile
	set chan [join [lindex [split $arg] 0]]

	if {$chan == ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 228 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(status)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	set normal 0
	set operator 0
	
	foreach snick [chanlist $chan] {
		if {[isop $snick $chan]} {
			incr operator 1
		}
		incr normal 1
	}
	puthelp "NOTICE $nick :[dop:lang $hand 229 "$chan $normal $operator"]"
	puthelp "NOTICE $nick :[dop:lang $hand 230 "[getchanmode $chan]"]"
	if {[botonchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 231 ""]"
	} else {
		puthelp "NOTICE $nick :[dop:lang $hand 263 ""]"
	}
	append temp "ChanFlood\[[lindex [channel info $chan] 9]\]"
	append temp " CtcpFlood\[[lindex [channel info $chan] 10]\]"
	append temp " JoinFlood\[[lindex [channel info $chan] 11]\]"
	append temp " KickFlood\[[lindex [channel info $chan] 12]\]"
	append temp " DeopFlood\[[lindex [channel info $chan] 13]\]"
	puthelp "NOTICE $nick :[dop:lang $hand 232 ""]: $temp"
	
	set flags ""
	if {[string tolower [dop:readfile "$chanfile.dop" "$chan.at"]] == "on"} { append flags "AUTOTOPIC " }
	if {[string tolower [dop:readfile "$chanfile.dop" "$chan.strictop"]] == "on"} { append flags "STRICTOP " }
	if {[string tolower [dop:readfile "$chanfile.dop" "$chan.noop"]] == "on"} { append flags "NOOP " }
	if {[string tolower [dop:readfile "$chanfile.dop" "$chan.floatlimit"]] == "on"} { 
		set margin [dop:readfile "$chanfile.dop" "$chan.floatmargin"]
		set period [dop:readfile "$chanfile.dop" "$chan.floatperiod"]
		set max [dop:readfile "$chanfile.dop" "$chan.floatmax"]
		set grc [dop:readfile "$chanfile.dop" "$chan.floatgrace"]
		append flags "FLOATLIM (MGN:$margin, PRD:$period, GRC:$grc, MAX:$max)"
	}

	if {$flags != ""} {
		puthelp "NOTICE $nick :[dop:lang $hand 233 ""]: $flags"
	}

	set temp ""
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(status)} {
				foreach user [userlist] {
					set access [dopGetuser $user xtra dop:$chan.access]
					set hosts [getuser $user hosts]
					if {[dopGetuser $user xtra dop:auth] == 1} {
						if {$access >= 1} {
							set rnick [hand2nick $user $chan]
							append temp "$user/\002$rnick\002 \[$access\] "
						}
					}
				}
				puthelp "NOTICE $nick :$temp"
			}
		}
	}
}
proc dop:cignorelist {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:ignorelist $nick $host $hand "$arg"
}
proc dop:ignorelist {nick host hand arg} {
	global dop

	puthelp "notice $nick :[dop:lang $hand 234 ""]"
	foreach ignore [ignorelist] {
		if {[lindex $ignore 2] != 0} {
			set time [expr [lindex $ignore 2] - [unixtime]]
			set time [expr $time / 60]
			puthelp "NOTICE $nick :[dop:lang $hand 297 "[lindex $ignore 0] $time"]"
		} {
			puthelp "NOTICE $nick :[dop:lang $hand 298 "[lindex $ignore 0]"]"
		}
	}
	puthelp "notice $nick :[dop:lang $hand 235 ""]"
}
proc dop:csearch {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	dop:search $nick $host $hand "$arg"
}
proc dop:search {nick host hand arg} {
	global chanfile
	set match [join [lindex [split $arg] 0]]
	set rmatch "*$match*"
	set i 0
	foreach chan [channels] {
		set keywords [dop:readfile "$chanfile.dop" "$chan.keywords"]
		#set desc [dop:readfile "$chanfile.dop" "$chan.desc"]
		if {$keywords != ""} {
			if {[string match [strlwr $rmatch] [strlwr $keywords]]} {
				puthelp "NOTICE $nick :$chan   - $keywords"
				incr i 1
			}
		}
		if {$i > 10} {
			puthelp "NOTICE $nick :[dop:lang $hand 236 "$match"]"
			puthelp "NOTICE $nick :[dop:lang $hand 237 ""]"
			return 0
		}
	}
	if {$i == 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 238 "$match"]"
	}
}
proc dop:cclearmode {nick host hand chan arg} {
	global dop
	if {$dop(chancom) != 1} {
		return 0
	}
	if {$hand == "*"} {
		return 0
	}
	dop:clearmode $nick $host $hand "$chan $arg"
}
proc dop:clearmode {nick host hand arg} {
	global dop
	set chan [join [lindex [split $arg] 0]]

	if {$chan == ""} { 		
		puthelp "NOTICE $nick :[dop:lang $hand 239 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "*"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		puthelp "NOTICE $nick :[dop:lang $hand 264 "$chan"]"
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}
	if {![validchan $chan]} {
		puthelp "NOTICE $nick :[dop:lang $hand 93 "$chan"]"
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		puthelp "NOTICE $nick :[dop:lang $hand 91 ""]"
		return 0
	}
	if {$access < $dop(clearmode)} {
		puthelp "NOTICE $nick :[dop:lang $hand 92 ""]"
		return 0
	}

	
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {$access >= $dop(clearmode)} {
				set curmode "-[lindex [split [getchanmode $chan] "+"] 1]"
				putserv "MODE $chan $curmode"
			}
		}
	}
}
proc dop:dauthq {nick host hand chan reason} {
	global dop chanfile
	if {[string tolower [dop:readfile "$chanfile.dop" "$chan.floatlimit"]] == "on"} {
		if {[dop:readfile "$chanfile.dop" "$chan.floatperiod"] < 20} {
			dop:writefile "$chanfile.dop" "$chan.floatperiod" 20
		}
		utimer [dop:readfile "$chanfile.dop" "$chan.floatperiod"] "dop:setlimit $chan"
	}

	if {$hand == "*"} { return 0 }
	if {[dopGetuser $hand xtra dop:auth] == 1} {
		if {[dopGetuser $hand xtra dop:authhost] == $host} {
			if {[string tolower [dopGetuser $hand xtra dop:authnick]] == [string tolower $nick]} {
				dopSetuser $hand xtra dop:auth 0
				dopSetuser $hand xtra dop:authhost ""
				dopSetuser $hand xtra dop:authnick ""
				delhost $hand "$nick!*[dop:notild $host]"
			}
		}
	}
}
proc dop:online {nick host hand chan reason} {
	global dop uptime server-online server
	if {$dop(chancom) != 1} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:owner.access] > 501 && [dopGetuser $hand xtra dop:owner.suspend] > 0} {
		return 0
	}
	set access [dopGetuser $hand xtra dop:$chan.access]
	if {[dopGetuser $hand xtra dop:owner.access] >= 501} { set access [dopGetuser $hand xtra dop:owner.access] }
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nick]} {
		return 0
	}
	if {$access < $dop(conline)} {
		return 0
	}
      #set tmp [catch {exec uptime} uptime]

	set access [dopGetuser $hand xtra dop:owner.access]

	set tmp [dop:ctime $uptime]
	set day [lindex $tmp 3]
	set hour [lindex $tmp 2]
	set minute [lindex $tmp 1]
	set second [lindex $tmp 0]
	if {$hour < 10} { set hour "0$hour" }
	if {$minute < 10} { set minute "0$minute" }
	if {$second < 10} { set second "0$second" }
	set tmp ""
	append tmp "$day [dop:lang $hand 96 ""], $hour:$minute:$second"

	set srv [dop:ctime ${server-online}]
	set day [lindex $srv 3]
	set hour [lindex $srv 2]
	set minute [lindex $srv 1]
	set second [lindex $srv 0]
	if {$hour < 10} { set hour "0$hour" }
	if {$minute < 10} { set minute "0$minute" }
	if {$second < 10} { set second "0$second" }
	set srv ""
	append srv "$day [dop:lang $hand 96 ""], $hour:$minute:$second"

	set chans 0
	foreach ch [channels] {
		incr chans 1
	}
	set nmbbot 0
	foreach bot [bots] {
		incr nmbbot
	}

	puthelp "PRIVMSG $chan :[dop:lang $hand 97 ""]: $tmp, [dop:lang $hand 98 ""]: $chans, [dop:lang $hand 99 ""]: $dop(tclversion), [dop:lang $hand 100 ""]: $nmbbot, [dop:lang $hand 300 "$server $srv"]"
}
proc dop:dauthall {server numeric servermsg} {
	foreach user [userlist] {
		delhost $user "[dopGetuser $user xtra dop:authnick]!*[dop:notild [dopGetuser $user xtra dop:authhost]]"
		if {[dopGetuser $user xtra dop:auth] == 1} {
			dopSetuser $user xtra dop:auth 0
			dopSetuser $user xtra dop:authhost ""
		}
	}
}
proc dop:ctime {time} {
	set uptime [expr [unixtime] - $time]

	set second [expr $uptime % 60]
	set uptime [expr ($uptime - $second) / 60]

	set minute [expr $uptime % 60]
	set uptime [expr ($uptime - $minute) / 60]

	set hour [expr $uptime % 24]
	set day [expr ($uptime - $hour) / 24]

	return "$second $minute $hour $day"
}

proc dop:vctime {time} {
	set tmp [dop:ctime $time]
	set day [lindex $tmp 3]
	set hour [lindex $tmp 2]
	set minute [lindex $tmp 1]
	set second [lindex $tmp 0]
	if {$hour < 10} { set hour "0$hour" }
	if {$minute < 10} { set minute "0$minute" }
	if {$second < 10} { set second "0$second" }

	set tmp ""
	append tmp "$day days, $hour:$minute:$second"
	return $tmp
}
proc dop:seen {user} {
	if {[dopGetuser $user xtra dop:lastlog] == ""} { return 0 }
	set tmp [dop:ctime [dopGetuser $user xtra dop:lastlog]]
	set day [lindex $tmp 3]
	set hour [lindex $tmp 2]
	set minute [lindex $tmp 1]
	set second [lindex $tmp 0]
	if {$hour < 10} { set hour "0$hour" }
	if {$minute < 10} { set minute "0$minute" }
	if {$second < 10} { set second "0$second" }

	if {[dopGetuser $user xtra dop:lastlog] == 0} {
		return 0
	}
	set tmp ""
	append tmp "$day days, $hour:$minute:$second"
	return $tmp
}

proc strlwr {text} {
	return [string tolower $text]
}
proc dop:filter {x {y ""} } {

	#for {set i 0} {$i < [string length $x]} {incr i} {
	#	switch -- [string index $x $i] {
	#		"\"" {append y "\\\""}
	#		"\\" {append y "\\\\"}
	#		"\[" {append y "\\\["}
	#		"\]" {append y "\\\]"}
	#		"\} " {append y "\\\} "}
	#		"\{" {append y "\\\{"}
	#		"\;" {append y "\\\;"}
	#		default {append y [string index $x $i]}
	#	}
	#}
	return $y
}
proc dop:isin {x} {
	for {set i 0} {$i < [string length $x]} {incr i} {
		if {[string index $x $i] == "*"} {
			return 1
		}
	}
	return 0
}
proc dop:notild {x} {
	set out ""
	for {set i 0} {$i < [string length $x]} {incr i} {
		if {[string index $x $i] != "~"} {
			append out [string index $x $i]
		}
	}
	return $out
}

proc dop:vrfychannel {chan} {
	if {[string index $chan 0] == "#"} {
		return 1
	} {
		return 0
	}
}
proc dop:noopset {chan} {
	global botnick chanfile
	if {[dop:readfile "$chanfile.dop" "$chan.noop"] == "on"} {
		foreach nickk [chanlist $chan] {
			if {[strlwr $botnick] != [strlwr $nickk]} {
				if {[isop $nickk $chan]} {
					dop:pushmode $chan "-o" $nickk
					puthelp "NOTICE $nickk :[dop:lang $nickk 200 "$chan"]"
				}
			}
		}
	}
}


proc dop:strictop {chan} {
	global botnick chanfile dopstrict
	if {[dop:readfile "$chanfile.dop" "$chan.strictop"] == "on"} {
		foreach nickk [chanlist $chan] {
			if {[strlwr $botnick] != [strlwr $nickk]} {
				if {[isop $nickk $chan]} {
					if {![dop:oppable $nickk $chan]} {
						dop:pushmode $chan "-o" $nickk
					}
				}
			}
		}
	}
}
proc dop:oppable {nickk chan} {
	global botnick
	set found 0
	set hand [nick2hand $nickk]
	if {$nickk == $botnick} {
		return 1
	}
	if {![dopValiduser $hand]} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] < 100 && [dopGetuser $hand xtra dop:owner.access] < 501} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:auth] != 1} {
		return 0
	}
	if {[dopGetuser $hand xtra dop:$chan.access] > 0 && [dopGetuser $hand xtra dop:$chan.suspend] > 0} {
		return 0
	}
	set host "[getchanhost $nickk]"
	if {[dopGetuser $hand xtra dop:authhost] != $host} {
		return 0
	}
	if {[string tolower [dopGetuser $hand xtra dop:authnick]] != [string tolower $nickk]} {
		return 0
	}
	return 1
}

proc dop:pushmode {chan mode nick} {
	global botnick chanfile
	if {[dop:isin $nick] == "1"} {
		foreach nickk [chanlist $chan] {
			if {[string match [strlwr $nick] [strlwr $nickk]] == "1"} {
				if {[strlwr $botnick] != [strlwr $nickk]} {
					if {$mode == "-o"} {
						if {[dopGetuser [nick2hand $nickk] xtra dop:owner.access] < 500} {
							pushmode $chan $mode $nickk
						}
					} {
						
						if {$mode == "+o"} {
							if {[dop:readfile "$chanfile.dop" "$chan.strictop"] == "on"} {
								if {[dop:oppable $nickk $chan]} {
									pushmode $chan $mode $nickk
								}
							} else {
								pushmode $chan $mode $nickk
							}

						} else {
							pushmode $chan $mode $nickk
						}

					}
				}
			}
		}
		return 0
	}
	set nick [split $nick]
	foreach nickk $nick {
		if {$mode == "+o"} {
			if {[dop:readfile "$chanfile.dop" "$chan.strictop"] == "on"} {
				if {[dop:oppable $nickk $chan]} {
					pushmode $chan $mode $nickk
				}
			} else {
				pushmode $chan $mode $nickk
			}

		} else {
			pushmode $chan $mode $nickk
		}
	}
}

proc dop:readfile {file var} {
	global dop

	if {$dop(mysqladddon) == 1} {
		return [dopGetChan $var]
	}
	dop:checkfile $file
	set fo [open $file r]
	set read [read $fo 10000000]

	set spl [split $read ";"]

	foreach line $spl {
		set first [join [lindex [split $line] 0]]
		set sec [join [lrange [split $line] 1 end]]
		if {[string match [strlwr $var] [strlwr $first]]} {
			close $fo
			return $sec
		}
	}
	close $fo
	return ""
}
proc dop:writefile {file var value} {
	global dop

	if {$dop(mysqladddon) == 1} {
		dopSetChan $var $value
		return 0
	}
	dop:checkfile $file
	if {$value == ""} { 
		dop:removefile $file $var
		return 0
	}
	set fo [open $file r]
	set read [read $fo 10000000]
	close $fo
	set fo [open $file w]

	set spl [split $read ";"]
	set found 0
	foreach line $spl {
		set first [lindex $line 0]
		set sec [lrange $line 1 end]
		if {[string match [strlwr $var] [strlwr $first]]} {
			append app "$first $value;"
			set found 1
		} else {
			if {$first != ""} {
				append app "$first $sec;"
			}
		}
	}
	if {$found == 0} {
		append app "$var $value;"
	}
	puts $fo $app
	close $fo
}

proc dop:removefile {file var} {
	dop:checkfile $file
	set fo [open $file r]
	set read [read $fo 10000000]
	close $fo
	set fo [open $file w]
	set spl [split $read ";"]

	set app ""
	foreach line $spl {
		set first [lindex $line 0]
		set sec [lrange $line 1 end]
		if {![string match [strlwr $var] [strlwr $first]]} {
			if {$first != ""} {
				append app "$first $sec;"
			}
		}
	}
	puts $fo $app
	close $fo
}


proc dop:checkfile {file} {
	if {![file exists $file]} {
		set fo [open $file w]
		puts $fo ""
		close $fo
	}
}

proc dop:getlimit {chan} {
	set mode [split [getchanmode $chan]]
	set modes [lindex $mode 0]
	set lim [lindex $mode 1]
	set pass [lindex $mode 2]
	if {$lim > 0} {
		return $lim
	}
	return 0
}

proc dop:isset {chan flag} {
	set flags [channel info $chan]
	foreach flg $flags {
		if {[strlwr $flag] == [strlwr $flg]} {
			return 1
		}
	}
	return 0
}

if {$dop(mysqladddon) == 0} {
	proc dopGetuser {hand info var} {
		return [getuser $hand $info $var]
	}
	proc dopSetuser {hand info var value} {
		if {$info != "pass"} {
			return [setuser $hand $info $var $value]
		}
	}
	proc dopValiduser {hand} {
		return [validuser $hand]
	}
	proc dopPasswdok {hand pass} {
		return [passwdok $hand $pass]
	}
	proc dopRemuser {hand} {
		return 1
	}
	proc dopValiduser {hand} {
		if {[validuser $hand]} {
			return 1
		} {
			return 0
		}
	}
}


#######################################################################################
#Language section
#Number of language
set dop(numlang) 10

##English - 1
set dop(lang.1.1) "List of expired user:"
set dop(lang.1.2) "Never"
set dop(lang.1.3) "USER -- « -- Last seen: «"
set dop(lang.1.4) "yes"
set dop(lang.1.5) "no"
set dop(lang.1.6) "Host"
set dop(lang.1.7) "Identified"
set dop(lang.1.8) "Language"
set dop(lang.1.9) "Last Seen"
set dop(lang.1.10) "Access"
set dop(lang.1.11) "No access"
set dop(lang.1.12) "URL"
set dop(lang.1.13) "DESC"
set dop(lang.1.14) "KEYWORDS"
set dop(lang.1.15) "Nick"
set dop(lang.1.16) "List of dcc commands"
set dop(lang.1.17) "number of day"
set dop(lang.1.18) "SYNTAX: HELP \[command\]"
set dop(lang.1.19) "/msg « op <#channel> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.1.20) "Ops one or more persons in your channel. If no nick is specified, and you are not opped on the channel, « will op you."
set dop(lang.1.21) "/msg « deop <#channel> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.1.22) "Deops one or more persons in your channel. If no nick is specified, and you are opped on the channel, $botnick will deop you."
set dop(lang.1.23) "/msg « voice <#channel> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.1.24) "Voices one or more users in your channel."
set dop(lang.1.25) "/msg « devoice <#channel> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.1.26) "Devoices one or more users in your channel."
set dop(lang.1.27) "/msg « access <#channel> <username> \[-min <level>\] \[-max <level>\]"
set dop(lang.1.28) "Can look up the access for a certain person or a string."
set dop(lang.1.29) "/msg « login <username> <password>"
set dop(lang.1.30) "Log yourself into the bot."
set dop(lang.1.31) "/msg « dauth <username> <password>"
set dop(lang.1.32) "To untitentificate yourself."
set dop(lang.1.33) "/msg « help <command>"
set dop(lang.1.34) "Displays help information on a given command."
set dop(lang.1.35) "/msg « uptime"
set dop(lang.1.36) "Displays «'s uptime."
set dop(lang.1.37) "/msg « verify <nick>"
set dop(lang.1.38) "Displays whether or not a person is logged in, and if so displays their username"
set dop(lang.1.39) "And also indicates whether or not they are an Official Administrator"
set dop(lang.1.40) "/msg « status <#channel>"
set dop(lang.1.41) "Displays channel's status"
set dop(lang.1.42) "/msg « info <username>"
set dop(lang.1.43) "Displays information about a username such as their nick and user@host if they are currently online, "
set dop(lang.1.44) "their language and invisible settings, last seen information. If used on yourself, it also lists all"
set dop(lang.1.45) "channels which you have access on (only Administrator and you can see this information, not other users)."
set dop(lang.1.46) "If you wish to make this information hidden to the public, refer to the SET INVISIBLE command (level 0)."
set dop(lang.1.47) "/msg « showcommands <#channel>"
set dop(lang.1.48) "Shows the commands available to you for a given channel."
set dop(lang.1.49) "/msg « ban <#channel> <nick|*!*user@*.host> \[reason\]"
set dop(lang.1.50) "Adds a specific *!*user@*.host to the « banlist of your channel."
set dop(lang.1.51) "/msg « unban <#channel> <nick|*!*user@*.host>"
set dop(lang.1.52) "Removes a *!*user@*.host from the $botnick banlist of your channel and any matching bans from the channel banlist also."
set dop(lang.1.53) "/msg « topic <#channel> <topic>"
set dop(lang.1.54) "Makes « change the topic in your channel."
set dop(lang.1.55) "/msg « clearmode <#channel>"
set dop(lang.1.56) "Clears all channel modes. Can be used when your channel has been locked up (set +i or +k without your knowledge)."
set dop(lang.1.57) "/msg « kick <#channel> <nick|pattern> \[reason\]"
set dop(lang.1.58) "Makes « kick someone from your channel."
set dop(lang.1.59) "/msg « set <#channel> <variable> <value>"
set dop(lang.1.60) "/msg « set <variable> <value>"
set dop(lang.1.61) "This will set a channel or user account setting."
set dop(lang.1.62) "Useraccount settings: INVISIBLE LANG  - Lang available: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.1.63) "Channel settings: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.1.64) "/msg « invite <#channel>"
set dop(lang.1.65) "Makes « invite you to your channel."
set dop(lang.1.66) "/msg « banlist <#channel>"
set dop(lang.1.67) "Shows the channel banlist. This command works whether you are on the channel or not."
set dop(lang.1.68) "/msg « adduser <#channel> <username> <access>"
set dop(lang.1.69) "Adds a user to the channel's userlist. You cannot ADDUSER someone with equal or higher access than your own."
set dop(lang.1.70) "/msg « remuser <#channel> <username>"
set dop(lang.1.71) "Removes a user from the channel database. You must have higher access than the user you want to remove."
set dop(lang.1.72) "/msg « modinfo <#channel> <access|automode> <username> <value>"
set dop(lang.1.73) "The following commands can be used to make changes to existing users in your channel's userlist."
set dop(lang.1.74) "You cannot modify someone with an equal or higher level."
set dop(lang.1.75) "With the variable access you can change a users accesslevel. The range is 1 to your own level - 1."
set dop(lang.1.76) "The automode variable allows you to set mode none, voice or op."
set dop(lang.1.77) "Based on this setting a user can be voiced, oped when he enters the channel."
set dop(lang.1.78) "** SUSPENDED ** - (Level «)"
set dop(lang.1.79) "Cannot suspend a user with equal or higher access than your own."
set dop(lang.1.80) "/msg « showignore"
set dop(lang.1.81) "Shows «'s ignore list. Ignores happen when someone intentionally or accidentally floods «."
set dop(lang.1.82) "/msg « chaninfo <#channel>"
set dop(lang.1.83) "Displays whether or not a channel is registered and to whom."
set dop(lang.1.84) "/msg « motd"
set dop(lang.1.85) "Displays « message of the day."
set dop(lang.1.86) "/msg « search <search parameter>"
set dop(lang.1.87) "Makes « list channels where the given search parameters match set keywords on the channel, if any."
set dop(lang.1.88) "The use of wildcards are not required."
set dop(lang.1.89) "There is no help available for that topic."
set dop(lang.1.90) "SYNTAX: REMOVEALL <#channel>"
set dop(lang.1.91) "Sorry, You must be logged in to use this command."
set dop(lang.1.92) "Sorry, You have insufficient access to perform that command."
set dop(lang.1.93) "The channel « doesn't appear to be registered."
set dop(lang.1.94) "«!« (auth as «) \[«\] is removing all access on «."
set dop(lang.1.95) "Done. Zapped « access records from «."
set dop(lang.1.96) "days"
set dop(lang.1.97) "Uptime"
set dop(lang.1.98) "Channels"
set dop(lang.1.99) "Version"
set dop(lang.1.100) "Bot linked"
set dop(lang.1.101) "SYNTAX: SHOWCOMMANDS <#channel>"
set dop(lang.1.102) "Level"
set dop(lang.1.103) "SYNTAX: REGUSER <username> <email>"
set dop(lang.1.104) "I don't know who « is."
set dop(lang.1.105) "« already registered."
set dop(lang.1.106) "Email in blacklist: «"
set dop(lang.1.107) "SYNTAX: ADDIGNORE <host>"
set dop(lang.1.108) "«!« (auth as «) \[«\] is adding to the ignore list: «."
set dop(lang.1.109) "Ignored"
set dop(lang.1.110) "Added ignore («)"
set dop(lang.1.111) "SYNTAX: REMIGNORE <host>"
set dop(lang.1.112) "«!« (auth as «) \[«\] is removing from the ignore list: «."
set dop(lang.1.113) "Removed ignore («)"
set dop(lang.1.114) "«!« (auth as «) \[«\] is making jump the bot to: «."
set dop(lang.1.115) "No reason"
set dop(lang.1.116) "«!« (auth as «) \[«\] made me shutdown."
set dop(lang.1.117) "«!« (auth as «) \[«\] is looking at the channel list."
set dop(lang.1.118) "No channel joined by the bot."
set dop(lang.1.119) "End of channel list"
set dop(lang.1.120) "SYNTAX: SAY <#channel> <msg>"
set dop(lang.1.121) "«!« (auth as «) \[«\] is msging on «: «."
set dop(lang.1.122) "SYNTAX: BROADCAST <msg>"
set dop(lang.1.123) "«!« (auth as «) \[«\] is broadcasting: «."
set dop(lang.1.124) "You registered the username: «. On the bot «. To get your username, you have to register it. Here your registration id: «"
set dop(lang.1.125) "Username"
set dop(lang.1.126) "SYNTAX: REGID <verify id>"
set dop(lang.1.127) "«!« (auth as «) \[«\] is rehashing bot configs."
set dop(lang.1.128) "Channel, User and Note files reloaded"
set dop(lang.1.129) "SYNTAX: ADDHAND <username> <email>"
set dop(lang.1.130) "« is already added to the bot."
set dop(lang.1.131) "«!« (auth as «) \[«\] is adding an username: «."
set dop(lang.1.132) "Added hand «"
set dop(lang.1.133) "SYNTAX: CHANINFO <#channel>"
set dop(lang.1.134) "« is registered by:"
set dop(lang.1.135) "- last seen: « ago"
set dop(lang.1.136) "« doesn't appear to have an user with an access 500."
set dop(lang.1.137) "«!« (auth as «) \[«\] is looking at the username list."
set dop(lang.1.138) "- « (owner)"
set dop(lang.1.139) "- « (normal user)"
set dop(lang.1.140) "End of hand list"
set dop(lang.1.141) "SYNTAX: REMHAND <username>"
set dop(lang.1.142) "«!« (auth as «) \[«\] is removing an username: «"
set dop(lang.1.143) "Removed hand «"
set dop(lang.1.144) "SYNTAX: REGISTER <#channel>"
set dop(lang.1.145) "« is already added."
set dop(lang.1.146) "«!« (auth as «) \[«\] is adding a channel: «"
set dop(lang.1.147) "Added channel «"
set dop(lang.1.148) "SYNTAX: PURGE <#channel>"
set dop(lang.1.149) "«!« (auth as «) \[«\] is removing a channel: «"
set dop(lang.1.150) "Removed chan «"
set dop(lang.1.151) "« is an Official Service Bot."
set dop(lang.1.152) "«« is NOT logged in."
set dop(lang.1.153) "I don't see « anywhere."
set dop(lang.1.154) "«« is an Official Bot Administrator and logged in as «."
set dop(lang.1.155) "«« is logged in as «."
set dop(lang.1.156) "Your host doesn't match anyone of mine."
set dop(lang.1.157) "Type /msg « regid «"
set dop(lang.1.158) "You don't have any password set yet."
set dop(lang.1.159) "HOSTADDING FAILED as « (Invalid Password)"
set dop(lang.1.160) "Your host as been added to « (*!*«)"
set dop(lang.1.161) "SYNTAX: LOGIN <username> <password>"
set dop(lang.1.162) "Sorry, You are already authenticated as «"
set dop(lang.1.163) "AUTHENTICATION FAILED as « (Invalid Password)"
set dop(lang.1.164) "«!« (auth as «) \[«\] authorization FAILED."
set dop(lang.1.165) "AUTHENTICATION SUCCESSFUL as «."
set dop(lang.1.166) "«!« (auth as «) \[«\] is now authentificated as an owner."
set dop(lang.1.167) "SYNTAX: DAUTH <username> <password>"
set dop(lang.1.168) "DEAUTHENTICATION FAILED as « (Invalid password)"
set dop(lang.1.169) "DEAUTHENTICATION SUCCESSFUL as «."
set dop(lang.1.170) "SUSPENSION for « on « is actived"
set dop(lang.1.171) "SYNTAX: SUSPEND <channel> <user> \[level\]"
set dop(lang.1.172) "SYNTAX: UNSUSPEND <channel> <user>"
set dop(lang.1.173) "SYNTAX: ADDUSER <#channel> <username> <access>"
set dop(lang.1.174) "« is already added to « with access level «."
set dop(lang.1.175) "Cannot add a user with equal or higher access than your own."
set dop(lang.1.176) "Invalid access level."
set dop(lang.1.177) "Added user « to « with access level «."
set dop(lang.1.178) "SYNTAX: REMUSER <#channel> <username>"
set dop(lang.1.179) "« doesn't appear to have access in «"
set dop(lang.1.180) "Removed user « from «."
set dop(lang.1.181) "SYNTAX: MODINFO <#channel> \[ACCESS <username> <level>\] \[AUTOMODE <username> <NONE|OP|VOICE>\]"
set dop(lang.1.182) "Modified «'s access level on channel « to «."
set dop(lang.1.183) "Set AUTOMODE to OP for « on channel «"
set dop(lang.1.184) "Set AUTOMODE to VOICE for « on channel «"
set dop(lang.1.185) "Set AUTOMODE to NONE for « on channel «"
set dop(lang.1.186) "SYNTAX: SET \[#channel\] <variable> <value> or, SET <invisible> <ON|OFF>, SET <lang> <language number>"
set dop(lang.1.187) "Your INVISIBLE setting is now ON."
set dop(lang.1.188) "Your INVISIBLE setting is now OFF."
set dop(lang.1.189) "value of INVISIBLE must be ON or OFF"
set dop(lang.1.190) "Your LANG setting is now «."
set dop(lang.1.191) "Language number must be between 1 to «."
set dop(lang.1.192) "« for « is: «"
set dop(lang.1.193) "value of AUTOTOPIC must be ON or OFF"
set dop(lang.1.194) "value of NOOP must be ON or OFF"
set dop(lang.1.195) "« for « is cleared."
set dop(lang.1.196) "value of STRICTOP must be ON or OFF"
set dop(lang.1.197) "SYNTAX: INVITE <#channel>"
set dop(lang.1.198) "Sorry, You are already on «."
set dop(lang.1.199) "SYNTAX: OP <#channel> \[nick\] \[nick\] .."
set dop(lang.1.200) "The NOOP flag is set on «"
set dop(lang.1.201) "SYNTAX: DEOP <#channel> \[nick\] \[nick\] .."
set dop(lang.1.202) "I don't think « would appreciate that."
set dop(lang.1.203) "SYNTAX: VOICE <#channel> \[nick\] \[nick\] .."
set dop(lang.1.204) "SYNTAX: DEVOICE <#channel> \[nick\] \[nick\] .."
set dop(lang.1.205) "SYNTAX: BAN <#channel> <nick | *!*user@*.host> \[lifetime\] \[reason\]"
set dop(lang.1.206) "SYNTAX: KICK <#channel> <nick> <reason>"
set dop(lang.1.207) "SYNTAX: TOPIC <#channel> <topic>"
set dop(lang.1.208) "SYNTAX: UNBAN <#channel> <*!*user@*.host>"
set dop(lang.1.209) "Removed 1 bans that matched «"
set dop(lang.1.210) "SYNTAX: BANLIST <#channel>"
set dop(lang.1.211) "-« by «"
set dop(lang.1.212) "End of ban list"
set dop(lang.1.213) "SYNTAX: INFO <username>"
set dop(lang.1.214) "Unable to view user details (Invisible)"
set dop(lang.1.215) "Information about: «"
set dop(lang.1.216) "Currently logged on via:"
set dop(lang.1.217) "OFFLINE"
set dop(lang.1.218) "INVISIBLE is «"
set dop(lang.1.219) "Channels"
set dop(lang.1.220) "SYNTAX: ACCESS <#channel> <username> \[-min <level>\] \[-max <level>\]"
set dop(lang.1.221) "Invalid minimum level."
set dop(lang.1.222) "Invalid maximum level."
set dop(lang.1.223) "USER: « ACCESS: « «"
set dop(lang.1.224) "CHANNEL: « -- AUTOMODE: «"
set dop(lang.1.225) "LAST SEEN: « ago."
set dop(lang.1.226) "No Match!"
set dop(lang.1.227) "End of access list"
set dop(lang.1.228) "SYNTAX: STATUS <#channel>"
set dop(lang.1.229) "Channel « has « users (« operators)"
set dop(lang.1.230) "Mode is: «"
set dop(lang.1.231) "I'm currently in this channel."
set dop(lang.1.232) "Flood setting"
set dop(lang.1.233) "Flags set"
set dop(lang.1.234) "Ignore list:"
set dop(lang.1.235) "End of Ignore List"
set dop(lang.1.236) "There are more than 10 entries matching \[«\]"
set dop(lang.1.237) "Please restrict your search mask"
set dop(lang.1.238) "No matching entries for \[«\]"
set dop(lang.1.239) "SYNTAX: CLEARMODE <#channel>"
set dop(lang.1.240) "No expired user."
set dop(lang.1.241) "Bot nick"
set dop(lang.1.242) "«« is an Official Bot Manager and logged in as «."
set dop(lang.1.243) "«« is an Official Bot Owner and logged in as «."
set dop(lang.1.244) "There is already a master on this channel."
set dop(lang.1.245) "Registration email for « with your confirmation has been sent to «."
set dop(lang.1.246) "AUTHENTICATION FAILED as «. (Maximum concurrent logins exceeded)."
set dop(lang.1.247) "Current Sessions: «"
set dop(lang.1.248) "« is not logged in."
set dop(lang.1.249) "Username: « Registered with the email: «"
set dop(lang.1.250) "You can type /msg « pass « <your pass> from now on!"
set dop(lang.1.251) "Registration number not found!"
set dop(lang.1.252) "SYNTAX: PASS <username> <password>"
set dop(lang.1.253) "PASS CHANGING FAILED as « (Invalid Password)"
set dop(lang.1.254) "Password should be longer than « letters."
set dop(lang.1.255) "Password set to: «"
set dop(lang.1.256) "Password already set.. Use /msg « pass <old pass> <new pass>"
set dop(lang.1.257) "Email:"
set dop(lang.1.258) "Not verified (Added since «)"
set dop(lang.1.259) "You didn't register your regid yet!"
set dop(lang.1.260) "SYNTAX: JOIN <channel>"
set dop(lang.1.261) "SYNTAX: PART <channel>"
set dop(lang.1.262) "At the request of «"
set dop(lang.1.263) "I'm not in this channel."
set dop(lang.1.264) "Your access on « has been suspended."
set dop(lang.1.265) "SUSPENSION for « on « is cancelled"
set dop(lang.1.266) "Cannot unsuspend a suspend with equal or higher level than your own."
set dop(lang.1.267) "/msg « join <#channel>"
set dop(lang.1.268) "Makes « join a channel."
set dop(lang.1.269) "/msg « part <#channel>"
set dop(lang.1.270) "Makes « part your channel."
set dop(lang.1.271) "/msg « suspend <#channel> <username> \[level\]"
set dop(lang.1.272) "Suspends a user's access to « on your channel's userlist for the specified level if given."
set dop(lang.1.273) "If a level is not specified, the default suspension level used will be the access level of the issuer."
set dop(lang.1.274) "You can only SUSPEND someone with access lower than your own."
set dop(lang.1.275) "/msg « unsuspend <#channel> <username>"
set dop(lang.1.276) "Unsuspends a user's access to « on your channel's userlist. "
set dop(lang.1.277) "You can only UNSUSPEND someone with access lower than your own,"
set dop(lang.1.278) "provided that the suspension level is also less than or equal to your own access level."
set dop(lang.1.279) "/msg « reguser <username> <valid email>"
set dop(lang.1.280) "Create a username. It will verify authenticicy of the email."
set dop(lang.1.281) "/msg « regid <authentifcation id>"
set dop(lang.1.282) "Make your username usable."
set dop(lang.1.283) "/msg « pass <username> <password>"
set dop(lang.1.284) "It set your password."
set dop(lang.1.285) "Invalid channel name."
set dop(lang.1.286) "Added ban « to «."
set dop(lang.1.287) "value of FLOATLIM must be ON or OFF"
set dop(lang.1.288) "Invalid floating-limit Margin (2-20 Allowed)."
set dop(lang.1.289) "Invalid floating-limit max (0-65536 Allowed)."
set dop(lang.1.290) "Invalid floating-limit period (20-200 Allowed)."
set dop(lang.1.291) "Invalid floating-grace setting (0-19 Allowed)."
set dop(lang.1.292) "SYNTAX: CYCLE <#channel>"
set dop(lang.1.293) "SYNTAX: ACTION <#channel> <action/msg>"
set dop(lang.1.294) "«!« (auth as «) \[«\] make me do an action on «: «"
set dop(lang.1.295) "/msg « cycle <#channel>"
set dop(lang.1.296) "Makes « cycle your channel."
set dop(lang.1.297) "« for « minutes."
set dop(lang.1.298) "« for ever"
set dop(lang.1.299) "This email adress has an invalid syntax. (..@..)"
set dop(lang.1.300) "Connected via « since «"


##Francais - 2
set dop(lang.2.1) "Liste d'utilisateur expiré:"
set dop(lang.2.2) "Jamais"
set dop(lang.2.3) "Utilisateur -- « -- Dernière fois vue: «"
set dop(lang.2.4) "oui"
set dop(lang.2.5) "non"
set dop(lang.2.6) "Adresse"
set dop(lang.2.7) "Identifié"
set dop(lang.2.8) "Langue"
set dop(lang.2.9) "Dernière fois vue"
set dop(lang.2.10) "Accès"
set dop(lang.2.11) "Pas d'accès"
set dop(lang.2.12) "Adresse internet"
set dop(lang.2.13) "Description"
set dop(lang.2.14) "Mots clés"
set dop(lang.2.15) "Pseudonyme"
set dop(lang.2.16) "Liste de commandes en dcc"
set dop(lang.2.17) "nombre de jours"
set dop(lang.2.18) "SYNTAX: HELP \[commande\]"
set dop(lang.2.19) "/msg « op <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.2.20) "Oppe une ou plusieurs personnes dans le canal spécifié. Si aucun nickname n'est spécifié, et que vous n'êtes pas déjà oppé, « vous oppera."
set dop(lang.2.21) "/msg « deop <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.2.22) "Déoppe une ou plusieurs personnes dans votre canal. Si aucun nickname n'est spécifié « vous déopera vous."
set dop(lang.2.23) "/msg « voice <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.2.24) "Voice (+v) un ou plusieurs nickname dans votre canal."
set dop(lang.2.25) "/msg « devoice <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.2.26) "Dévoice (-v) un ou plusieur utilisateurs dans votre canal."
set dop(lang.2.27) "/msg « access <#canal> <*|utilisateur|> \[-min <niveau>\] \[-max <niveau>\]"
set dop(lang.2.28) "Peut afficher l'accès pour une certaine personne ou une chaine de caractère. L'information indique le niveau d'accès ainsi que la dernière fois que l'utilisateur à été vu."
set dop(lang.2.29) "/msg « login <utilisateur> <mot_de_passe>"
set dop(lang.2.30) "Ceci charge votre accès dans la mémoire du bot et vous authentifie sur tous les canaux auquels vous avez accès.."
set dop(lang.2.31) "/msg « dauth <utilisateur> <mot_de_passe>>"
set dop(lang.2.32) "Ceci change votre accès dans la mémoire du bot et vous désauthentifie sur tous les canaux auquels vous avez accès.."
set dop(lang.2.33) "/msg « help <commande>"
set dop(lang.2.34) "Affiche l'aide pour la commande spécifiée."
set dop(lang.2.35) "/msg « uptime"
set dop(lang.2.36) "Ceci affichera le nombre de temps depuis que « est ouvert."
set dop(lang.2.37) "/msg « verify <nickname>"
set dop(lang.2.38) "Affiche si la personne est logguée ou non, et si oui, sous quel nom d'utilisateur"
set dop(lang.2.39) "et indique aussi si la personne est un Administrateur, ou un Représentant, et/ou un Opérateur IRC."
set dop(lang.2.40) "/msg « status <#canal>"
set dop(lang.2.41) "Donnes des informations sur les utilisateurs loggués sur le canal, etc."
set dop(lang.2.42) "/msg « info <utilisateur>"
set dop(lang.2.43) "Affiche des informations sur un utilisateur, telles que son nom nickname et user@host si il est en ligne,"
set dop(lang.2.44) "son language et savoir si il est invisible et l'heure de la dernière fois ou l'utilisateur à été vu."
set dop(lang.2.45) "Si vous l'utilisez sur vous-même, celà listera également les canaux auquels vous avez accès (seulement les Administrateur et vous même pouvez voir cette information, pas les autres utilisateurs)."
set dop(lang.2.46) "Si vous souhaitez cacher cette information au public, voir à la commande SET INVISIBLE (niveau 0)."
set dop(lang.2.47) "/msg « showcommands <#canal>"
set dop(lang.2.48) "Montre les commandes disponibles pour vous sur le canal spécifié."
set dop(lang.2.49) "/msg « ban <#canal> <nickname|*!*user@*.host> \[raison\]"
set dop(lang.2.50) "Ajoute un *!*user@*.host spécifique à la liste des bans de $botnick de votre canal."
set dop(lang.2.51) "/msg « unban <#canal> <nickname|*!*user@*.host>"
set dop(lang.2.52) "Supprime le *!*user@*.host spécifié de la liste interne de $botnick pour votre canal ainsi que du canal le cas échéant."
set dop(lang.2.53) "/msg « topic <#canal> <titre>"
set dop(lang.2.54) "Fait que « change le topic (titre du canal) dans votre canal."
set dop(lang.2.55) "/msg « clearmode <#canal>"
set dop(lang.2.56) "Supprime tous les modes du canal. Peut être utilisé lorsque votre canal à été bloqué (mis +i ou +k sans votre consentement)."
set dop(lang.2.57) "/msg « kick <#canal> <nickname> \[raison\]"
set dop(lang.2.58) "Demandes à « d'éjecter quelqu'un du canal spécifié."
set dop(lang.2.59) "/msg « set <#canal> <variable> <valeur>"
set dop(lang.2.60) "/msg « set <variable> <valeur>"
set dop(lang.2.61) "Cette commande vous permet de définir les parametres de votre canal et les parametres personels."
set dop(lang.2.62) "Parametre personnels: INVISIBLE LANG - Langue disponible: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.2.63) "Parametres de canal: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.2.64) "/msg « invite <#canal>"
set dop(lang.2.65) "Demandes à « de vous inviter sur le canal spécifié."
set dop(lang.2.66) "/msg « banlist <#canal>"
set dop(lang.2.67) "Montre la liste des bans du canal. Cette commande marche que vous soyez ou non dans le canal."
set dop(lang.2.68) "/msg « adduser <#canal> <utilisateur> <niveau>"
set dop(lang.2.69) "Ajoute un utilisateur au canal. Vous ne pouvez pas ajouter quelqu'un avec un niveau d'accès égal ou supérieur au votre."
set dop(lang.2.70) "/msg « remuser <#channel> <username>"
set dop(lang.2.71) "Supprime l'utilisateur spécifié du canal spécifié. Vous devez avoir un accès supérieur à l'accès de l'utilisateur que vous souhaitez effacer."
set dop(lang.2.72) "/msg « modinfo <#canal> <ACCESS|AUTOMODE> <utilisateur> <valeur>"
set dop(lang.2.73) "Cette commande peut être utilisée pour effectuer des changement sur des utilisateurs ayant un accès sur le canal spécifié."
set dop(lang.2.74) "Vous ne pouvez pas modifier quelqu'un ayant un niveau supérieur ou égal au votre."
set dop(lang.2.75) "Avec la variable ACCESS vous pouvez changer le niveau d'un utilisateur. De 1 à ( votre_niveau - 1 )."
set dop(lang.2.76) "La variable AUTOMODE permets de définir NONE, VOICE or OP comme valeurs."
set dop(lang.2.77) "Basé sur ces règlages, un utilisateur peut être voicé ou oppé lorsqu'il entre dans le canal."
set dop(lang.2.78) "** SUSPENDU ** - (Niveau «)"
set dop(lang.2.79) "Nous ne pouvez suspendre un utilisateur avec un accès égal ou supérieur à la votre."
set dop(lang.2.80) "/msg « showignore"
set dop(lang.2.81) "Montre la liste des user@host ignorés pas «. « ignore lorsque quelqu'un exprès ou par accident le flood."
set dop(lang.2.82) "/msg « chaninfo <#canal>"
set dop(lang.2.83) "Montre si un canal est enregistré ou non, à qui, et les DESCRIPTION et URL courantes le cas échéant."
set dop(lang.2.84) "/msg « motd"
set dop(lang.2.85) "Affiche le message du jour de «."
set dop(lang.2.86) "/msg « search <paramètre_de_recherche>"
set dop(lang.2.87) "Lances une recherche parmis les canaux de « où le paramètre de recherche spécifié correspond à un des mots clés d'un canal."
set dop(lang.2.88) "L'utilisation de wildcards (*) n'est pas requis."
set dop(lang.2.89) "Il n'y a pas d'aide disponible pour ce titre."
set dop(lang.2.90) "SYNTAX: REMOVEALL <#canal>"
set dop(lang.2.91) "Désolé, vous devez être identifié pour utiliser cette commande."
set dop(lang.2.92) "Désolé, vous avez une accès insufisente pour utiliser cette commande."
set dop(lang.2.93) "Le canal « n'apparait pas comme étant enregistrer."
set dop(lang.2.94) "«!« (identifié étant «) \[«\] à enlever tous les accès sur «."
set dop(lang.2.95) "Fait. Effacé « accès de «."
set dop(lang.2.96) "jours"
set dop(lang.2.97) "Temps d'ouverture"
set dop(lang.2.98) "Canaux"
set dop(lang.2.99) "Version"
set dop(lang.2.100) "Robot relié"
set dop(lang.2.101) "SYNTAX: SHOWCOMMANDS <#canal>"
set dop(lang.2.102) "Niveau"
set dop(lang.2.103) "SYNTAX: REGUSER <utilisateur> <adresse email>"
set dop(lang.2.104) "Je ne sais pas qui est «."
set dop(lang.2.105) "« est déjà enregistré."
set dop(lang.2.106) "Adresse email non valide (liste noire)"
set dop(lang.2.107) "SYNTAX: ADDIGNORE <adresse>"
set dop(lang.2.108) "«!« (identifié étant «) \[«\] à ajouter dans la liste d'ignoré: «."
set dop(lang.2.109) "Ignoré"
set dop(lang.2.110) "Ignore ajouter («)"
set dop(lang.2.111) "SYNTAX: REMIGNORE <adresse>"
set dop(lang.2.112) "«!« (identifié étant «) \[«\] à enlever dans la liste d'ignoré: «."
set dop(lang.2.113) "Ignore enlever («)"
set dop(lang.2.114) "«!« (identifié étant «) \[«\] me fait changer de serveur pour: «."
set dop(lang.2.115) "Pas de raison"
set dop(lang.2.116) "«!« (identifié étant «) \[«\] me fait fermer."
set dop(lang.2.117) "«!« (identifié étant «) \[«\] regarde la liste de channel."
set dop(lang.2.118) "Pas de canal join par le robot."
set dop(lang.2.119) "Fin de la liste des canaux"
set dop(lang.2.120) "SYNTAX: SAY <#canaux> <message>"
set dop(lang.2.121) "«!« (identifié étant «) \[«\] me fait parler sur «: «."
set dop(lang.2.122) "SYNTAX: BROADCAST <message>"
set dop(lang.2.123) "«!« (identifié étant «) \[«\] me fait parler partout: «."
set dop(lang.2.124) "Vous avez enregistré le non d'utilisateur suivant: « sur le robot «. Pour pouvoir utiliser ce nom d'utilisateur, vous devez l'enregistrer avec le numero d'enregistrement suivant: «"
set dop(lang.2.125) "Utilisateur:"
set dop(lang.2.126) "SYNTAX: REGID <numéro d'enregistrement>"
set dop(lang.2.127) "«!« (identifié étant «) \[«\] m'à fait recharger mes fichiers."
set dop(lang.2.128) "Les fichiers des canaux, des utilisateur et des notes on été rechargés."
set dop(lang.2.129) "SYNTAX: ADDHAND <username> <adresse email>"
set dop(lang.2.130) "« est déjà ajouter au robot."
set dop(lang.2.131) "«!« (identifié étant «) \[«\] à ajouté un username: «."
set dop(lang.2.132) "Utilisateur ajouter: «"
set dop(lang.2.133) "SYNTAX: CHANINFO <#canal>"
set dop(lang.2.134) "« est enregistré par:"
set dop(lang.2.135) "- dernière fois vue: « ago"
set dop(lang.2.136) "« n'apparait pas comme ayant un utilisateur au niveau 500."
set dop(lang.2.137) "«!« (identifié étant «) \[«\] regarde dans la liste d'username."
set dop(lang.2.138) "- « (propriétaire)"
set dop(lang.2.139) "- « (utilisateur normal)"
set dop(lang.2.140) "Fin de la liste des usernames."
set dop(lang.2.141) "SYNTAX: REMHAND <username>"
set dop(lang.2.142) "«!« (identifié étant «) \[«\] à enlever le username suivant: «"
set dop(lang.2.143) "Username enlevé «"
set dop(lang.2.144) "SYNTAX: REGISTER <#canal>"
set dop(lang.2.145) "« est déjà ajouté."
set dop(lang.2.146) "«!« (identifié étant «) \[«\] à ajouter le canal suivant: «"
set dop(lang.2.147) "Canal ajouté «"
set dop(lang.2.148) "SYNTAX: PURGE <#canal>"
set dop(lang.2.149) "«!« (identifié étant «) \[«\] à enlever le canal suivant: «"
set dop(lang.2.150) "Canal enlevé «"
set dop(lang.2.151) "« est un Robot de service officiel."
set dop(lang.2.152) "«« n'est pas authentifié."
set dop(lang.2.153) "Je suis incapable de trouver «"
set dop(lang.2.154) "«« est un Administrateur Officiel et est authentifié sous le nom d'utilisateur «."
set dop(lang.2.155) "«« est authentifié sous le nom d'utilisateur «."
set dop(lang.2.156) "Votre adresse ne corespond pas à mes adresses."
set dop(lang.2.157) "Tappez /msg « regid «"
set dop(lang.2.158) "Vous n'avez pas de mot de pass enregistré."
set dop(lang.2.159) "L'ajout d'adresse à éjoué sous le nom de « (Mot de pass invalide)"
set dop(lang.2.160) "Votre nouvelle adresse a été ajouté à « (*!*«)"
set dop(lang.2.161) "SYNTAX: LOGIN <username> <mot_de_pass>"
set dop(lang.2.162) "Désolé. Vous êtes déjà authentifié sous le nom d'utilisateur «"
set dop(lang.2.163) "AUTHENTIFICATION REFUSÉE pour « (Mot de passe Invalide)"
set dop(lang.2.164) "«!« (identifié étant «) \[«\] à ÉCHOUÉ sont identification."
set dop(lang.2.165) "AUTHENTIFICATION RÉUSSIE pour «."
set dop(lang.2.166) "«!« (identifié étant «) \[«\] est maitenant reconnu comme étant propriétaire."
set dop(lang.2.167) "SYNTAX: DAUTH <utilisateur> <mot_de_pass>"
set dop(lang.2.168) "DEAUTHENTICATION REFUSÉ pour « (Mot de pass invalide)"
set dop(lang.2.169) "DEAUTHENTICATION RÉUSSIE pour «."
set dop(lang.2.170) "La suspension pour « sur « est actif"
set dop(lang.2.171) "SYNTAX: SUSPEND <canal> <utilisateur> \[niveau\]"
set dop(lang.2.172) "SYNTAX: UNSUSPEND <canal> <utilisateur>"
set dop(lang.2.173) "SYNTAX: ADDUSER <#canal> <username> <niveau>"
set dop(lang.2.174) "« a déjà été ajouté sur « au niveau «."
set dop(lang.2.175) "Vous ne pouvez pas ajouter un utilisateur à un niveau égal ou supérieur au votre. "
set dop(lang.2.176) "Niveau d'accès invalide"
set dop(lang.2.177) "Utilisateur « ajouté sur « au niveau «."
set dop(lang.2.178) "SYNTAX: REMUSER <#canal> <username>"
set dop(lang.2.179) "« n'apparaît pas comme ayant accès sur «"
set dop(lang.2.180) "L'accès de l'utilisateur « a été effacé sur «."
set dop(lang.2.181) "SYNTAX: MODINFO <#canal> \[ACCESS <username> <niveau>\] \[AUTOMODE <username> <NONE|OP|VOICE>\]"
set dop(lang.2.182) "Modification du niveau de « sur le canal « à « effectuée."
set dop(lang.2.183) "Activation du MODE Automatique (OP) pour « sur le canal «"
set dop(lang.2.184) "Activation du MODE Automatique (VOICE) pour « sur le canal «"
set dop(lang.2.185) "Désactivation des MODES Automatiques pour « sur le canal «"
set dop(lang.2.186) "SYNTAX: SET \[#canal\] <variable> <valeur> ou, SET INVISIBLE <ON|OFF> ou, SET LANG <numero de langue>"
set dop(lang.2.187) "Le mode INVISIBLE pour vos informations est maintenant à ON."
set dop(lang.2.188) "Le mode INVISIBLE pour vos informations est maintenant à OFF."
set dop(lang.2.189) "La valeur de INVISIBLE doit être ON ou OFF"
set dop(lang.2.190) "Langue activée: «."
set dop(lang.2.191) "Le numero de langue doit etre entre 1 à «."
set dop(lang.2.192) "« pour « est: «"
set dop(lang.2.193) "La valeur de AUTOTOPIC doit être ON ou OFF"
set dop(lang.2.194) "La valeur de NOOP doit être ON ou OFF"
set dop(lang.2.195) "« pour « est effacé."
set dop(lang.2.196) "La valeur de STRICTOP doit être ON ou OFF"
set dop(lang.2.197) "SYNTAX: INVITE <#canal>"
set dop(lang.2.198) "Désolé, vous êtes déjà sur «."
set dop(lang.2.199) "SYNTAX: OP <#canal> \[nick\] \[nick\] .."
set dop(lang.2.200) "NOOP pour « est ON"
set dop(lang.2.201) "SYNTAX: DEOP <#canal> \[nick\] \[nick\] .."
set dop(lang.2.202) "Je ne crois pas que « apprécierait ça."
set dop(lang.2.203) "SYNTAX: VOICE <#canal> \[nick\] \[nick\] .."
set dop(lang.2.204) "SYNTAX: DEVOICE <#canal> \[nick\] \[nick\] .."
set dop(lang.2.205) "SYNTAX: BAN <#canal> <nick | *!*user@*.host> \[duré de vie\] \[raison\]"
set dop(lang.2.206) "SYNTAX: KICK <#canal> <nick> <raison>"
set dop(lang.2.207) "SYNTAX: TOPIC <#canal> <titre>"
set dop(lang.2.208) "SYNTAX: UNBAN <#canal> <*!*user@*.host>"
set dop(lang.2.209) "« ban(s) correpondant à « ont été supprimés."
set dop(lang.2.210) "SYNTAX: BANLIST <#canal>"
set dop(lang.2.211) "-« par «"
set dop(lang.2.212) "Fin de la liste des bans"
set dop(lang.2.213) "SYNTAX: INFO <username>"
set dop(lang.2.214) "Impossible de voir les détails de l'utilisateur (Invisible)."
set dop(lang.2.215) "Informations sur: «"
set dop(lang.2.216) "Currently logged on via:"
set dop(lang.2.217) "HORS LIGNE"
set dop(lang.2.218) "INVISIBLE est «"
set dop(lang.2.219) "Canaux"
set dop(lang.2.220) "SYNTAX: ACCESS <#canal> <username>  \[-min <niveau>\] \[-max <niveau>\]"
set dop(lang.2.221) "Niveau minimum invalide."
set dop(lang.2.222) "Niveau maximum invalide."
set dop(lang.2.223) "UTILISATEUR: « NIVEAU: « «"
set dop(lang.2.224) "CANAL: « -- AUTOMODE: «"
set dop(lang.2.225) "DERNIÈRE FOIS VU: « ago."
set dop(lang.2.226) "Aucune correspondance trouvée!"
set dop(lang.2.227) "Fin de la liste des accès"
set dop(lang.2.228) "SYNTAX: STATUS <#canal>"
set dop(lang.2.229) "Le canal « à « utilisateur(s) (« opérateur(s))"
set dop(lang.2.230) "Les Modes du canal sont: «"
set dop(lang.2.231) "Je suis présentement dans ce canal."
set dop(lang.2.232) "Paramètre de flood"
set dop(lang.2.233) "Flags actifs"
set dop(lang.2.234) "Liste de silence/ignore:"
set dop(lang.2.235) "Fin de la liste de silence/ignore "
set dop(lang.2.236) "Il y a plus que 10 correspondaces \[«\]"
set dop(lang.2.237) "Veuillez rafiner votre recherche"
set dop(lang.2.238) "Aucune correspondance trouvée pour \[«\]"
set dop(lang.2.239) "SYNTAX: CLEARMODE <#canal>"
set dop(lang.2.240) "Pas d'utilisateur expiré."
set dop(lang.2.241) "Nickname du robot."
set dop(lang.2.242) "«« est un Directeur Officiel et est authentifié sous le nom d'utilisateur «."
set dop(lang.2.243) "«« est un Propriétaire Officiel et est authentifié sous le nom d'utilisateur «."
set dop(lang.2.244) "Il y a déjà un propriétaire sur ce canal."
set dop(lang.2.245) "Le email d'authorisation pour « a été envoyé à «"
set dop(lang.2.246) "AUTHENTIFICATION REFUSÉE pour « (Nombre d'utilisateur maximal atteinte)."
set dop(lang.2.247) "Session en cours: «"
set dop(lang.2.248) "« est enregistré."
set dop(lang.2.249) "Utilisateur: « Enregistré avec l'adresse email: «"
set dop(lang.2.250) "Vous pouvez entrer /msg « pass « <votre mot de pass> dès maintenant!"
set dop(lang.2.251) "Numéro d'identification invalide!"
set dop(lang.2.252) "SYNTAX: PASS <utilisateur> <mot de pass>"
set dop(lang.2.253) "CHANGEMENT DE MOT DE PASS NON RÉUSSI sur « (Mot de pass invalide)"
set dop(lang.2.254) "Le mot de pass devrais être plus grand que « lettres."
set dop(lang.2.255) "Mot de pass enregistré: «"
set dop(lang.2.256) "Mot de pass déjà enregistré.. Utilisez /msg « pass <ancien mot de pass> <nouveau mot de pass>"
set dop(lang.2.257) "Adresse email:"
set dop(lang.2.258) "Non vérifié (Ajouté depuis «)"
set dop(lang.2.259) "Vous n'avez pas encore activé votre numéro d'identification!"
set dop(lang.2.260) "SYNTAX: JOIN <canal>"
set dop(lang.2.261) "SYNTAX: PART <canal>"
set dop(lang.2.262) "À la demande de «"
set dop(lang.2.263) "Je ne suis pas sur ce canal."
set dop(lang.2.264) "Votre accès sur « est suspendu."
set dop(lang.2.265) "La suspension pour « sur « à été cancellé"
set dop(lang.2.266) "Nous ne pouvez désuspendre un utilisateur avec un accès égal ou supérieur à la votre."
set dop(lang.2.267) "/msg « join <#canal>"
set dop(lang.2.268) "Fait joindre « sur un canal."
set dop(lang.2.269) "/msg « part <#canal>"
set dop(lang.2.270) "Fait partir « de sur un canal."
set dop(lang.2.271) "/msg « suspend <#canal> <utilisateur> \[niveau\]"
set dop(lang.2.272) "Suspend l'accès à « d'un utilisateur sur votre canal au niveau spécifié."
set dop(lang.2.273) "Si le niveau n'est pas spécifié, le niveau de l'utilisateur envoyant la commande sera utilisé par defaut."
set dop(lang.2.274) "Vous ne pouvez suspendre que des gens ayant un niveau inférieur au votre."
set dop(lang.2.275) "/msg « unsuspend <#canal> <utilisateur>"
set dop(lang.2.276) "Supprime la suspension à « d'un utilisateur sur votre canal, lui permettant donc d'accèder de nouveau au canal."
set dop(lang.2.277) "Vous ne pouvez UNSUSPEND que des gens ayant un accès inférieur au votre,"
set dop(lang.2.278) "du moment que le niveau de suspension est également inférieur ou égal à votre propre niveau."
set dop(lang.2.279) "/msg « reguser <utilisateur> <adresse email valide>"
set dop(lang.2.280) "Ajout un nouvelle utilisateur. Le robot va vérifier l'authenticité du email."
set dop(lang.2.281) "/msg « regid <numéro d'identification>"
set dop(lang.2.282) "Rend votre nom d'utilisateur utilisable."
set dop(lang.2.283) "/msg « pass <utilisateur> <mot de pass>"
set dop(lang.2.284) "Cette commande modifie votre mot de pass."
set dop(lang.2.285) "Nom de canal invalide."
set dop(lang.2.286) "Ban « ajouté sur «."
set dop(lang.2.287) "La valeur de FLOATLIM doit être ON ou OFF"
set dop(lang.2.288) "La marge de floating-limit est invalide (2-20 Accepté)."
set dop(lang.2.289) "Le maximum de floating-limit est invalide (0-65536 Accepté)."
set dop(lang.2.290) "La période de floating-limit est invalide (20-200 Accepté)."
set dop(lang.2.291) "L'intervale de floating-limit est invalide (0-19 Accepté)."
set dop(lang.2.292) "SYNTAX: CYCLE <#canal>"
set dop(lang.2.293) "SYNTAX: ACTION <#canal> <action/msg>"
set dop(lang.2.294) "«!« (identifié étant «) \[«\] m'a fait faire un action sur «: «"
set dop(lang.2.295) "/msg « cycle <#canal>"
set dop(lang.2.296) "Fiat « cycler le canal."
set dop(lang.2.297) "« pour « minutes."
set dop(lang.2.298) "« pour tojours"
set dop(lang.2.299) "Ce email à une syntaxe invalide. (..@..)"
set dop(lang.2.300) "Connecté sur « depuis «"

#Romania - 3
set dop(lang.3.1) "Lista userelor expirate.:"
set dop(lang.3.2) "Niciodata"
set dop(lang.3.3) "USER -- « -- vazut acum: «"
set dop(lang.3.4) "da"
set dop(lang.3.5) "nu"
set dop(lang.3.6) "Host"
set dop(lang.3.7) "Identificat"
set dop(lang.3.8) "Limba"
set dop(lang.3.9) "Ultima data vazut"
set dop(lang.3.10) "Access"
set dop(lang.3.11) "No access"
set dop(lang.3.12) "URL"
set dop(lang.3.13) "DESC"
set dop(lang.3.14) "KEYWORDS"
set dop(lang.3.15) "Nick"
set dop(lang.3.16) "Lista comenzilor prin dcc"
set dop(lang.3.17) "numarul zilelor"
set dop(lang.3.18) "SYNTAX: HELP \[command\]"
set dop(lang.3.19) "/msg « op <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.3.20) "Opeaza unu sau mai multe persoane de pe canalul tau. Daca nici un nick nu este specificat, si tu nu ai op pe canal, « o sa iti deie op."
set dop(lang.3.21) "/msg « deop <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.3.22) "Deopeaza una sau mai multe persoane de pe canalul tau. Daca nici un nick nu este specificat, si tu nu ai op pe canal , $botnick o sa te deopeze."
set dop(lang.3.23) "/msg « voice <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.3.24) "Da voice la una sau mai multe persoane de pe canal."
set dop(lang.3.25) "/msg « devoice <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.3.26) "Da devoice la una sau mai multe persoane de pe canal."
set dop(lang.3.27) "/msg « access <#canal> <userul> \[-min <nivel>\] \[-max <nivel>\]"
set dop(lang.3.28) "Poate sa se uite dupa un access sau de dupa anumite nivele de access."
set dop(lang.3.29) "/msg « login <userul> <parola>"
set dop(lang.3.30) "Te logheaza la bot."
set dop(lang.3.31) "/msg « dauth <userul> <parola>"
set dop(lang.3.32) "Te delogheaza de la bot."
set dop(lang.3.33) "/msg « help <coamanda>"
set dop(lang.3.34) "Iti arata help-ul la o anumite comanda."
set dop(lang.3.35) "/msg « uptime"
set dop(lang.3.36) "Iti arata uptime-ul lui «"
set dop(lang.3.37) "/msg « verify <nickul>"
set dop(lang.3.38) "Arata daca respectiva persoana este logata sau nu."
set dop(lang.3.39) "Si mai arata daca respectiva persoana este Administrator"
set dop(lang.3.40) "/msg « status <#canal>"
set dop(lang.3.41) "Arata status-ul canalului."
set dop(lang.3.42) "/msg « info <userul>"
set dop(lang.3.43) "Arata info-ul username-ului respectiv si arata daca este logat sau daca este offline,"
set dop(lang.3.44) "Limba lor si setarile invizibile, ultima data vazut. Daca e folosit asupra ta iti arata toata informatia, "
set dop(lang.3.45) "canalele pe care ai access (Numai un administrator poate face asa ceva, nu alti useri)."
set dop(lang.3.46) "Daca vrei sa pui informatia invizibila, dute la comanda SET INVISIBLE (nivel 0)."
set dop(lang.3.47) "/msg « showcommands <#canal>"
set dop(lang.3.48) "Iti arata comenzile care le poti face pe canalul respectiv."
set dop(lang.3.49) "/msg « ban <#canal> <nick|*!*user@*.host> \[motiv\]"
set dop(lang.3.50) "Adauga un anumit *!*user@*.host la « banuri al canalului tau."
set dop(lang.3.51) "/msg « unban <#canal> <nick|*!*user@*.host>"
set dop(lang.3.52) "Scoate un anumit *!*user@*.host din $botnick banuri a canalului tau si alt ban care este cu user@host-ul respectiv de pe canal."
set dop(lang.3.53) "/msg « topic <#channel> <topic>"
set dop(lang.3.54) "Face « sa iti schimba topicul de pe canal."
set dop(lang.3.55) "/msg « clearmode <#canal>"
set dop(lang.3.56) "Sterge toate modurile canalului. Poate fi folosita cand canalul a fost inchis  (set +i sau +k fara cunostinta ta)."
set dop(lang.3.57) "/msg « kick <#canal> <nick|pattern> \[motiv\]"
set dop(lang.3.58) "Face ca « sa deie kick la cineva de pe canal."
set dop(lang.3.59) "/msg « set <#canal> <variabila> <valoare>"
set dop(lang.3.60) "/msg « set <variabila> <valoare>"
set dop(lang.3.61) "Asta o sa seteze un canal sau un respectiv user."
set dop(lang.3.62) "Setarile userelor: INVISIBLE LANG  - Limbi disponibile: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.3.63) "Setarile canalului: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.3.64) "/msg « invite <#canal>"
set dop(lang.3.65) "Face ca « sa te invite pe canal."
set dop(lang.3.66) "/msg « banlist <#canal>"
set dop(lang.3.67) "Iti arata toate banurile de pe canal, comanda merge si daca nu esti pe canalul respectiv."
set dop(lang.3.68) "/msg « adduser <#canal> <userul> <nivel>"
set dop(lang.3.69) "Adauga un user la canalul respectiv. Nu poti da access la cineva cu accesul egal cu al tau sau mai mare ca al tau."
set dop(lang.3.70) "/msg « remuser <#canal> <userul>"
set dop(lang.3.71) "Rade accesul la un user de pe canalul respectiv, poti rade accesul la un user cu access mai mic ca al tau, deci sa nu fie mai mare ca al tau."
set dop(lang.3.72) "/msg « modinfo <#canal> <access|automode> <userul> <variabila>"
set dop(lang.3.73) "Comanda respectiva poate sa faca niste schimbari la respectivul userul de pe canal."
set dop(lang.3.74) "Nu poti sa modifici un user mai mare cu accesul tau, sau egal cu accesul tau."
set dop(lang.3.75) "Cu comanda respectiva poti schimba accesul userelor respective. Userul omului respectiv trebuie sa fie cu 1 punct mai mic ca al tau ca sa poti face asta."
set dop(lang.3.76) "Variabila AUTOMODE face setarile none, voice sau op."
set dop(lang.3.77) "Un user poate fi primi voice, opat cand intra pe canal si este logat."
set dop(lang.3.78) "** SUSPENDED ** - (Level «)"
set dop(lang.3.79) "Nu poti suspenda un user cu accesul mai mare sau egal cu al tau."
set dop(lang.3.80) "/msg « showignore"
set dop(lang.3.81) "Iti arata lista de ignoruri ale lui « . Ignorurile se pot face intentionat sau neintentionat cand cineva vrea sa floodeze pe «."
set dop(lang.3.82) "/msg « chaninfo <#canal>"
set dop(lang.3.83) "Arata daca canalul este sau nu inregistat, userul managerului, si actuala DESCRIPTION si URL, daca exista."
set dop(lang.3.84) "/msg « motd"
set dop(lang.3.85) "Arata mesajul lui « din ziua respectiva."
set dop(lang.3.86) "/msg « search <parametrii de cautare>"
set dop(lang.3.87) "Il face pe « sa listeze canalele unde anumiti parametri de cautare se potrivesc cu keyword-ul canalului, daca exista."
set dop(lang.3.88) "Nu este necesara folosirea wildcard-urilor (*)."
set dop(lang.3.89) "Nu este nici un help variabil pentru comanda respectiva."
set dop(lang.3.90) "SYNTAX: REMOVEALL <#canal>"
set dop(lang.3.91) "Imi pare rau trebuie sa fii logat ca sa poti scrie aceasta comanda."
set dop(lang.3.92) "Imi para rau, nu ai destul access ca sa poti scrie comanda aceasta."
set dop(lang.3.93) "Canalul « nu pare sa fie inregistrat."
set dop(lang.3.94) "«!« (logat ca «) \[«\] rade toate accesele de pe «."
set dop(lang.3.95) "Done. Zapped « access records de pe «."
set dop(lang.3.96) "zile"
set dop(lang.3.97) "Uptime"
set dop(lang.3.98) "Canale"
set dop(lang.3.99) "Versiune"
set dop(lang.3.100) "Bot linked"
set dop(lang.3.101) "SINTAXA: SHOWCOMMANDS <#canal>"
set dop(lang.3.102) "Nivel"
set dop(lang.3.103) "SINTAXA: REGUSER <userul> <email-ul>"
set dop(lang.3.104) "Nu stiu cine « este."
set dop(lang.3.105) "« este inca o data inregistrat"
set dop(lang.3.106) "E-mailurile in blacklist: «"
set dop(lang.3.107) "SINTAXA: ADDIGNORE <host>"
set dop(lang.3.108) "«!« (logat ca «) \[«\] adauga ignore la: «."
set dop(lang.3.109) "Ignorat"
set dop(lang.3.110) "Adaugat ignore («)"
set dop(lang.3.111) "SINTAXA: REMIGNORE <host>"
set dop(lang.3.112) "«!« (logat ca «) \[«\] scoate din lista de ignoruri: «."
set dop(lang.3.113) "Ignore scos: («)"
set dop(lang.3.114) "«!« (logat ca «) \[«\] face un jump la bot pe: «."
set dop(lang.3.115) "Nici un motiv."
set dop(lang.3.116) "«!« (logat ca «) \[«\] ma facut sa dau quit."
set dop(lang.3.117) "«!« (logat ca «) \[«\] se uita la accesele canalului."
set dop(lang.3.118) "Nici un canal intrat de bot."
set dop(lang.3.119) "Sfarsit lista de accese."
set dop(lang.3.120) "SiNTAXA: SAY <#canal> <mesaj>"
set dop(lang.3.121) "«!« (logat ca «) \[«\] trimite un mesaj prin mine pe «: «."
set dop(lang.3.122) "SINTAXA: BROADCAST <mesaj>"
set dop(lang.3.123) "«!« (logat ca «) \[«\] face broadcasting: «."
set dop(lang.3.124) "Ai inregistrat username-ul: «. la bot «. Ca sa ai userul tu trebuie sa il inregistrezi. Aici ai ID-ul inregistrarii: «"
set dop(lang.3.125) "User-ul"
set dop(lang.3.126) "SINTAXA: REGID <verify id>"
set dop(lang.3.127) "«!« (logat ca «) \[«\] da rehash la configul botului."
set dop(lang.3.128) "Canalul, userul incarcate."
set dop(lang.3.129) "SINTAXA: ADDHAND <userul> <email-ul>"
set dop(lang.3.130) "« mai este adaugat o data."
set dop(lang.3.131) "«!« (logat ca «) \[«\] adauga un username: «."
set dop(lang.3.132) "Adaugat hand-ul «"
set dop(lang.3.133) "SINTAXA: CHANINFO <#canal>"
set dop(lang.3.134) "« e inregistrat de:"
set dop(lang.3.135) "- ultima data vazut: « in urma"
set dop(lang.3.136) "« nu apare sa aiba un user cu nivel 500."
set dop(lang.3.137) "«!« (logat ca «) \[«\] se uita la lista usere-lor"
set dop(lang.3.138) "- « (owner)"
set dop(lang.3.139) "- « (normal user)"
set dop(lang.3.140) "Sfarsit lista hand-ului"
set dop(lang.3.141) "SINTAXA: REMHAND <userul>"
set dop(lang.3.142) "«!« (logat ca «) \[«\] sterge un user: «"
set dop(lang.3.143) "User sters «"
set dop(lang.3.144) "SINTAXA: REGISTER <#canal>"
set dop(lang.3.145) "« mai este in lista mea."
set dop(lang.3.146) "«!« (logat ca «) \[«\] adauga un canal: «"
set dop(lang.3.147) "Canal adaugat «"
set dop(lang.3.148) "SINTAXA: PURGE <#canal>"
set dop(lang.3.149) "«!« (logat ca «) \[«\] scoate un canal: «"
set dop(lang.3.150) "Canal scos «"
set dop(lang.3.151) "« este un Official Service Bot."
set dop(lang.3.152) "«« NU este logat."
set dop(lang.3.153) "Nu il vad pe « nicaieri."
set dop(lang.3.154) "«« este un Official Bot Administrator si este logat ca «."
set dop(lang.3.155) "«« este logat ca «."
set dop(lang.3.156) "Host-ul tau nu apare sa fie in lista mea."
set dop(lang.3.157) "Tasteaza /msg « regid «"
set dop(lang.3.158) "Nu ai nici o parola setata inca."
set dop(lang.3.159) "HOSTADDING NEREUSIT ca « (Parola Gresita)"
set dop(lang.3.160) "Host-ul tau a fost adaugat « (*!*«)"
set dop(lang.3.161) "SINTAXA: LOGIN <user-ul> <parola>"
set dop(lang.3.162) "Imi pare rau, este totodata logat ca «"
set dop(lang.3.163) "AUTENTIFICARE GRESITA ca « (Parola Gresita)"
set dop(lang.3.164) "«!« (logat ca «) \[«\] autorizare GRESITA."
set dop(lang.3.165) "AUTENTIFICARE REUSITA ca «."
set dop(lang.3.166) "«!« (logat ca «) \[«\] este acum autentificat ca owner."
set dop(lang.3.167) "SINTAXA: DAUTH <user-ul> <parola>"
set dop(lang.3.168) "DEAUTENTIFICARE GRESITA ca « (Parola Gresita)"
set dop(lang.3.169) "DEAUTENTIFICARE REUSITA ca «."
set dop(lang.3.170) "SUSPENDAREA pt « pe « este activata."
set dop(lang.3.171) "SINTAXA: SUSPEND <#canal> <user-ul> \[nivel\]"
set dop(lang.3.172) "SINTAXA: UNSUSPEND <#canal> <user-ul>"
set dop(lang.3.173) "SINTAXA: ADDUSER <#canal> <user-ul> <access-ul>"
set dop(lang.3.174) "« mai este adaugat pe « cu accesul de «."
set dop(lang.3.175) "Nu poti adauga un user cu nivel egal sau mai mare ca al tau."
set dop(lang.3.176) "Access nivel gresit."
set dop(lang.3.177) "Adaugat user « pe « cu access nivel «."
set dop(lang.3.178) "SINTAXA: REMUSER <#canal> <user-ul>"
set dop(lang.3.179) "« nu pare sa aiba access pe «"
set dop(lang.3.180) "User sters de pe « de «."
set dop(lang.3.181) "SINTAXA: MODINFO <#canal> \[ACCESS <user-ul> <nivel>\] \[AUTOMODE <user-ul> <NONE|OP|VOICE>\]"
set dop(lang.3.182) "Moficat accesul lui « pe canalul « cu «."
set dop(lang.3.183) "Setat AUTOMODE OP pentru « pe canalul «"
set dop(lang.3.184) "Setat AUTOMODE VOICE pentru « pe canalul «"
set dop(lang.3.185) "Setat AUTOMODE NONE pentru « pe canalul «"
set dop(lang.3.186) "SINTAXA: SET \[#canal\] <varibila> <valoare> sau, SET <invisible> <ON|OFF>, SET <limba> <numarul limbii respective.>"
set dop(lang.3.187) "Setarea ta pentru INVISIBLE este acum ON."
set dop(lang.3.188) "Setarea ta pentru INVISIBLE este acum OFF."
set dop(lang.3.189) "valoare pentru INVISIBLE trebuie sa fie ON sau OFF"
set dop(lang.3.190) "Setarea ta pentru LANG este acum «."
set dop(lang.3.191) "Setarea pentru LANG trebuie sa fie de la 1  pana la «."
set dop(lang.3.192) "« pentru « este: «"
set dop(lang.3.193) "Valoarea la AUTOTOPIC trebuie sa fie ON sau OFF"
set dop(lang.3.194) "Valoare la NOOP trebuie sa fie ON sau OFF"
set dop(lang.3.195) "« pentru « este stearsa."
set dop(lang.3.196) "Valoare pentru STRICTOP trebuie sa fie ON sau OFF"
set dop(lang.3.197) "SINTAXA: INVITE <#canal>"
set dop(lang.3.198) "Imi pare rau, este deja pe «."
set dop(lang.3.199) "SINTAXA: OP <#canal> \[nick\] \[nick\] .."
set dop(lang.3.200) "NOOP flag este setat pe «"
set dop(lang.3.201) "SINTAXA: DEOP <#canal> \[nick\] \[nick\] .."
set dop(lang.3.202) "Nu cred ca « o sa aprecieze asta."
set dop(lang.3.203) "SINTAXA: VOICE <#canal> \[nick\] \[nick\] .."
set dop(lang.3.204) "SINTAXA: DEVOICE <#canal> \[nick\] \[nick\] .."
set dop(lang.3.205) "SINTAXA: BAN <#canal> <nick | *!*user@*.host> \[lifetime\] \[motiv\]"
set dop(lang.3.206) "SINTAXA: KICK <#canal> <nick> <reason>"
set dop(lang.3.207) "SINTAXA: TOPIC <#canal> <topic>"
set dop(lang.3.208) "SINTAXA: UNBAN <#canal> <*!*user@*.host>"
set dop(lang.3.209) "Am scos 1 ban care sa potrivit cu «"
set dop(lang.3.210) "SINTAXA: BANLIST <#canal>"
set dop(lang.3.211) "-« de «"
set dop(lang.3.212) "Sfarsitul listei de ban."
set dop(lang.3.213) "SINTAXA: INFO <user-ul>"
set dop(lang.3.214) "Nu poti vedea informatiile user-ului (Invisibil)"
set dop(lang.3.215) "Informatia despre: «"
set dop(lang.3.216) "Curent logat cu:"
set dop(lang.3.217) "OFFLINE"
set dop(lang.3.218) "INVISIBIL este «"
set dop(lang.3.219) "Canalele"
set dop(lang.3.220) "SYNTAX: ACCESS <#canal> <user-ul> \[-min <nivel>\] \[-max <nivel>\]"
set dop(lang.3.221) "Nivel minim invalid."
set dop(lang.3.222) "Nivel maxim invalid."
set dop(lang.3.223) "USER: « ACCESS: « «"
set dop(lang.3.224) "CANAL: « -- AUTOMODE: «"
set dop(lang.3.225) "Vazut in urma cu: « "
set dop(lang.3.226) "Nici o potrivire!"
set dop(lang.3.227) "Sfarsitul listei de accese."
set dop(lang.3.228) "SINTAXA: STATUS <#canal>"
set dop(lang.3.229) "Canal « are « useri (« operatori)"
set dop(lang.3.230) "Modul este: «"
set dop(lang.3.231) "Momentan sunt pe acest canal"
set dop(lang.3.232) "Setarile la Flood"
set dop(lang.3.233) "Setarile la Flags"
set dop(lang.3.234) "Lista de ignoruri:"
set dop(lang.3.235) "Sfarsit lista de ignoruri."
set dop(lang.3.236) "Sunt mai multe de 10 intrari care se potrivesc. \[«\]"
set dop(lang.3.237) "Te rog restrictioneaza cererea."
set dop(lang.3.238) "Nici o potrivire pentru \[«\]"
set dop(lang.3.239) "SINTAXA: CLEARMODE <#canal>"
set dop(lang.3.240) "Nici un user expirat."
set dop(lang.3.241) "Nick-ul botului"
set dop(lang.3.242) "«« este un Official Bot Manager si este logat ca «."
set dop(lang.3.243) "«« este un Official Bot Owner si este logat ca «."
set dop(lang.3.244) "Este deja un master pe canalul aceasta."
set dop(lang.3.245) "Registrarea e-mailului pentru « cu confirmarea ta a fost trimisa catre «."
set dop(lang.3.246) "AUTENTIFICARE GRESITA ca «. (Logarile maxime au fost epuizate)."
set dop(lang.3.247) "Sesinea curenta: «"
set dop(lang.3.248) "« nu este logat."
set dop(lang.3.249) "User-ul: « inregistrat cu e-mailul: «"
set dop(lang.3.250) "Poti scrie /msg « pass « <parola ta> de acum inainte!"
set dop(lang.3.251) "Numarul de inregistrare nu a fost gasit!"
set dop(lang.3.252) "SINTAXA: PASS <user-ul> <parola>"
set dop(lang.3.253) "Schimbarea parolei gresita ca « (Parola Gresita)"
set dop(lang.3.254) "Parola a trebui sa fie mai mare decat « litere."
set dop(lang.3.255) "Parola setata ca: «"
set dop(lang.3.256) "Parola este deja setata.. Foloseste /msg « pass <parola veche> <parola noua>"
set dop(lang.3.257) "Email:"
set dop(lang.3.258) "Nu este vericat (Adaugat din «)"
set dop(lang.3.259) "Nu ai inregistrat inca \"regid-ul\"!"
set dop(lang.3.260) "SINTAXA: JOIN <#canal>"
set dop(lang.3.261) "SINTAXA: PART <#canal>"
set dop(lang.3.262) "La cererea lui «"
set dop(lang.3.263) "Nu sunt pe canalul acesta."
set dop(lang.3.264) "Accesul tau pe « a fost suspendat."
set dop(lang.3.265) "SUSPENDAREA pentru « pe « este anulata."
set dop(lang.3.266) "Nu poti da unsuspend la un suspend care este egal sau mai mare decat accesul tau."
set dop(lang.3.267) "/msg « join <#canal>"
set dop(lang.3.268) "Face « sa intre pe canal."
set dop(lang.3.269) "/msg « part <#canal>"
set dop(lang.3.270) "Face ca « sa iasa de pe canal."
set dop(lang.3.271) "/msg « suspend <#canal> <user-ul> \[nivel\]"
set dop(lang.3.272) "Suspenda accesul userului « pe canalul tau pentru nivelul specificat daca este dat."
set dop(lang.3.273) "Daca un nivel nu este specificat, suspendarea va fi nivelul tau pe canal."
set dop(lang.3.274) "Poti da SUSPEND la cineva cu access mai mic decat al tau"
set dop(lang.3.275) "/msg « unsuspend <#canal> <user-ul>"
set dop(lang.3.276) "Scoate suspendul user-ului respectiv « de pe lista cu usere a canalului."
set dop(lang.3.277) "Poti da UNSUSPEND la un user cu access mai mic decat al tau."
set dop(lang.3.278) "Tine minte ca trebuie ca suspendarea data, sa fie data de un user care are access mai mic, sau egal decat al tau."
set dop(lang.3.279) "/msg « reguser <user-ul> <e-mail valid>"
set dop(lang.3.280) "Creaza un username. In e-mail o sa primeasca ID-ul."
set dop(lang.3.281) "/msg « regid <audentificarea id-ului>"
set dop(lang.3.282) "Face userul sa nu mai poate fi folosit."
set dop(lang.3.283) "/msg « pass <user-ul> <parola>"
set dop(lang.3.284) "Iti seteaza parola."
set dop(lang.3.285) "Numele canalului incorect."
set dop(lang.3.286) "Adaugat ban « pe «."
set dop(lang.3.287) "valoarea lui FLOATLIM trebuie sa fie ON sau OFF"
set dop(lang.3.288) "Marginea Floating-limit invalida (de la 2 la 20 este acceptat)."
set dop(lang.3.289) "Floating limit max invalid (de la 0 la 65536 este acceptat)."
set dop(lang.3.290) "Perioada floating-limit invalida (de la 20 la 200 este acceptat)."
set dop(lang.3.291) "Setarea la floating-grace invalida (de la 0 la 19 este acceptata)."
set dop(lang.3.292) "SINTAXA: CYCLE <#canal>"
set dop(lang.3.293) "SINTAXA: ACTION <#canal> <action/msg>"
set dop(lang.3.294) "«!« (logat ca «) \[«\] ma mi-a ordonat sa fac ceva pe «: «"
set dop(lang.3.295) "/msg « cycle <#canal>"
set dop(lang.3.296) "Il va face pe « sa intre si sa iasa de pe canal."
set dop(lang.3.297) "« pentru « minute."
set dop(lang.3.298) "« pentru totdeauna."
set dop(lang.3.299) "Acest e-mail are o sintaxa invalida (..@..)" 
set dop(lang.3.300) "Conectat via « de «"

#Hungarian
set dop(lang.4.1) "Lejart felhasznalok listaja:"
set dop(lang.4.2) "Soha"
set dop(lang.4.3) "FELHASZNALO -- « -- Utoljara latott: «"
set dop(lang.4.4) "igen"
set dop(lang.4.5) "nem"
set dop(lang.4.6) "Hoszt"
set dop(lang.4.7) "Azonositva"
set dop(lang.4.8) "Nyelv"
set dop(lang.4.9) "Utoljara latott"
set dop(lang.4.10) "Jog"
set dop(lang.4.11) "Nincs jog"
set dop(lang.4.12) "URL"
set dop(lang.4.13) "Koruliras"
set dop(lang.4.14) "Kulcsszavak"
set dop(lang.4.15) "Nick"
set dop(lang.4.16) "DCC parancsok listaja"
set dop(lang.4.17) "napok szama"
set dop(lang.4.18) "SZINTAXIS: HELP \[parancs\]"
set dop(lang.4.19) "/msg « op <#kanalis> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.4.20) "Operator jogot ad egy vagy tobb szemelynek. Ha nincs nick adva es te nem vagy op a kanalison, « felopol teged."
set dop(lang.4.21) "/msg « deop <#kanalis> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.4.22) "Elveszi az operatori jogot egy vagy tobb szemelytol. Ha nincs nick adva es te op vagy a kanalison, $botnick deopol teged."
set dop(lang.4.23) "/msg « voice <#kanalis> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.4.24) "Beszelesi jogot ad egy vagy tobb felhasznalonak a kanalisodon."
set dop(lang.4.25) "/msg « devoice <#kanalis> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.4.26) "Elveszi a beszelesi jogot egy vagy tobb felhasznalotol a kanalisodon."
set dop(lang.4.27) "/msg « access <#kanalis> <felhasznalo> \[-min <szint>\] \[-max <szint>\]"
set dop(lang.4.28) "Megtudja nezzni a jogokat egy adott szemelynek."
set dop(lang.4.29) "/msg « login <felhasznalo> <jelszo>"
set dop(lang.4.30) "Azonosit a bot fele."
set dop(lang.4.31) "/msg « dauth <felhasznalo> <jelszo>"
set dop(lang.4.32) "Kijelenkezel a botol."
set dop(lang.4.33) "/msg « help <parancs>"
set dop(lang.4.34) "Segitseget nyujt az adott parancshoz."
set dop(lang.4.35) "/msg « uptime"
set dop(lang.4.36) "Kapcsolati ido «'s uptime."
set dop(lang.4.37) "/msg « verify <nick>"
set dop(lang.4.38) "Ellenorzi hogy az adott felhasznalo azonositota magat vagy nem, ha elobbi akkor megmutatja a felhasznalonevet."
set dop(lang.4.39) "Es egyben megmutatja hogy o Hivatalos Adminisztrator vagy sem."
set dop(lang.4.40) "/msg « status <#kanalis>"
set dop(lang.4.41) "Megmutatja a kanalis allaspontjat."
set dop(lang.4.42) "/msg « info <felhasznalo>"
set dop(lang.4.43) "Informaciot nyujt az adott felhasznalorol mint pl. a nickje, felhsznalo@hoszt ha pillanatnyilag fent vannak, "
set dop(lang.4.44) "nyelv es lathatatlansagi beallitasaikat, utoljara latott infojukat. Ha magadon hasznalod, akkor kilistazza az osszes"
set dop(lang.4.45) "kanalist ahol jogod van (csak az Adminisztrator es te lathatot az utobbiakot, mas senki)."
set dop(lang.4.46) "Ha azt akrod hogy ez az informacio ne legyen lathato mas felhasznalo szamara, hivatkoz a SET INVISIBLE parancsra (szint 0)."
set dop(lang.4.47) "/msg « showcommands <#kanalis>"
set dop(lang.4.48) "Megmutatja azokat a parancsokat amihez jogod van az adott kanalison."
set dop(lang.4.49) "/msg « ban <#kanalis> <nick|*!*felhasznalo@*.hoszt> \[miokbol\]"
set dop(lang.4.50) "Felteszi a *!*user@*.host  « az adott kanalis banlistajahoz."
set dop(lang.4.51) "/msg « unban <#kanalis> <nick|*!*felhasznalo@*.hoszt>"
set dop(lang.4.52) "Leveszi a *!*user@*.host a $botnick banlistajabol az adott kanalison es a kanalis banlistajarol is."
set dop(lang.4.53) "/msg « topic <#kanalis> <topik>"
set dop(lang.4.54) "Lecsereli « a topikot a kanalison."
set dop(lang.4.55) "/msg « clearmode <#kanalis>"
set dop(lang.4.56) "Leveszi az osszes kanalis modot. Hasznos mikor tudtod nelkul a kanalis levan zarva (+i vagy +k mod van tudtod nelkul)."
set dop(lang.4.57) "/msg « kick <#kanalis> <nick|pattern> \[miokbol\]"
set dop(lang.4.58) "Kiteszi « az adott szemelyt az adott kanalisrol."
set dop(lang.4.59) "/msg « set <#kanalis> <valtozo> <ertek>"
set dop(lang.4.60) "/msg « set <valtozo> <ertek>"
set dop(lang.4.61) "Ez a parancs allitja egy kanalis vagy felhasznalo modjat."
set dop(lang.4.62) "Felhasznalo modok: LATHATATLAN NYELV  - Allithato nyelvek: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.4.63) "Kanalis modok: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.4.64) "/msg « invite <#kanalis>"
set dop(lang.4.65) "Meghiv « az adott kanalisra."
set dop(lang.4.66) "/msg « banlist <#kanalis>"
set dop(lang.4.67) "Kanalis banlistajat listaza ki. A parancs mukodese fuggetlen hogy az adott kanalison tartozkodsz vagy nem."
set dop(lang.4.68) "/msg « adduser <#kanalis> <felhasznalo> <jogszint>"
set dop(lang.4.69) "Hozzaad egy felhasznalot a kanalis felhasznaloi listajaban. Nem tudsz naladnal magasabb vagy egyenlo jogot adni masnak."
set dop(lang.4.70) "/msg « remuser <#kanalis> <felhasznalo>"
set dop(lang.4.71) "Kiveszi az adott felhasznalot a kanalis adatbazisabol. Kotelezo nagyobb joggal rendelkezz az adott felhasznalonal."
set dop(lang.4.72) "/msg « modinfo <#kanalis> <access|automode> <felhasznalonev> <ertek>"
set dop(lang.4.73) "A kovetkezo parancsal tudod valtoztatni egy felhasznalo beallitasait."
set dop(lang.4.74) "Nem ervenyes veled egyforma vagy nagyobb joggal rendelkezo felhasznalora."
set dop(lang.4.75) "Az <access> valtozoval valtoztathatsz a jogszinten. A hatar az 1 es a te szinted kozott - 1."
set dop(lang.4.76) "Az <automode> valtozoval allithatod a none, voice vagy op automatikus modot."
set dop(lang.4.77) "Ezen modok allitasaval a felhasznalo a kanalis belepesekor voice, op vagy valtozatlan modokat kap."
set dop(lang.4.78) "** FELFUGGESZTVE ** - (Szint «)"
set dop(lang.4.79) "Egyenlo vagy magasabb joggal rendelkezo felhasznalot nem lehet felfuggeszteni."
set dop(lang.4.80) "/msg « showignore"
set dop(lang.4.81) "Megmutatja «az ignoralt listat. Ignoralas tortenik mikor valaki veletlen vagy celtudatos okbol floodol «."
set dop(lang.4.82) "/msg « chaninfo <#kanalis>"
set dop(lang.4.83) "Megmutatja hogy az adott kanalis levan vagy nincs regisztralva es ki altal."
set dop(lang.4.84) "/msg « motd"
set dop(lang.4.85) "Megmutatja « a napi uzenetet."
set dop(lang.4.86) "/msg « search <keresesi parameter>"
set dop(lang.4.87) "Kilistazza « azokat a kanalisokat amelyeken az adott keresesi parameter megegyezik a kanalis kulcsszavaival, ha letezik."
set dop(lang.4.88) "Nem kotelezo wildcardot hasznalni."
set dop(lang.4.89) "Nincs segitseg az on altal adott topikra."
set dop(lang.4.90) "SZINTAXIS: REMOVEALL <#kanalis>"
set dop(lang.4.91) "Elnezest, azonositva kell hogy legy ahhoz hogy hasznald ezt a parancsot."
set dop(lang.4.92) "Elnezest, nincs eleg jogod hogy hasznald ezt a parancsot."
set dop(lang.4.93) "A « kanalis nem ugy nezz ki hogy regisztralva lenne."
set dop(lang.4.94) "«!« (azonositva mint «) \[«\] elveszi az egesz jogot a  «."
set dop(lang.4.95) "Befejezve. Kitorolve « jogok rekordjai a «."
set dop(lang.4.96) "napok"
set dop(lang.4.97) "Kapcsolati ido"
set dop(lang.4.98) "Kanalisok"
set dop(lang.4.99) "Verzio"
set dop(lang.4.100) "Bot osszekapcsolva"
set dop(lang.4.101) "SZINTAXIS: SHOWCOMMANDS <#kanalis>"
set dop(lang.4.102) "Szint"
set dop(lang.4.103) "SZINTAXIS: REGUSER <felhasznalo> <email>"
set dop(lang.4.104) "Nem tudom ki az a « ."
set dop(lang.4.105) "« mar regisztralva van."
set dop(lang.4.106) "Email a feketelistaba: «"
set dop(lang.4.107) "SZINTAXIS: ADDIGNORE <hoszt>"
set dop(lang.4.108) "«!« (azonositva mint «) \[«\] az ignore listahoz adodik: «."
set dop(lang.4.109) "Ignoralva"
set dop(lang.4.110) "Ignorhoz addva («)"
set dop(lang.4.111) "SZINTAXIS: REMIGNORE <hoszt>"
set dop(lang.4.112) "«!« (azonositva mint «) \[«\] az ignore listabol kivevodik: «."
set dop(lang.4.113) "Ignore leveve («)"
set dop(lang.4.114) "«!« (azonositva mint «) \[«\] a botot lepteti a: «."
set dop(lang.4.115) "Nincs ok"
set dop(lang.4.116) "«!« (azonositva mint «) \[«\] lekapcsolt."
set dop(lang.4.117) "«!« (azonositva mint «) \[«\] nezzi a kanalis listat."
set dop(lang.4.118) "Nincs kanalisra lepve a bot."
set dop(lang.4.119) "Vege a kanalis listanak"
set dop(lang.4.120) "SZINTAXIS: SAY <#kanalis> <uzenet>"
set dop(lang.4.121) "«!« (azonositva mint «) \[«\] uzen a  «: «."
set dop(lang.4.122) "SZINTAXIS: BROADCAST <uzenet>"
set dop(lang.4.123) "«!« (azonositva mint «) \[«\] broadcast el: «."
set dop(lang.4.124) "Leregisztraltad a felhasznalonevet: «. A boton «. Ahoz hogy megkapd a felhasznalod, le kell regisztralnod. Itt a regisztracios ID: «"
set dop(lang.4.125) "Felhasznalonev"
set dop(lang.4.126) "SZINTAXIS: REGID <ID ellenorzes>"
set dop(lang.4.127) "«!« (azonositva mint «) \[«\] ujra frissiti a bot konfiguracioit."
set dop(lang.4.128) "Kanalis, Felhasznalo es Jegyzet allomanyok ujra toltve"
set dop(lang.4.129) "SZINTAXIS: ADDHAND <felhasznalo> <email>"
set dop(lang.4.130) "« mar oda van adva a bothoz."
set dop(lang.4.131) "«!« (azonositva mint «) \[«\] hozzaad egy felhasznalot: «."
set dop(lang.4.132) "Hozzaadva a lekezeles «"
set dop(lang.4.133) "SZINTAXIS: CHANINFO <#kanalis>"
set dop(lang.4.134) "« levan regisztralva mint:"
set dop(lang.4.135) "- utoljara latott: « ezelott"
set dop(lang.4.136) "« nem ugy tunik hogy van 500 as szintu felhasznalo."
set dop(lang.4.137) "«!« (azonositva mint «) \[«\] nezzelodik a felhasznalo listaban."
set dop(lang.4.138) "- « (tulajdonos)"
set dop(lang.4.139) "- « (normal felhasznalo)"
set dop(lang.4.140) "Vege a lekezelesi listanak"
set dop(lang.4.141) "SZINTAXIS: REMHAND <felhasznalo>"
set dop(lang.4.142) "«!« (azonositva mint «) \[«\] torli a felhasznalot: «"
set dop(lang.4.143) "Lekezeles kitorolve «"
set dop(lang.4.144) "SZINTAXIS: REGISTER <#kanalis>"
set dop(lang.4.145) "« mar hozza van adva."
set dop(lang.4.146) "«!« (azonositva van «) \[«\] kanalist ad hozza: «"
set dop(lang.4.147) "Kanalis hozza adva «"
set dop(lang.4.148) "SYNTAX: PURGE <#kanalis>"
set dop(lang.4.149) "«!« (azonositva mint «) \[«\] kanalist torol ki: «"
set dop(lang.4.150) "Kanalis kitorolve «"
set dop(lang.4.151) "« egy Hivatalos Szerviz Bot."
set dop(lang.4.152) "«« nincs azonositva."
set dop(lang.4.153) "Nem latom « sehol."
set dop(lang.4.154) "«« egy Hivatalos Bot Adminisztrator es azonositva van mint «."
set dop(lang.4.155) "«« azonositva van mint «."
set dop(lang.4.156) "A hosztod nem talal egyik szereplo hosztomal sem."
set dop(lang.4.157) "Ird /msg « regid «"
set dop(lang.4.158) "Meg nem tettel jelszot."
set dop(lang.4.159) "HOSZT HOZZAADAS SIKERTELEN mint « (Helytelen Jelszo)"
set dop(lang.4.160) "Hosztod hozza adva mint« (*!*«)"
set dop(lang.4.161) "SZINTAXIS: LOGIN <felhasznalonev> <jelszo>"
set dop(lang.4.162) "Elnezest, mar azonositva vagy mint «"
set dop(lang.4.163) "AZONOSITAS SIKERTELEN mint « (Helytelen Jelszo)"
set dop(lang.4.164) "«!« (azonositva mint «) \[«\] felhatalmazas SIKERTELEN."
set dop(lang.4.165) "AZONOSITAS SIKERES mint «."
set dop(lang.4.166) "«!« (azonositva mint «) \[«\] most azonositota magat mint tulajdonos."
set dop(lang.4.167) "SZINTAXIS: DAUTH <felhasznalonev> <jelszo>"
set dop(lang.4.168) "KIJELENTKEZES SIKERTELEN mint « (Helytelen Jelszo)"
set dop(lang.4.169) "KIJELENTKEZES SIKERES mint «."
set dop(lang.4.170) "FELFUGGESZTES  « nak a « aktivalva van"
set dop(lang.4.171) "SZINTAXIS: SUSPEND <#kanalis> <felhasznalo> \[szint\]"
set dop(lang.4.172) "SZINTAXIS: UNSUSPEND <#kanalis> <felhasznalo>"
set dop(lang.4.173) "SZINTAXIS: ADDUSER <#kanalis> <felhasznalo> <jog>"
set dop(lang.4.174) "« mar hozza van adva « szintu joggal «."
set dop(lang.4.175) "Egyenlo vagy magasabb joggal rendelkezo felhasznalonak nem lehet a szintjet modositani ."
set dop(lang.4.176) "Ervenytelen jog szint."
set dop(lang.4.177) "Felhasznalo hozza adva « a « szintu joggal «."
set dop(lang.4.178) "SZINTAXIS: REMUSER <#kanalis> <felhasznalo>"
set dop(lang.4.179) "« nem ugy tunik hogy joga van a «"
set dop(lang.4.180) "Leveve felhasznalo « a «."
set dop(lang.4.181) "SZINTAXIS: MODINFO <#kanalis> \[ACCESS <felhasznalo> <szint>\] \[AUTOMODE <felhasznalo> <NONE|OP|VOICE>\]"
set dop(lang.4.182) "Megvaltoztatva «a a jogszint a « kanalison «."
set dop(lang.4.183) "Op modra allitva « a kanalison «"
set dop(lang.4.184) "Voice modra allitva « a kanalison «"
set dop(lang.4.185) "Valtozatlan modra allitva « a kanalison «"
set dop(lang.4.186) "SZINTAXIS: SET \[#kanalis\] <valtozo> <ertek> vagy, SET <lathatatlan> <ON|OFF>, SET <nyelv> <nyelv szama>"
set dop(lang.4.187) "Lathatatlan mod bekapcsolva."
set dop(lang.4.188) "Lathatatlan mod kikapcsolva."
set dop(lang.4.189) "A lathatatlan mod be vagy ki kapcsolva kell legyen"
set dop(lang.4.190) "A lathatatlan mod most «."
set dop(lang.4.191) "A nyelv szama 1 es « kozott kell legyen."
set dop(lang.4.192) "« nak « van: «"
set dop(lang.4.193) "Az AUTOTOPIC be vagy kikapcsolva kell hogy legyen."
set dop(lang.4.194) "a NOOP be vagy kikapcsolva kell hogy legyen."
set dop(lang.4.195) "« nak « kitorolve."
set dop(lang.4.196) "STRICTOP erteke be vagy ki kapcsolva kell legyen"
set dop(lang.4.197) "SZINTAXIS: INVITE <#kanalis>"
set dop(lang.4.198) "Elnezest, mar fent vagy a «."
set dop(lang.4.199) "SZINTAXIS: OP <#kanalis> \[nick\] \[nick\] .."
set dop(lang.4.200) "A NOOP zaszlo « -ra allitva"
set dop(lang.4.201) "SZINTAXIS: DEOP <#kanalis> \[nick\] \[nick\] .."
set dop(lang.4.202) "Nem hiszem hogy « ertekelni fogja."
set dop(lang.4.203) "SZINTAXIS: VOICE <#kanalis> \[nick\] \[nick\] .."
set dop(lang.4.204) "SZINTAXIS: DEVOICE <#kanalis> \[nick\] \[nick\] .."
set dop(lang.4.205) "SZINTAXIS: BAN <#kanalis> <nick | *!*felhsznalo@*.hoszt> \[idotartam\] \[miokbol\]"
set dop(lang.4.206) "SZINTAXIS: KICK <#kanalis> <nick> <miokbol>"
set dop(lang.4.207) "SZINTAXIS: TOPIC <#kanalis> <topik>"
set dop(lang.4.208) "SZINTAXIS: UNBAN <#kanalis> <*!*felhasznalo@*.hoszt>"
set dop(lang.4.209) "Leveve egy ban ami egyezik a «"
set dop(lang.4.210) "SZINTAXIS: BANLIST <#kanalis>"
set dop(lang.4.211) "-« altal «"
set dop(lang.4.212) "Vege a banlistanak."
set dop(lang.4.213) "SZINTAXIS: INFO <felhasznalo>"
set dop(lang.4.214) "Keptelen latni a felhasznalo adatait (Lathatatlan)"
set dop(lang.4.215) "Informacio « -rol: "
set dop(lang.4.216) "Pillanatnyilag azonositva van:"
set dop(lang.4.217) "Offlineba van"
set dop(lang.4.218) "LATHATALAN «"
set dop(lang.4.219) "Kanalisok"
set dop(lang.4.220) "SZINTAXIS: ACCESS <#kanalis> <felhasznalo> \[-min <szint>\] \[-max <szint>\]"
set dop(lang.4.221) "Ervenytelen minimum szint."
set dop(lang.4.222) "Ervenytelen maximum szint."
set dop(lang.4.223) "FELHASZNALO: « SZINT: « «"
set dop(lang.4.224) "KANALIS: « -- AUTOMOD: «"
set dop(lang.4.225) "UTOLJARA LATOTT: « ota."
set dop(lang.4.226) "Nincs Talalat!"
set dop(lang.4.227) "Vege a jogosultsagi listanak."
set dop(lang.4.228) "SZINTAXIS: STATUS <#kanalis>"
set dop(lang.4.229) "« kanalisnak « felhasznaloja van (« operatorok)"
set dop(lang.4.230) "Mode: «"
set dop(lang.4.231) "Jelenleg vagyok e kanalison."
set dop(lang.4.232) "Flood beallitasok"
set dop(lang.4.233) "Zaszlok beallitva"
set dop(lang.4.234) "Ignore lista:"
set dop(lang.4.235) "Vege az ignor listanak"
set dop(lang.4.236) "Tobb mint 10 egyezik \[«\]"
set dop(lang.4.237) "Kerlek szukitsd a keresesi modod"
set dop(lang.4.238) "Nincs megegyezo erre a \[«\]"
set dop(lang.4.239) "SZINTAXIS: CLEARMODE <#kanalis>"
set dop(lang.4.240) "Nincs lejart felhasznalo."
set dop(lang.4.241) "A bot nickje"
set dop(lang.4.242) "«« Hivatalos Bot Menedzser es azonositva van mint «."
set dop(lang.4.243) "«« Hivatalos Bot Tulajdonos es azonositva van mint «."
set dop(lang.4.244) "Mar van egy mestere ennek a kanlisnak."
set dop(lang.4.245) "A regisztracios emailed a « a beleegyezesedel elkudtuk a «."
set dop(lang.4.246) "AZONOSITAS SIKERTELEN mint «. (Maximum konkurens azonositas meghaladva)."
set dop(lang.4.247) "Jelenlegi szesziok: «"
set dop(lang.4.248) "« nincs bejelentkezve."
set dop(lang.4.249) "Felhasznalonev: « Regisztralva volt e emailel: «"
set dop(lang.4.250) "Mostantol beutheted a /msg « pass « <jelszavad> "
set dop(lang.4.251) "Regisztracios szamot nem talalom!"
set dop(lang.4.252) "SZINTAXIS: PASS <felhasznalo> <jelszo>"
set dop(lang.4.253) "JELSZO VALTOZTAS SIKERTELEN mint « (Helytelen Jelszo)"
set dop(lang.4.254) "A jelszo hoszabb kell legyen mint « betu."
set dop(lang.4.255) "Jelenlegi jelszo: «"
set dop(lang.4.256) "Mar volt jelszo adva.. Hasznald /msg « pass <regi jelszo> <uj jelszo>"
set dop(lang.4.257) "Email:"
set dop(lang.4.258) "Nincs leellenorizve (Hozza adva « ota)"
set dop(lang.4.259) "Meg nem regisztraltad le a regid -et!"
set dop(lang.4.260) "SZINTAXIS: JOIN <#kanalis>"
set dop(lang.4.261) "SZINTAXIS: PART <#kanalis>"
set dop(lang.4.262) "« keresere."
set dop(lang.4.263) "Nem vagyok ezen a kanalison."
set dop(lang.4.264) "A jogaid a « kanalison felvan fuggesztve."
set dop(lang.4.265) "FELFUGGESZTES a « a « megszuntetve."
set dop(lang.4.266) "Nem lehet egy felfugesztest anulalni ha egy egyenlo vagy magasabb szintu tette fel."
set dop(lang.4.267) "/msg « join <#kanalis>"
set dop(lang.4.268) "Behivja « a kanalisra."
set dop(lang.4.269) "/msg « part <#kanalis>"
set dop(lang.4.270) "Kikuldi « a kanalisrol."
set dop(lang.4.271) "/msg « suspend <#kanalis> <felhasznalo> \[szint\]"
set dop(lang.4.272) "Felfuggeszti egy felhasznalot a « a kanalisod felhasznalo listajan az adott szintre."
set dop(lang.4.273) "Ha nincs szint megadva, az alap felfuggesztesi szint az adott felhasznalo szintje lesz."
set dop(lang.4.274) "Csak olyan felhasznalot tudsz felfuggeszteni kinek kisebb a joga a tiednel."
set dop(lang.4.275) "/msg « unsuspend <#kanalis> <felhasznalo>"
set dop(lang.4.276) "Anulaja az adott felhasznalo felfuggeszteset « a kanalisodon. "
set dop(lang.4.277) "Csak olyan felhasznalonak tudod anulalni a felfuggeszteset kinek kisebb a joga a tiednel"
set dop(lang.4.278) "vagy egyenlo joga van."
set dop(lang.4.279) "/msg « reguser <felhasznalo> <realis email>"
set dop(lang.4.280) "Letrehozz egy felhsznalo nevet. Az email segitsegevel azonosit."
set dop(lang.4.281) "/msg « regid <azonosito id>"
set dop(lang.4.282) "A felhasznalo neved megerosited."
set dop(lang.4.283) "/msg « pass <felhszanlo> <jelszo>"
set dop(lang.4.284) "A jelszavad letre hozzasa."
set dop(lang.4.285) "Helytelen kanalis nev."
set dop(lang.4.286) "Ban hozzaadva « a «."
set dop(lang.4.287) "A FLOATLIM erteke csak ON es OFF lehet"
set dop(lang.4.288) "Ervenytelen floating-limit szel (2-20 ertek megengedve)."
set dop(lang.4.289) "Erventelen floating-limit max (0-65536 ertek megengedve)."
set dop(lang.4.290) "Ervenytelen floating-limit periodus (20-200 ertek megengedve)."
set dop(lang.4.291) "Ervenytelen floating-grace beallitas (0-19 ertek megengedve)."
set dop(lang.4.292) "SZINTAXIS: CYCLE <#kanalis>"
set dop(lang.4.293) "SZINTAXIS: ACTION <#kanalis> <action/msg>"
set dop(lang.4.294) "«!« (azonositva mint «) \[«\] kesztet egy tetrea a «: «"
set dop(lang.4.295) "/msg « cycle <#kanalis>"
set dop(lang.4.296) "Kesztet « forogjak a kanalison."
set dop(lang.4.297) "« - « perc."
set dop(lang.4.298) "« orokre"
set dop(lang.4.299) "Ez az email cim helytelen szintaxist tartalmaz. (..@..)"
set dop(lang.4.300) "Kapcsolodva a «  « - ota."


#Swedish
set dop(lang.5.1) "Lista på utgångna användare:"
set dop(lang.5.2) "Aldrig"
set dop(lang.5.3) "USER -- « -- Senast sedd: «"
set dop(lang.5.4) "ja"
set dop(lang.5.5) "nej"
set dop(lang.5.6) "Host"
set dop(lang.5.7) "Identifierad"
set dop(lang.5.8) "Språk"
set dop(lang.5.9) "Senast sedd"
set dop(lang.5.10) "Access"
set dop(lang.5.11) "Ingen access"
set dop(lang.5.12) "URL"
set dop(lang.5.13) "DESC"
set dop(lang.5.14) "nyckel ord"
set dop(lang.5.15) "Nick"
set dop(lang.5.16) "Lista över dcc kommandon"
set dop(lang.5.17) "Dagens nummer"
set dop(lang.5.18) "SYNTAX: HELP \[command\]"
set dop(lang.5.19) "/msg « op <#kanal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.5.20) "Opar en eller flera användare i din kanal. Om inget nick är skrivet, och du inte har op, då opar « dig."
set dop(lang.5.21) "/msg « deop <#channel> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.5.22) "Deopar en eller flera användare i din kanal. Om inget nick är skrivet, Och du har op i kanalen ,då deopar $botnick dig."
set dop(lang.5.23) "/msg « voice <#channel> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.5.24) "VOicar en eller flera användare i din kanal."
set dop(lang.5.25) "/msg « devoice <#channel> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.5.26) "DevOicar en eller flera användare i din kanal."
set dop(lang.5.27) "/msg « access <#channel> <username> \[-min <level>\] \[-max <level>\]"
set dop(lang.5.28) "Kan kolla upp en speciell användare eller strängs access nivå."
set dop(lang.5.29) "/msg « login <username> <password>"
set dop(lang.5.30) "Loggar in dig i boten."
set dop(lang.5.31) "/msg « dauth <username> <password>"
set dop(lang.5.32) "För att logga ut."
set dop(lang.5.33) "/msg « help <command>"
set dop(lang.5.34) "Visar hjälp för ett specifikt kommando."
set dop(lang.5.35) "/msg « uptime"
set dop(lang.5.36) "Visar «'s uptime."
set dop(lang.5.37) "/msg « verify <nick>"
set dop(lang.5.38) "Visar om en användare är inloggad eller inte, och isåfall visar hans/hennes användarnamn"
set dop(lang.5.39) "Den visar också om personen är en officiell Administratör"
set dop(lang.5.40) "/msg « status <#channel>"
set dop(lang.5.41) "Visar kanalens status"
set dop(lang.5.42) "/msg « info <username>"
set dop(lang.5.43) "Visar information om ett användarnamn som deras nick och user@host om dom är online, "
set dop(lang.5.44) "deras språk och deras osynliga inställningar, senast sedd information. Om det görs på dig själv, visar den ändå all info och"
set dop(lang.5.45) "kanaler du har access på (bara administratörer och du kan se den infon, inte vanliga användare)."
set dop(lang.5.46) "Om du vill dölja den här informationen, använd SET INVISIBLE kommandot (nivå 0)."
set dop(lang.5.47) "/msg « showcommands <#kanal>"
set dop(lang.5.48) "Visar alla tillgängliga kommandon för dig på en viss kanal."
set dop(lang.5.49) "/msg « ban <#kanal> <nick|*!*user@*.host> \[anledning\]"
set dop(lang.5.50) "Lägger till en specifik *!*user@*.host till « banlista i kanalen du skrev in."
set dop(lang.5.51) "/msg « unban <#channel> <nick|*!*user@*.host>"
set dop(lang.5.52) "Tar bort en *!*user@*.host från $botnick`s banlista från din kanal och alla liknande från kanal listan."
set dop(lang.5.53) "/msg « topic <#channel> <topic>"
set dop(lang.5.54) "Låter « ändra topicen i din kanal."
set dop(lang.5.55) "/msg « clearmode <#channel>"
set dop(lang.5.56) "Tar bort alla modes. Kan användas när din kanal har låsts upp (sätt +i eller +k utan att du vet)."
set dop(lang.5.57) "/msg « kick <#channel> <nick|pattern> \[reason\]"
set dop(lang.5.58) "Låter « kicka från din kanal."
set dop(lang.5.59) "/msg « set <#channel> <variable> <value>"
set dop(lang.5.60) "/msg « set <variabel> <värde>"
set dop(lang.5.61) "Det är sätter en speciell variabel."
set dop(lang.5.62) "Användar inställningar: INVISIBLE LANG  - Tillägngliga språk: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.5.63) "Kanal inställningar: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.5.64) "/msg « invite <#kanal>"
set dop(lang.5.65) "Makes « invite yokanal>"
set dop(lang.5.67) "Visar kanalens banlista. Det här kommandot funkar vare sig du är i kanalen eller inte."
set dop(lang.5.68) "/msg « adduser <#ckanal> <användarnamn> <access>"
set dop(lang.5.69) "Lägger till en användare till kanalens access lista. Du kan inte lägga till en person med mer eller samma access som din."
set dop(lang.5.70) "/msg « remuser <#kanal> <användarnamn>"
set dop(lang.5.71) "Tar bort en användare från access listan. Du måste ha högre access än användaren du vill tabort."
set dop(lang.5.72) "/msg « modinfo <#kanal> <access|automode> <användarman> <värde>"
set dop(lang.5.73) "Följande kommando kan användas för att ändra användare som finns i listan."
set dop(lang.5.74) "Du kan inte ändra nån med samma eller högre access än din."
set dop(lang.5.75) "Med kommandot access kan du kolla användares access nivå. Mellan 1 och din egen - 1."
set dop(lang.5.76) "Automode låter dig sätta NONE, VOICE eller OP"
set dop(lang.5.77) "Baserad på den här inställningen kan en användare bli voicad, opad när personen joinar kanalen."
set dop(lang.5.78) "** SUSPENDED ** - (Level «)"
set dop(lang.5.79) "Kan inte lägga till en användare med mer eller samma access som din."
set dop(lang.5.80) "/msg « showignore"
set dop(lang.5.81) "Visar «'s ignore lista. Ignores händer när någon floodar «."
set dop(lang.5.82) "/msg « chaninfo <#kanal>"
set dop(lang.5.83) "Visar om en kanal är registrerad eller inte och till vem."
set dop(lang.5.84) "/msg « motd"
set dop(lang.5.85) "Visar « dagens meddelande."
set dop(lang.5.86) "/msg « search <sök parametrar>"
set dop(lang.5.87) "Låter « visa kanaler där den speciella sökningen matchar satta nyckelord, om någon."
set dop(lang.5.88) "Användning av 'wildcards' är inte tvunget."
set dop(lang.5.89) "Det finns ingen hjälp för det"
set dop(lang.5.90) "SYNTAX: REMOVEALL <#kanal>"
set dop(lang.5.91) "Tyvärr, Du måste vara inloggad för att använda det kommandot"
set dop(lang.5.92) "Tyvärr, Du har inte tillräckligt med access för att göra det."
set dop(lang.5.93) "Kanalen « verkar inte vara regisrerad."
set dop(lang.5.94) "«!« (inloggad som «) \[«\] tog bort allas access på «."
set dop(lang.5.95) "Klart. Zapped « access listan från «."
set dop(lang.5.96) "days"
set dop(lang.5.97) "Uptime"
set dop(lang.5.98) "Kanaler"
set dop(lang.5.99) "Version"
set dop(lang.5.100) "Bot linked"
set dop(lang.5.101) "SYNTAX: SHOWCOMMANDS <#channel>"
set dop(lang.5.102) "Level"
set dop(lang.5.103) "SYNTAX: REGUSER <username> <email>"
set dop(lang.5.104) "I don't know who « is."
set dop(lang.5.105) "« already registered."
set dop(lang.5.106) "Email in blacklist: «"
set dop(lang.5.107) "SYNTAX: ADDIGNORE <host>"
set dop(lang.5.108) "«!« (auth as «) \[«\] lägger till i ignore listan: «."
set dop(lang.5.109) "Ignored"
set dop(lang.5.110) "Added ignore («)"
set dop(lang.5.111) "SYNTAX: REMIGNORE <host>"
set dop(lang.5.112) "«!« (auth as «) \[«\] tar bort från ignore listan: «."
set dop(lang.5.113) "Removed ignore («)"
set dop(lang.5.114) "«!« (auth as «) \[«\] flyttar boten till: «."
set dop(lang.5.115) "No reason"
set dop(lang.5.116) "«!« (auth as «) \[«\] stängde av mig."
set dop(lang.5.117) "«!« (auth as «) \[«\] kollar på kanal listan."
set dop(lang.5.118) "Ingen kanal joinad av boten."
set dop(lang.5.119) "Slut på kanallistan"
set dop(lang.5.120) "SYNTAX: SAY <#kanal> <msg>"
set dop(lang.5.121) "«!« (auth as «) \[«\] is msging on «: «."
set dop(lang.5.122) "SYNTAX: BROADCAST <msg>"
set dop(lang.5.123) "«!« (auth as «) \[«\] is broadcasting: «."
set dop(lang.5.124) "Du registrerade användarnamn: «. på boten «. För att få ditt användarnamn, måste du registrera det. Här är ditt registrations id: «"
set dop(lang.5.125) "Anvädarnamn"
set dop(lang.5.126) "SYNTAX: REGID <verifikations id>"
set dop(lang.5.127) "«!« (inloggad som «) \[«\] rehashar configen."
set dop(lang.5.128) "Kanal, Användare och note filer omstartade"
set dop(lang.5.129) "SYNTAX: ADDHAND <användarnamn> <email>"
set dop(lang.5.130) "« är redan tillagd i boten"
set dop(lang.5.131) "«!« (inloggad som «) \[«\] lägger till ett användarnamn: «."
set dop(lang.5.132) "La till hand «"
set dop(lang.5.133) "SYNTAX: CHANINFO <#kanal>"
set dop(lang.5.134) "« is registered by:"
set dop(lang.5.135) "- Senast sedd: « sen"
set dop(lang.5.136) "« verkar inte ha access level 500."
set dop(lang.5.137) "«!« (inloggad som «) \[«\] kollar i användarlistan."
set dop(lang.5.138) "- « (Ägare)"
set dop(lang.5.139) "- « (normal användare)"
set dop(lang.5.140) "Slut på ägar listan"
set dop(lang.5.141) "SYNTAX: REMHAND <användarnamn>"
set dop(lang.5.142) "«!« (inloggad som «) \[«\] tar bort ett användarnamn: «"
set dop(lang.5.143) "Tog bort ägare «"
set dop(lang.5.144) "SYNTAX: REGISTER <#kanal>"
set dop(lang.5.145) "« är redan tillagd."
set dop(lang.5.146) "«!« (inloggad som «) \[«\] lägger till en kanal: «"
set dop(lang.5.147) "La till kanal «"
set dop(lang.5.148) "SYNTAX: PURGE <#kanal>"
set dop(lang.5.149) "«!« (inloggad som «) \[«\] Tar bort en kanal: «"
set dop(lang.5.150) "Tog bort kanal «"
set dop(lang.5.151) "« Är en officiell service bot."
set dop(lang.5.152) "«« är inte inloggad."
set dop(lang.5.153) "Jag kan inte se « någonstans."
set dop(lang.5.154) "«« är en officiell Bot Administratör och inloggad som «."
set dop(lang.5.155) "«« är inloggad som «."
set dop(lang.5.156) "Din host matchar ingen av de som finns i användarlistan."
set dop(lang.5.157) "Skriv /msg « regid «"
set dop(lang.5.158) "Du har inte skrivit något lösenord än."
set dop(lang.5.159) "NY HOST som « MISSLYCKADES (Felaktigt lösenord)"
set dop(lang.5.160) "Din host har blivit tillagd som « (*!*«)"
set dop(lang.5.161) "SYNTAX: LOGIN <användarnamn> <lösenord>"
set dop(lang.5.162) "Tyvärr, Du är redan inloggad som «"
set dop(lang.5.163) "INLOGGNING MISSLYCKADES som « (Felaktigt lösenord)"
set dop(lang.5.164) "«!« (inloggad som «) \[«\] inloggningen MISSLYCKLADES."
set dop(lang.5.165) "INLOGGNINGEN som « lyckades."
set dop(lang.5.166) "«!« (inloggad som «) \[«\] är nu inloggad som en ägare."
set dop(lang.5.167) "SYNTAX: DAUTH <användarnamn> <lösen>"
set dop(lang.5.168) "AVLOGGNING MISSLYCKADES som « (felaktigt lösenord)"
set dop(lang.5.169) "AVLOGGNING LYCKADES som « ."
set dop(lang.5.170) "SUSPENSION för « på « är på"
set dop(lang.5.171) "SYNTAX: SUSPEND <kanal> <användarnamn> \[level\]"
set dop(lang.5.172) "SYNTAX: UNSUSPEND <kanal> <användarnamn>"
set dop(lang.5.173) "SYNTAX: ADDUSER <#kanal> <användarnamn> <access>"
set dop(lang.5.174) "« är redan tillagd i « med access nivå «."
set dop(lang.5.175) "Kan inte lägga till en användare med högre eller samma access som dig själv"
set dop(lang.5.176) "Felaktig access level."
set dop(lang.5.177) "La till « till « med access nivå «."
set dop(lang.5.178) "SYNTAX: REMUSER <#kanal> <anvädarnamn>"
set dop(lang.5.179) "« verkar inte ha access i «"
set dop(lang.5.180) "Tog bort användare « från «."
set dop(lang.5.181) "SYNTAX: MODINFO <#kanal> \[ACCESS <användarnamn> <level>\] \[AUTOMODE <användarnamn> <NONE|OP|VOICE>\]"
set dop(lang.5.182) "Ändrade «'s access nivå på kanal « till «."
set dop(lang.5.183) "Satte AUTOMODE till OP för « på Kanal «"
set dop(lang.5.184) "Satte AUTOMODE till VOICE för « på kanal «"
set dop(lang.5.185) "Satte AUTOMODE till NONE för « på kanal «"
set dop(lang.5.186) "SYNTAX: SET \[#kanal\] <variabel> <värde> eller, SET <invisible> <ON|OFF>, SET <lang> <språknummer>"
set dop(lang.5.187) "Din INVISIBLE inställning är nu på."
set dop(lang.5.188) "Din INVISIBLE inställning är nu av."
set dop(lang.5.189) "INVISIBLE måste va på eller av (on eller off)"
set dop(lang.5.190) "Ditt språk är nu «."
set dop(lang.5.191) "Språk nummer måste va mellan 1 och «."
set dop(lang.5.192) "« för « är: «"
set dop(lang.5.193) "AUTOTOPIC måste va på eller av (on eller off)"
set dop(lang.5.194) "NOOP måste va på eller av (on eller off)"
set dop(lang.5.195) "« för « är rensad."
set dop(lang.5.196) "STRICTOP måste va på eller av (on eller off)"
set dop(lang.5.197) "SYNTAX: INVITE <#kanal>"
set dop(lang.5.198) "Tyvärr, du är redan på «."
set dop(lang.5.199) "SYNTAX: OP <#kanal> \[nick\] \[nick\] .."
set dop(lang.5.200) "NOOP kommandot är aktiverat i «"
set dop(lang.5.201) "SYNTAX: DEOP <#kanal> \[nick\] \[nick\] .."
set dop(lang.5.202) "Jag tror inte « skulle uppskatta det."
set dop(lang.5.203) "SYNTAX: VOICE <#kanal> \[nick\] \[nick\] .."
set dop(lang.5.204) "SYNTAX: DEVOICE <#kanal> \[nick\] \[nick\] .."
set dop(lang.5.205) "SYNTAX: BAN <#kanal> <nick | *!*user@*.host> \[tid\] \[anldening\]"
set dop(lang.5.206) "SYNTAX: KICK <#kanal> <nick> <reason>"
set dop(lang.5.207) "SYNTAX: TOPIC <#kanal> <topic>"
set dop(lang.5.208) "SYNTAX: UNBAN <#kanal> <*!*user@*.host>"
set dop(lang.5.209) "Tog bort 1 ban som matchade «"
set dop(lang.5.210) "SYNTAX: BANLIST <#kanal>"
set dop(lang.5.211) "-« av «"
set dop(lang.5.212) "Slut på banlistan"
set dop(lang.5.213) "SYNTAX: INFO <användarnamn>"
set dop(lang.5.214) "Kan inte visa användar info (osynlig)"
set dop(lang.5.215) "Information om: «"
set dop(lang.5.216) "Just nu inloggad via:"
set dop(lang.5.217) "OFFLINE"
set dop(lang.5.218) "OSYNLIG är «"
set dop(lang.5.219) "Kanaler"
set dop(lang.5.220) "SYNTAX: ACCESS <#kanal> <användarnamn> \[-min <level>\] \[-max <level>\]"
set dop(lang.5.221) "Felaktig minimal level."
set dop(lang.5.222) "Felaktig maximal level."
set dop(lang.5.223) "Användare: « ACCESS: « «"
set dop(lang.5.224) "KANAL: « -- AUTOMODE: «"
set dop(lang.5.225) "Senast sedd: « sen."
set dop(lang.5.226) "Hittade inget!"
set dop(lang.5.227) "Slut på access listan"
set dop(lang.5.228) "SYNTAX: STATUS <#kanal>"
set dop(lang.5.229) "Kanal « har « användare (« operatörer)"
set dop(lang.5.230) "Inställningar är: «"
set dop(lang.5.231) "Jag är i den här kanalen just nu."
set dop(lang.5.232) "Flood inställningar"
set dop(lang.5.233) "Flags set"
set dop(lang.5.234) "Ignore listan:"
set dop(lang.5.235) "Slut på ignore listan"
set dop(lang.5.236) "Det finns mer än 10 matchande som \[«\]"
set dop(lang.5.237) "Var god specificera sökningen"
set dop(lang.5.238) "Inga matchande som \[«\]"
set dop(lang.5.239) "SYNTAX: CLEARMODE <#kanal>"
set dop(lang.5.240) "Ingen utgående användare."
set dop(lang.5.241) "Bot nick"
set dop(lang.5.242) "«« is an Official Bot Manager and logged in as «."
set dop(lang.5.243) "«« är en officiel bot ägare och är inloggad som «."
set dop(lang.5.244) "Det finns redan en cm på den här kanalen."
set dop(lang.5.245) "Registrations email « med dina uppgifter har skickats till «."
set dop(lang.5.246) "INLOGGNING MISSLYCKAD som «. (Du har redan loggat in med en annan klient)."
set dop(lang.5.247) "Nuvarande sessioner: «"
set dop(lang.5.248) "« är inloggad som."
set dop(lang.5.249) "Användarnamn: « Registrerat med email: «"
set dop(lang.5.250) "Du kan skriva /msg « pass « <ditt lösen> från och med nu!"
set dop(lang.5.251) "Registrations nummret kunde inte hittas"
set dop(lang.5.252) "SYNTAX: PASS <användarnamn> <lösenord>"
set dop(lang.5.253) "ÄNDRING AV LÖSENORD MISSLYCKADES som « (ogiltigt lösenord)"
set dop(lang.5.254) "Lösenordet bör vara mer än « bokstäver."
set dop(lang.5.255) "Lösenordet satt till: «"
set dop(lang.5.256) "Du har redan satt lösenord.. Använd /msg « pass <gammalt lösen> <nytt lösen>"
set dop(lang.5.257) "Email:"
set dop(lang.5.258) "Inte verifierade (Tillagd sedan «)"
set dop(lang.5.259) "Du har inte registrerat ditt reg id än"
set dop(lang.5.260) "SYNTAX: JOIN <#kanal>"
set dop(lang.5.261) "SYNTAX: PART <#kanal>"
set dop(lang.5.262) "At the request of «"
set dop(lang.5.263) "Jag är inte i den kanalen."
set dop(lang.5.264) "Din access på « har blivit låst."
set dop(lang.5.265) "Avstängning för « på « är avbruten"
set dop(lang.5.266) "Du kan inte stänga av en användare med samma eller högre access än din egen!"
set dop(lang.5.267) "/msg « join <#channel>"
set dop(lang.5.268) "Låter « joina en kanal kanal."
set dop(lang.5.269) "/msg « part <#channel>"
set dop(lang.5.270) "Låter « parat din kanal."
set dop(lang.5.271) "/msg « suspend <#channel> <username> \[level\]"
set dop(lang.5.272) "Stänger av en persons access level « på din kanal med en specifik access level."
set dop(lang.5.273) "Om inte en level är angiven, personens accesslevel blir satt."
set dop(lang.5.274) "Du kan bara stänga av nån med mindre access än dig själv."
set dop(lang.5.275) "/msg « unsuspend <#channel> <username>"
set dop(lang.5.276) "tar bort en persons avstägning « i din userlist. "
set dop(lang.5.277) "Du kan bara tabort UNSUSPEND om du har mer access,"
set dop(lang.5.278) "kollar så att access nivån är mindre eller lika med din."
set dop(lang.5.279) "/msg « reguser <username> <valid email>"
set dop(lang.5.280) "Skapar ett username.DU får autentikera via ett mail."
set dop(lang.5.281) "/msg « regid <authentifcation id>"
set dop(lang.5.282) "Gör ditt användarnamn användbart."
set dop(lang.5.283) "/msg « pass <username> <password>"
set dop(lang.5.284) "Det sätter ditt lösenord."
set dop(lang.5.285) "Felaktigt kanal namn."
set dop(lang.5.286) "La till banen « till «."
set dop(lang.5.287) "Värdet av FLOATLIMIT måste va på eller av."
set dop(lang.5.288) "Felaktig floating-limit marginal (2-20 tillåten)."
set dop(lang.5.289) "Felaktig floating-limit max (0-65536 Tillåten)."
set dop(lang.5.290) "Felaktig floating-limit period (20-200 tillåten)."
set dop(lang.5.291) "Felaktig floating-grace inställning (0-19 tillåten)."
set dop(lang.5.292) "SYNTAX: CYCLE <#kanal>"
set dop(lang.5.293) "SYNTAX: ACTION <#kanal> <händelse/msg>"
set dop(lang.5.294) "«!« (känd som «) \[«\] gör så jag kan göra en händelse på «: «"
set dop(lang.5.295) "/msg « cycle <#kanal>"
set dop(lang.5.296) "Gör så « cycle din kanal."
set dop(lang.5.297) "« i « minuter."
set dop(lang.5.298) "« för alltid"
set dop(lang.5.299) "Den här email adressen har ett ogiltigt syntax. (..@..)"
set dop(lang.5.300) "Uppkopplad via « sedan «"



#Espagnol
set dop(lang.6.1) "Lista de usuario exiparados:"
set dop(lang.6.2) "Nunca"
set dop(lang.6.3) "USARIO -- « -- Ultima vez visto: «"
set dop(lang.6.4) "si"
set dop(lang.6.5) "no"
set dop(lang.6.6) "Host"
set dop(lang.6.7) "Identificado"
set dop(lang.6.8) "Lenguage"
set dop(lang.6.9) "Ultima vez visto"
set dop(lang.6.10) "Acceso"
set dop(lang.6.11) "Sin acces"
set dop(lang.6.12) "URL"
set dop(lang.6.13) "DESC"
set dop(lang.6.14) "PalabrasClave"
set dop(lang.6.15) "Nick"
set dop(lang.6.16) "Lista de comandos por dcc"
set dop(lang.6.17) "numbero de dia"
set dop(lang.6.18) "SINTAXIS: Help \[commando\]"
set dop(lang.6.19) "/msg « op <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.6.20) "Da Ops a una o mas personas en tu canal. Si no se especifica un nick, y tu no tiene op en el canal, « te dara el op atí."
set dop(lang.6.21) "/msg « deop <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.6.22) "Quita op a una o mas personas ien tu canal. Si no se especica un nick, y tu tienes op en el canal, $botnick te quitara el op."
set dop(lang.6.23) "/msg « voice <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.6.24) "Da Voz a una o mas personas en tu canal."
set dop(lang.6.25) "/msg « devoice <#canal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.6.26) "Quita voz a una o mas personas en tu canal."
set dop(lang.6.27) "/msg « access <#canal> <username> \[-min <nivel>\] \[-max <nivel>\]"
set dop(lang.6.28) " Puede buscar un access en una cierta persona  o un nivel especificado."
set dop(lang.6.29) "/msg « login <username> <password>"
set dop(lang.6.30) "Te logea al bot."
set dop(lang.6.31) "/msg « dauth <username> <password>"
set dop(lang.6.32) "Te desauthentifica de bot."
set dop(lang.6.33) "/msg « help <commando>"
set dop(lang.6.34) "Dice información de ayuda sobre un comando dado."
set dop(lang.6.35) "/msg « uptime"
set dop(lang.6.36) "Dice el tiempo del « que lleva en linea."
set dop(lang.6.37) "/msg « verify <nick>"
set dop(lang.6.38) "Dice si una persona esta logeada o no, y si esta logeada dice con que username"
set dop(lang.6.39) "Tambien indica si es o no es un Oficial Administrador"
set dop(lang.6.40) "/msg « status <#canal>"
set dop(lang.6.41) "Dice el status del canal."
set dop(lang.6.42) "/msg « info <username>"
set dop(lang.6.43) "Dice información sobre un username como su nick, user@host y si estan en linea en el momento, "
set dop(lang.6.44) "Su lenguage y su modo invisible, información de ultima vez visto. Si es usado por ti, tambien dice sobre los"
set dop(lang.6.45) "canales en los que tienes acces (solo Administradores pueden ver esta informacion, no todos los usuarios)."
set dop(lang.6.46) "Si deseas hacer esta información oculta del publico, ve al comando SET INVISIBLE (nivel 0)."
set dop(lang.6.47) "/msg « showcommands <#canal>"
set dop(lang.6.48) "Enseña los comandos disponibles para ti en un canal."
set dop(lang.6.49) "/msg « ban <#canal> <nick|*!*user@*.host> \[rason\]"
set dop(lang.6.50) "Agrega una specifica *!*user@*.host a « lista de banes"
set dop(lang.6.51) "/msg « unban <#canal> <nick|*!*user@*.host>"
set dop(lang.6.52) "Remueve una *!*user@*.host de $botnick lista de banes del canal y cualquier ban de lista de banes del canal."
set dop(lang.6.53) "/msg « topic <#canal> <topic>"
set dop(lang.6.54) "Hace que « cambie el topic del canal."
set dop(lang.6.55) "/msg « clearmode <#canal>"
set dop(lang.6.56) "Limpia todos los modos del canal. Puede ser usado cuando tu canal ha sido cerrado (con modo +i o +k sin que supieras)."
set dop(lang.6.57) "/msg « kick <#canal> <nick|pattern> \[rason\]"
set dop(lang.6.58) "Hace que « pateé a alguien de tu canal."
set dop(lang.6.59) "/msg « set <#canal> <variable> <valor>"
set dop(lang.6.60) "/msg « set <variable> <valor>"
set dop(lang.6.61) "Esto seteara un canal o una cuenta de usuario."
set dop(lang.6.62) "Ajustes a cuenta de usuarios: INVISIBLE LANG  - Lenguage disponible: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.6.63) "Ajustes para Canal: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.6.64) "/msg « invite <#canal>"
set dop(lang.6.65) "Hace que « te invite a tu canal."
set dop(lang.6.66) "/msg « banlist <#canal>"
set dop(lang.6.67) "Muestra la lista de banes del canal. este comando funciona estes o no estes en el canal."
set dop(lang.6.68) "/msg « adduser <#canal> <username> <nivel>"
set dop(lang.6.69) "Agrega a un usuario a la lista de usuarios del canal. No puedes AGREGAR a alguien con el mismo o mas alto nivel que el tuyo."
set dop(lang.6.70) "/msg « remuser <#canal> <username>"
set dop(lang.6.71) "Remueve a un usuario de la lista de usuarios del canal. Deebes tener un access mayor del usuarios que intentas remover."
set dop(lang.6.72) "/msg « modinfo <#canal> <access|automode> <username> <valor>"
set dop(lang.6.73) "Los comandos siguientes se pueden utilizar para realizar cambios a los usuarios existentes en la lista de usuario su canal."
set dop(lang.6.74) "Usted no puede modificar a alguien con un nivel igual o más alto."
set dop(lang.6.75) "Con el acceso variable usted puede cambiar un nivel de acces de los usuarios. La gama es 1 a su propio nivel - 1."
set dop(lang.6.76) "La variable automode permite ajusatar el modo none, voice o op."
set dop(lang.6.77) "De acuerdo con este ajuste un usuario puede recivir voz, op cuando él entra al canal."
set dop(lang.6.78) "** SUSPENDIDO ** - (Nivel «)"
set dop(lang.6.79) "No puedes suspender a un usuario con igual o mayor nivel que el tuyo."
set dop(lang.6.80) "/msg « showignore"
set dop(lang.6.81) "Muestra la lista de ignorados de «. El bot ignore cuando alguien intencionalmente o accidentalmente flodea a «."
set dop(lang.6.82) "/msg « chaninfo <#canal>"
set dop(lang.6.83) "Dice si un canal esta registrado y por quien."
set dop(lang.6.84) "/msg « motd"
set dop(lang.6.85) "Dice el mensaje del dia de « ."
set dop(lang.6.86) "/msg « search <parametro a buscar>"
set dop(lang.6.87) "Hace que « de en lista los parametros buscados en los canales, si fueron encontrados."
set dop(lang.6.88) "El uso de comodines no se requiere."
set dop(lang.6.89) "No hay ayuda disponible para ese asunto."
set dop(lang.6.90) "SINTAXIS: REMOVEALL <#canal>"
set dop(lang.6.91) "Lo siento, Deebe estar logeado para usar este comando."
set dop(lang.6.92) "Lo siento, tiene insuficiente access para ejecutar este comando."
set dop(lang.6.93) "El canal « no aparece ser registrado."
set dop(lang.6.94) "«!« (authentificado como «) \[«\] esta removiendo todos los acces en «."
set dop(lang.6.95) "Listo. Borre « acces de la lista de «."
set dop(lang.6.96) "dias"
set dop(lang.6.97) "Online"
set dop(lang.6.98) "Canales"
set dop(lang.6.99) "Version"
set dop(lang.6.100) "Bot linkiado"
set dop(lang.6.101) "SYNTAXIS: SHOWCOMMANDS <#canal>"
set dop(lang.6.102) "Nivel"
set dop(lang.6.103) "SYNTAXIS: REGUSER <username> <email>"
set dop(lang.6.104) "No se quien es « ."
set dop(lang.6.105) "« ya esta registrado."
set dop(lang.6.106) "Email en Listanegra: «"
set dop(lang.6.107) "SINTAXIS: ADDIGNORE <host>"
set dop(lang.6.108) "«!« (authentificada como «) \[«\] está agregando a la lista del ignore a: «."
set dop(lang.6.109) "Ignorando"
set dop(lang.6.110) "Ignore agregado («)"
set dop(lang.6.111) "SINTAXIS: REMIGNORE <host>"
set dop(lang.6.112) "«!« (authentificado como «) \[«\] esta removiendo ignores de la lista a: «."
set dop(lang.6.113) "Ignore Removido («)"
set dop(lang.6.114) "«!« (authentificado como «) \[«\] esta haciendo brincar al bot a: «."
set dop(lang.6.115) "Sin rason"
set dop(lang.6.116) "«!« (authentificado como «) \[«\] hizo que cierre el programa"
set dop(lang.6.117) "«!« (authentificado como «) \[«\] esta viendo a la lista de acces del canal."
set dop(lang.6.118) "El bot no entro a ninguno de sus canales."
set dop(lang.6.119) "Fin de la lista del canal."
set dop(lang.6.120) "SINTAXIS: SAY <#canal> <msg>"
set dop(lang.6.121) "«!« (authentificado como «) \[«\] esta haciendo que envie el mensaje «: «."
set dop(lang.6.122) "SINTAXIS: BROADCAST <msg>"
set dop(lang.6.123) "«!« (authentificado como «) \[«\] esta haciendo que envie un mensaje a todos los canales: «."
set dop(lang.6.124) "Registro el Username: «. En el bot «. para obtener el username, Debes registralo. Este es tu id de registro: «"
set dop(lang.6.125) "Username"
set dop(lang.6.126) "SINTAXIS: REGID <verificar id>"
set dop(lang.6.127) "«!« (authentificado como «) \[«\] esta recargando la configuracion del bot."
set dop(lang.6.128) "Channel, User and Note files reloaded"
set dop(lang.6.129) "SINTAXIS: ADDHAND <username> <email>"
set dop(lang.6.130) "« ya esta agregado al bot."
set dop(lang.6.131) "«!« (authentificado como «) \[«\] esta agregando un username: «."
set dop(lang.6.132) "Hand agregada «"
set dop(lang.6.133) "SINTAXIS: CHANINFO <#canal>"
set dop(lang.6.134) "« esta registrado por:"
set dop(lang.6.135) "- ultima vez visto: hace « "
set dop(lang.6.136) "« no aparece tener un user con un nivel 500."
set dop(lang.6.137) "«!« (authentificado como «) \[«\] esta viendo a la lista de usernames."
set dop(lang.6.138) "- « (dueño)"
set dop(lang.6.139) "- « (usuario normal)"
set dop(lang.6.140) "Fin de la lista hand"
set dop(lang.6.141) "SINTAXIS: REMHAND <username>"
set dop(lang.6.142) "«!« (authentificado como «) \[«\] esta removiendo un username: «"
set dop(lang.6.143) "Hand removida «"
set dop(lang.6.144) "SINTAXIS: REGISTER <#Canal>"
set dop(lang.6.145) "« ya esta agregada."
set dop(lang.6.146) "«!« (authentidicado como «) \[«\] esta agregando un canal: «"
set dop(lang.6.147) "Canal Agregado «"
set dop(lang.6.148) "SINTAXIS: PURGE <#canal>"
set dop(lang.6.149) "«!« (authentificado como «) \[«\] esta removiendo un canal: «"
set dop(lang.6.150) "Canal removido «"
set dop(lang.6.151) "« es un Oficial Bot De Servicio."
set dop(lang.6.152) "«« NO está logeado."
set dop(lang.6.153) "No veo a « en ninguna parte."
set dop(lang.6.154) "«« es un Oficial Administrador del Bot y está logeado como «."
set dop(lang.6.155) "«« esta logeado como «."
set dop(lang.6.156) "Su host no concuerda con ningunos de los mios."
set dop(lang.6.157) "Teclea /msg « regid «"
set dop(lang.6.158) "Usted no tiene ninguna contraseña establecida todavía"
set dop(lang.6.159) "HOSTADDING FALLO como « (Password Invalido)"
set dop(lang.6.160) "Su host fue agregado a « (*!*«)"
set dop(lang.6.161) "SINTAXIS: LOGIN <username> <password>"
set dop(lang.6.162) "Lo siento, ya esta authentificado como «"
set dop(lang.6.163) "AUTHENTIFICACIÓN FALLO como « (Password Invalido)"
set dop(lang.6.164) "«!« (authentificado como «) \[«\] authorización FALLO."
set dop(lang.6.165) "AUTHENTIFICACIÓN ACEPTADA como «."
set dop(lang.6.166) "«!« (authentificado como «) \[«\] ahora esta authentificado como dueño."
set dop(lang.6.167) "SINTAXIS: DAUTH <username> <password>"
set dop(lang.6.168) "DESAUTHENTIFICACIÓN FALLO como « (password invalido)"
set dop(lang.6.169) "DESAUTHENTICATION ACEPTADA como «."
set dop(lang.6.170) "SUSPENSION para « on « esta activada"
set dop(lang.6.171) "SINTAXIS: SUSPEND <#canal> <user> \[nivel\]"
set dop(lang.6.172) "SINTAXIS: UNSUSPEND <#canal> <user>"
set dop(lang.6.173) "SINTAXIS: ADDUSER <#canal> <username> <acces>"
set dop(lang.6.174) "« ya esta agregado a « con el nivel de acces «."
set dop(lang.6.175) "No puede agregar a un usuario con el acceso igual o más alto que el suyo."
set dop(lang.6.176) "Nivel de acceso invalido."
set dop(lang.6.177) "Usuario agregado « a « con el nivel de acces «."
set dop(lang.6.178) "SINTAXIS: REMUSER <#canal> <username>"
set dop(lang.6.179) "« no aparece tener acceso en «"
set dop(lang.6.180) "Removido el usuario « de «."
set dop(lang.6.181) "SINTAXIS: MODINFO <#canal> \[ACCES <username> <nivel>\] \[AUTOMODE <username> <NONE|OP|VOICE>\]"
set dop(lang.6.182) "Modificado el usuario « su nivel de acceso en el canal « a «."
set dop(lang.6.183) "Seteado AUTOMODE a OP para « en el canal «"
set dop(lang.6.184) "Seteado AUTOMODE a VOICE para « en el canal «"
set dop(lang.6.185) "Seteado AUTOMODE a NONE para « en el canal «"
set dop(lang.6.186) "SINTAXIS: SET \[#canal\] <variable> <valor> o, SET <invisible> <ON|OFF>, SET <lang> <numbero de lenguage>"
set dop(lang.6.187) "Su ajuste INVISIBLE ahora esta ON."
set dop(lang.6.188) "Su ajuste INVISIBLE ahora esta OFF."
set dop(lang.6.189) "el valor de INVISIBLE debe estar ON o OFF"
set dop(lang.6.190) "Su ajuste de LANG esta ahora «."
set dop(lang.6.191) "El número de lenguage debe estar entre 1 a «."
set dop(lang.6.192) "« para « es: «"
set dop(lang.6.193) "el valor de AUTOTOPIC debe estar ON o OFF"
set dop(lang.6.194) "el valor de NOOP debe estar ON or OFF"
set dop(lang.6.195) "« para « esta despejado."
set dop(lang.6.196) "el valor de STRICTOP debe estar ON or OFF"
set dop(lang.6.197) "SINTAXIS: INVITE <#canal>"
set dop(lang.6.198) "Lo siento, ya estas en «."
set dop(lang.6.199) "SINTAXIS: OP <#canal> \[nick\] \[nick\] .."
set dop(lang.6.200) "La bandera NOOP esta ajustada a on «"
set dop(lang.6.201) "SINTAXIS: DEOP <#canal> \[nick\] \[nick\] .."
set dop(lang.6.202) "No pienso que « apreciaría eso."
set dop(lang.6.203) "SINTAXIS: VOICE <#canal> \[nick\] \[nick\] .."
set dop(lang.6.204) "SINTAXIS: DEVOICE <#canal> \[nick\] \[nick\] .."
set dop(lang.6.205) "SINTAXIS: BAN <#canal> <nick | *!*user@*.host> \[tiempo\] \[rason\]"
set dop(lang.6.206) "SINTAX: KICK <#canal> <nick> <rason>"
set dop(lang.6.207) "SINTAXIS: TOPIC <#canal> <topic>"
set dop(lang.6.208) "SINTAXIS: UNBAN <#canal> <*!*user@*.host>"
set dop(lang.6.209) "Removido 1 bans que concuerdan «"
set dop(lang.6.210) "SINTAXIS: BANLIST <#canal>"
set dop(lang.6.211) "-« por «"
set dop(lang.6.212) "Fin de la lista de banes"
set dop(lang.6.213) "SINTAXIS: INFO <username>"
set dop(lang.6.214) "Incapaz de ver detalles del usuario (Invisible)"
set dop(lang.6.215) "Información sobre: «"
set dop(lang.6.216) "Entro actualmente vía:"
set dop(lang.6.217) "Fuera de Linea"
set dop(lang.6.218) "INVISIBLE es «"
set dop(lang.6.219) "Canales"
set dop(lang.6.220) "SINTAXIS: ACCESS <#canal> <username> \[-min <nivel>\] \[-max <nivel>\]"
set dop(lang.6.221) "Nivel mínimo inválido."
set dop(lang.6.222) "Nivel máximo inválido."
set dop(lang.6.223) "USURARIO: « ACCES: « «"
set dop(lang.6.224) "CANAL: « -- AUTOMODE: «"
set dop(lang.6.225) "ULTIMA VEZ VISTO: hace «."
set dop(lang.6.226) "Ninguna Concuerda!"
set dop(lang.6.227) "Fin de la lista de acces"
set dop(lang.6.228) "SINTAXIS: STATUS <#canal>"
set dop(lang.6.229) "Canal « tiene « usarios (« operadores)"
set dop(lang.6.230) "Modo es: «"
set dop(lang.6.231) "Estoy actualmente en este canal."
set dop(lang.6.232) "Ajuste de Flood"
set dop(lang.6.233) "Ajuste de banderas"
set dop(lang.6.234) "Lista de Ignorados:"
set dop(lang.6.235) "Fin de lista de ignorados"
set dop(lang.6.236) "Hay mas de 10 entradas concuerdando \[«\]"
set dop(lang.6.237) "Restrinja por favor su máscara de la búsqueda."
set dop(lang.6.238) "Ninguna entrada concuerda para \[«\]"
set dop(lang.6.239) "SINTAXIS: CLEARMODE <#canal>"
set dop(lang.6.240) "Ningún usuario expirado."
set dop(lang.6.241) "Nick del Bot"
set dop(lang.6.242) "«« es un Oficial Manager del Bot y esta logeado como «."
set dop(lang.6.243) "«« es un Oficial Dueño del Bot y esta logeado como «."
set dop(lang.6.244) "Este canal ya tiene a un master."
set dop(lang.6.245) "Registro de email para « con su confirmación se ha enviado a «."
set dop(lang.6.246) "AUTHENTIFICACIÓN FALLO como «. (Conexiones concurrentes máximas excedidas)."
set dop(lang.6.247) "Sesiones Actuales: «"
set dop(lang.6.248) "« no esta logeado."
set dop(lang.6.249) "Username: « registrado con el email: «"
set dop(lang.6.250) "Puedes teclear /msg « pass « <your pass> de aqui en adelante!"
set dop(lang.6.251) "Número de registro no encontrado!"
set dop(lang.6.252) "SINTAXIS: PASS <username> <password>"
set dop(lang.6.253) "CAMBIO DE PASS FALLO como « (Password Invalido)"
set dop(lang.6.254) "La contraseña debe ser más larga de « letras."
set dop(lang.6.255) "Password establecido a: «"
set dop(lang.6.256) "Password ya a sido establecido.. Use /msg « pass <viejo pass> <nuevo pass>"
set dop(lang.6.257) "Email:"
set dop(lang.6.258) "No verificado (Agreagdo desde «)"
set dop(lang.6.259) "No ha registrado su registro de id!"
set dop(lang.6.260) "SINTAXIS: JOIN <#canal>"
set dop(lang.6.261) "SINTAXIS: PART <#canal>"
set dop(lang.6.262) "A petición de «"
set dop(lang.6.263) "No estoy en este canal."
set dop(lang.6.264) "Tu acceso en « ha sido suspendido."
set dop(lang.6.265) "SUSPENSION para « en « ha sido cancelada"
set dop(lang.6.266) "No puedes quitar un suspend a alguien que tiene el mismo o mas alto nivel que el tuyo."
set dop(lang.6.267) "/msg « join <#canal>"
set dop(lang.6.268) "Hace que « entre a un canal."
set dop(lang.6.269) "/msg « part <#canal>"
set dop(lang.6.270) "Hace que « salga dr tu canal."
set dop(lang.6.271) "/msg « suspend <#canal> <username> \[nivel\]"
set dop(lang.6.272) "Suspende el acceso de un usuario de « en la lista de tu canal con el nivel especificado si es dado."
set dop(lang.6.273) "Si un nivel no se especifica, el nivel de la suspensión del defecto usado será el nivel de acceso del emisor."
set dop(lang.6.274) "Solo puedes SUSPENDER a alguien con el nivel mas bajo que el tuyo."
set dop(lang.6.275) "/msg « unsuspend <#canal> <username>"
set dop(lang.6.276) "Quita el suspend de un usuario de « en la lista de tu canal. "
set dop(lang.6.277) "Solo puedes quitar el SUSPEND a alquien que tenga el nivel mas bajo que el tuyo,"
set dop(lang.6.278) "a condición de que el nivel de la suspensión es también menos que o igual a su propio nivel de acceso."
set dop(lang.6.279) "/msg « reguser <username> <email valido>"
set dop(lang.6.280) "Crea un username. Verificará si el email es valido."
set dop(lang.6.281) "/msg « regid <authentificación del id>"
set dop(lang.6.282) "Hace su username usable."
set dop(lang.6.283) "/msg « pass <username> <password>"
set dop(lang.6.284) "Establece tu contraseña."
set dop(lang.6.285) "Nombre de canal Invalido."
set dop(lang.6.286) "Baneado la mask « del Canal «."
set dop(lang.6.287) "el valor de FLOATLIM debe estar ON o OFF"
set dop(lang.6.288) "Margen inválido del Floating-limit (2-20 permitido)"
set dop(lang.6.289) "Margen inválido del floating-limit maximo (0-65536 permitido)."
set dop(lang.6.290) "Margen inválido del floating-limit periodo (20-200 permitido)."
set dop(lang.6.291) "Margen inválido del floating-grace ajuste (0-19 Allowed)."
set dop(lang.6.292) "SINTAXIS: CYCLE <#canal>"
set dop(lang.6.293) "SINTAXIS: ACTION <#canal> <acción/msg>"
set dop(lang.6.294) "«!« (identificado como «) \[«\] me hizo hacer una acción en «: «"
set dop(lang.6.295) "/msg « cycle <#canal>"
set dop(lang.6.296) "Marca « que haga un ciclo en tu canal."
set dop(lang.6.297) "« por « minutos."
set dop(lang.6.298) "« por siempre"
set dop(lang.6.299) "Esta dirección de correo es invalidalida. (..@..)"
set dop(lang.6.300) "Conectado via « desde «"

#Norwegian
set dop(lang.7.1) "List of expired user:"
set dop(lang.7.2) "Aldri"
set dop(lang.7.3) "BRUKER -- « -- sist sett: «"
set dop(lang.7.4) "ja"
set dop(lang.7.5) "nei"
set dop(lang.7.6) "vert"
set dop(lang.7.7) "Identifisert"
set dop(lang.7.8) "Språk"
set dop(lang.7.9) "Sist sett"
set dop(lang.7.10) "aksess"
set dop(lang.7.11) "Ingen aksess"
set dop(lang.7.12) "URL"
set dop(lang.7.13) "BESKRIVELSE"
set dop(lang.7.14) "NØKKELORD"
set dop(lang.7.15) "Nick"
set dop(lang.7.16) "Liste over dcc-kommandoer"
set dop(lang.7.17) "nummer av dagen"
set dop(lang.7.18) "SYNTAKS: HELP \[kommando\]"
set dop(lang.7.19) "/msg « op <#kanal> \[kallenavn\] \[kallenavn2\] ... \[kallenavnN\]"
set dop(lang.7.20) "Oper en eller flere personer i kanalen din. Hvis ingen navn er gitt, og du ikke har op i kanalen, så vil « gi deg op."
set dop(lang.7.21) "/msg « deop <#kanal> \[kallenavn\] \[kallenavn2\] ... \[kallenavnN\]"
set dop(lang.7.22) "Deoper en eller flere personer i kanalen din. Hvis ingen navn er gitt og du har op, så vil $botnick deope deg."
set dop(lang.7.23) "/msg « voice <#kanal> \[kallenavn\] \[kallenavn2\] ... \[kallenavnN\]"
set dop(lang.7.24) "Gir voice til en eller flere brukere i kanalen."
set dop(lang.7.25) "/msg « devoice <#kanal> \[kallenavn\] \[kallenavn2\] ... \[kallenavnN\]"
set dop(lang.7.26) "Tar fra voice'n til en eller flere brukere i kanalen."
set dop(lang.7.27) "/msg « aksess <#kanal> <brukernavn> \[-min <verdi>\] \[-maks <verdi>\]"
set dop(lang.7.28) "Kan finne aksessen til en bestemt person eller en streng."
set dop(lang.7.29) "/msg « login <brukernavn> <passord>"
set dop(lang.7.30) "Logger deg selv inn i boten."
set dop(lang.7.31) "/msg « dauth <brukernavn> <passord>"
set dop(lang.7.32) "For å fjerne deg selv."
set dop(lang.7.33) "/msg « help <kommando>"
set dop(lang.7.34) "Viser hjelp for en gitt kommando."
set dop(lang.7.35) "/msg « uptime"
set dop(lang.7.36) "viser opptiden til « ."
set dop(lang.7.37) "/msg « verify <nick>"
set dop(lang.7.38) "Viser om en person er logget inn eller ikke. Hvis personen er det, vises brukernavnet deres"
set dop(lang.7.39) "Viser også om de er en offesiell Administrator"
set dop(lang.7.40) "/msg « status <#kanal>"
set dop(lang.7.41) "Viser statusen til kanalen"
set dop(lang.7.42) "/msg « info <brukernavn>"
set dop(lang.7.43) "Viser informasjonen til et brukernavn, slik som deres bruker@host hvis de er online, "
set dop(lang.7.44) "deres språk, usynlighetsinfo og når de var siste sett. Hvis du bruker det på deg selv, vises også" 
set dop(lang.7.45) "kanaler du har aksess på (bare Administrator og du selv kan se denne infoen, ikke andre brukere)."
set dop(lang.7.46) "Hvis du vil skjule denne informasjonen for resten, referer til SET INVISIBLE kommandoen (nivå 0)."
set dop(lang.7.47) "/msg « showcommands <#kanal>"
set dop(lang.7.48) "Viser kommandoene tilgjengelig for en gitt kanal."
set dop(lang.7.49) "/msg « ban <#kanal> <kallenavn|*!*bruker@*.host> \[grunn\]"
set dop(lang.7.50) "Legger til en bestemte *!*bruker@*.host til « sin ban-liste for kanalen."
set dop(lang.7.51) "/msg « unban <#kanak> <kallenavn|*!*bruker@*.host>"
set dop(lang.7.52) "Fjerner en *!*bruker@*.host fra $botnick banliste, i tilegg til evnt. like ban's fra ban-lista."
set dop(lang.7.53) "/msg « topic <#kanal> <topic>"
set dop(lang.7.54) "Gjør at « endrer topic i kanalen."
set dop(lang.7.55) "/msg « clearmode <#kanal>"
set dop(lang.7.56) "Fjerner alle kanal-modes fra kanalen. Kan bli brukt når kanalen din har blitt låst (at noen har satt +i eller +k uten din tilatelse)."
set dop(lang.7.57) "/msg « kick <#kanal> <kallenavn|pattern> \[grunn\]"
set dop(lang.7.58) "Gjør at « kaster noen ut fra kanalen."
set dop(lang.7.59) "/msg « set <#kanal> <variabel> <verdi>"
set dop(lang.7.60) "/msg « set <variabel> <verdi>"
set dop(lang.7.61) "Dette vil sette en kanal eller brukerkonto innstillinger."
set dop(lang.7.62) "Brukerkonto innstillinger: INVISIBLE LANG  - Lang available: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.7.63) "kanal innstillinger: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.7.64) "/msg « invite <#kanal>"
set dop(lang.7.65) "gjør at « inviterer deg til kanalen."
set dop(lang.7.66) "/msg « banlist <#kanal>"
set dop(lang.7.67) "Viser ban-lista for kanalen. Denne virker uansett om du er på kanalen eller ikke."
set dop(lang.7.68) "/msg « adduser <#kanal> <brukernavn> <aksess>"
set dop(lang.7.69) "Legger til en bruker til kanelen. Du kan ikke legge til noen med lik, eller høyere aksess enn din egen."
set dop(lang.7.70) "/msg « remuser <#kanal> <brukernavn>"
set dop(lang.7.71) "Fjerner en bruker fra databasen. Du må ha høyere aksess enn den du vil fjerne."
set dop(lang.7.72) "/msg « modinfo <#kanal> <access|automode> <brukernavn> <verdi>"
set dop(lang.7.73) "Følgende kommandoer kan brukes til å endre eksisterende brukere i kanalen."
set dop(lang.7.74) "Du kan ikke endre på noen med samme, eller høyere aksess enn din egen."
set dop(lang.7.75) "Med variabek-innstillingene kan du endre en bruker sin aksess, du kan justere den fra 1 til din egen aksess -1."
set dop(lang.7.76) "variablen automode lar deg sette auto-op, auto-voice eller ingenting."
set dop(lang.7.77) "Basert på denne innstillingen, så kan en bruker få voice eller op automatisk når han/hun kommer inn i kanalen."
set dop(lang.7.78) "** SUSPENDERT ** - (Nivå «)"
set dop(lang.7.79) "Du kan ikke suspendere en bruker med samme, eller høyere aksess enn din egen."
set dop(lang.7.80) "/msg « showignore"
set dop(lang.7.81) "Viser «'s ignoreringsliste. Ignorering skjer når noen, med eller uten hennsikt, flooder «."
set dop(lang.7.82) "/msg « chaninfo <#channel>"
set dop(lang.7.83) "Viser om kanalen er registrert eller ikke, og evt. til hvem."
set dop(lang.7.84) "/msg « motd"
set dop(lang.7.85) "Viser « sin beskjed for dagen (message of the day)."
set dop(lang.7.86) "/msg « search <søke parameter>"
set dop(lang.7.87) "Gjør at « lister opp alle kanaler hvor de gitte parametrene og nøkkelordene matcher, hvis det er noen som mathcer."
set dop(lang.7.88) "Du trenger ikke å bruke wildcards."
set dop(lang.7.89) "Det finnes ikke hjelp for den kommandoen."
set dop(lang.7.90) "SYNTAKS: REMOVEALL <#kanal>"
set dop(lang.7.91) "Beklager, du må være innlogget for å bruke denne kommandoen."
set dop(lang.7.92) "Beklager, du har ikke nok aksess til å bruke den kommandoen."
set dop(lang.7.93) "Kanalen « ser ikke ut til å være registrert."
set dop(lang.7.94) "«!« (identifisert som «) \[«\] fjerner all aksess fra «."
set dop(lang.7.95) "Ferdig. Tok bort « aksesser fra «."
set dop(lang.7.96) "dager"
set dop(lang.7.97) "opptid"
set dop(lang.7.98) "kanaler"
set dop(lang.7.99) "versjon"
set dop(lang.7.100) "Bot(er) linket"
set dop(lang.7.101) "SYNTAKS: SHOWCOMMANDS <#kanal>"
set dop(lang.7.102) "Nivå"
set dop(lang.7.103) "SYNTAKS: REGUSER <brukernavn> <epost>"
set dop(lang.7.104) "Jeg vet ikke hvem « er."
set dop(lang.7.105) "« er allerede registrert."
set dop(lang.7.106) "Eposten er i svartelisten: «"
set dop(lang.7.107) "SYNTAKS: ADDIGNORE <host>"
set dop(lang.7.108) "«!« (identifisert som «) \[«\] legger til ignore-listen: «."
set dop(lang.7.109) "Ignorert"
set dop(lang.7.110) "Lagt til ignorering («)"
set dop(lang.7.111) "SYNTAKS: REMIGNORE <host>"
set dop(lang.7.112) "«!« (identifisert som «) \[«\] fjerner fra ignoreringslisten: «."
set dop(lang.7.113) "Fjernet ignorering («)"
set dop(lang.7.114) "«!« (identifisert som «) \[«\] får boten til å hoppe til: «."
set dop(lang.7.115) "Ingen grunn"
set dop(lang.7.116) "«!« (identifisert som «) \[«\] gjorde at jeg kobla av."
set dop(lang.7.117) "«!« (identifisert som «) \[«\] ser på kanal-lista."
set dop(lang.7.118) "Boten har ikke joinet noen kanaler."
set dop(lang.7.119) "Slutt på kanal-listen"
set dop(lang.7.120) "SYNTAKS: SAY <#kanal> <msg>"
set dop(lang.7.121) "«!« (identifisert som «) \[«\] msg'er på «: «."
set dop(lang.7.122) "SYNTAKS: BROADCAST <msg>"
set dop(lang.7.123) "«!« (identifisert som «) \[«\] is broadcasting: «."
set dop(lang.7.124) "Du registrerte brukernavnet: «. i boten «. For å få brukernavnet ditt, må du registrere det. Her er din registrerings id: «"
set dop(lang.7.125) "Brukernavn"
set dop(lang.7.126) "SYNTAKS: REGID <verify id>"
set dop(lang.7.127) "«!« (identifisert som «) \[«\] oppdaterer botens config-filer."
set dop(lang.7.128) "Kanal, bruker og note-filer oppdatert"
set dop(lang.7.129) "SYNTAKS: ADDHAND <brukernavn> <host>"
set dop(lang.7.130) "« er allerede lagt til i boten."
set dop(lang.7.131) "«!« (identifisert som «) \[«\] legger til et brukernavn: «."
set dop(lang.7.132) "la til hand «"
set dop(lang.7.133) "SYNTAKS: CHANINFO <#kanal>"
set dop(lang.7.134) "« er registrert av:"
set dop(lang.7.135) "- sist sett: « siden"
set dop(lang.7.136) "« ser ikke ut til å ha en bruker med aksess 500."
set dop(lang.7.137) "«!« (identifisert som «) \[«\] ser på brukerlisten."
set dop(lang.7.138) "- « (eier)"
set dop(lang.7.139) "- « (normal bruker)"
set dop(lang.7.140) "slutt på hand liste"
set dop(lang.7.141) "SYNTAKS: REMHAND <username>"
set dop(lang.7.142) "«!« (identifisert som «) \[«\] fjerner et brukernavn: «"
set dop(lang.7.143) "fjernet hand «"
set dop(lang.7.144) "SYNTAKS: REGISTER <#kanal>"
set dop(lang.7.145) "« er allerede lagt til."
set dop(lang.7.146) "«!« (identifisert som «) \[«\] legger til en kanal: «"
set dop(lang.7.147) "lagt til kanal «"
set dop(lang.7.148) "SYNTAKS: PURGE <#kanal>"
set dop(lang.7.149) "«!« (identifisert som «) \[«\] fjerner en kanal: «"
set dop(lang.7.150) "fjernet kanal «"
set dop(lang.7.151) "« er offesiell service Bot."
set dop(lang.7.152) "«« er IKKE logget inn."
set dop(lang.7.153) "Jeg kan ikke se « noen sted."
set dop(lang.7.154) "«« er en offesiel Bot Administrator og logget inn som «."
set dop(lang.7.155) "«« er logget inn som «."
set dop(lang.7.156) "Din host matcher ingen av mine."
set dop(lang.7.157) "Skriv /msg « regid «"
set dop(lang.7.158) "Du har ikke satt passord ennå."
set dop(lang.7.159) "TILFØYING AV HOST FEILET som « (Galt passord)"
set dop(lang.7.160) "Din host har blitt lagt til i « (*!*«)"
set dop(lang.7.161) "SYNTAKS: LOGIN <brukernavn> <passord>"
set dop(lang.7.162) "Beklager, du er allerede innlogga som «"
set dop(lang.7.163) "INNLOGGING SOM « FEILET! (Galt passord)"
set dop(lang.7.164) "«!« (identifisert som «) \[«\] innlogging FEILET."
set dop(lang.7.165) "INNLOGGING SOM « AKSEPTERT."
set dop(lang.7.166) "«!« (identifisert som  «) \[«\] er nå identifisert som en eier."
set dop(lang.7.167) "SYNTAks: DAUTH <brukernavn> <passord>"
set dop(lang.7.168) "UTREGISTRERING FEILET som « (Galt passord)"
set dop(lang.7.169) "UTREGISTRERING FULLFØRT som «."
set dop(lang.7.170) "SUSPANDERING for « på « er aktivert"
set dop(lang.7.171) "SYNTAKS: SUSPEND <kanal> <bruker> \[nivå\]"
set dop(lang.7.172) "SYNTAKS: UNSUSPEND <kanal> <bruker>"
set dop(lang.7.173) "SYNTAKS: ADDUSER <#kanal> <brukernavn> <aksess>"
set dop(lang.7.174) "« er allerede lagt til « med aksess «."
set dop(lang.7.175) "Du kan ikke legge til en bruker med samme, eller høyere aksess enn deg selv."
set dop(lang.7.176) "Ugjyldig aksess-nivå."
set dop(lang.7.177) "La til bruker « til « med aksess «."
set dop(lang.7.178) "SYNTAKS: REMUSER <#kanal> <brukernavn>"
set dop(lang.7.179) "« ser ikke ut til å ha aksess i «"
set dop(lang.7.180) "Fjernet bruker « fra «."
set dop(lang.7.181) "SYNTAKS: MODINFO <#kanal> \[ACCESS <brukernavn> <nivå>\] \[AUTOMODE <brukernavn> <NONE|OP|VOICE>\]"
set dop(lang.7.182) "Modifiserte « sin aksess på kanalen « til «."
set dop(lang.7.183) "Satte AUTOMODE til OP for « på kanal «"
set dop(lang.7.184) "Satte AUTOMODE til VOICE for « på kanal «"
set dop(lang.7.185) "Satte AUTOMODE til NONE for « på kanal «"
set dop(lang.7.186) "SYNTAKS: SET \[#kanal\] <variabel> <verdi> eller, SET <invisible> <ON|OFF>, SET <lang> <språk nummer>"
set dop(lang.7.187) "Din usynlighets-innstilling er nå PÅ."
set dop(lang.7.188) "Din usynlighets-innstilling er nå AV."
set dop(lang.7.189) "verdien på INVISIBLE må være ON eller OFF"
set dop(lang.7.190) "Din Språkinnstilling er nå «."
set dop(lang.7.191) "Språk-nummer må være mellom 1 til «."
set dop(lang.7.192) "« for « er: «"
set dop(lang.7.193) "verdien AUTOTOPIC må være ON eller OFF"
set dop(lang.7.194) "verdien NOOP må være ON eller OFF"
set dop(lang.7.195) "« for « er fjernet."
set dop(lang.7.196) "verdien STRICTOP må være ON eller OFF"
set dop(lang.7.197) "SYNTAKS: INVITE <#kanal>"
set dop(lang.7.198) "Beklager, du er allerede på «."
set dop(lang.7.199) "SYNTAKS: OP <#kanal> \[kallenavn\] \[kallenavn\] .."
set dop(lang.7.200) "NOOP er satt på i «"
set dop(lang.7.201) "SYNTAKS: DEOP <#kanal> \[kallenavn\] \[kallenavn\] .."
set dop(lang.7.202) "Jeg tror ikke « ville godta det."
set dop(lang.7.203) "SYNTAKS: VOICE <#kanal> \[kallenavn\] \[kallenavn\] .."
set dop(lang.7.204) "SYNTAKS: DEVOICE <#kanal> \[kallenavn\] \[kallenavn\] .."
set dop(lang.7.205) "SYNTAKS: BAN <#kanal> <kallenavn | *!*bruker@*.host> \[lengde\] \[grunn\]"
set dop(lang.7.206) "SYNTAKS: KICK <#kanal> <kallenavn> <grunn>"
set dop(lang.7.207) "SYNTAKS: TOPIC <#kanal> <topic>"
set dop(lang.7.208) "SYNTAKS: UNBAN <#kanal> <*!*bruker@*.host>"
set dop(lang.7.209) "Fjernet 1 ban som matchet «"
set dop(lang.7.210) "SYNTAKS: BANLIST <#kanal>"
set dop(lang.7.211) "-« av «"
set dop(lang.7.212) "Slutt på ban-liste"
set dop(lang.7.213) "SYNTAKS: INFO <brukernavn>"
set dop(lang.7.214) "Kan ikke vise detaljer (usynlig)"
set dop(lang.7.215) "Informasjon om: «"
set dop(lang.7.216) "Akkurat nå logget inn med:"
set dop(lang.7.217) "OFFLINE"
set dop(lang.7.218) "INVISIBLE er «"
set dop(lang.7.219) "Kanaler"
set dop(lang.7.220) "SYNTAKS: ACCESS <#kanal> <brukernavn> \[-min <nivå>\] \[-maks <nivå>\]"
set dop(lang.7.221) "ugyldig minimums nivå."
set dop(lang.7.222) "ugyldig maksimums nivå."
set dop(lang.7.223) "BRUKER: « AKSESS: « «"
set dop(lang.7.224) "KANAL: « -- AUTOMODE: «"
set dop(lang.7.225) "SIST SETT: « siden."
set dop(lang.7.226) "Ingen treff!"
set dop(lang.7.227) "SLutt på aksess liste"
set dop(lang.7.228) "SYNTAKS: STATUS <#kanal>"
set dop(lang.7.229) "Kanal « har « brukere (« operatører)"
set dop(lang.7.230) "Mode er: «"
set dop(lang.7.231) "Jeg er på denne kanalen nå."
set dop(lang.7.232) "Flood ïnnstillinger"
set dop(lang.7.233) "Flags satt"
set dop(lang.7.234) "Ignorerings liste:"
set dop(lang.7.235) "Slutt på ignoreringslista"
set dop(lang.7.236) "Det er flere enn 10 anførsler \[«\]"
set dop(lang.7.237) "Vennligst innskrenk søket ditt"
set dop(lang.7.238) "Ingen matchende posteringer for \[«\]"
set dop(lang.7.239) "SYNTAKS: CLEARMODE <#kanal>"
set dop(lang.7.240) "Ingen utgåtte brukere."
set dop(lang.7.241) "Bot brukernavn"
set dop(lang.7.242) "«« er en offesiell Bot manager og er logget inn som «."
set dop(lang.7.243) "«« er en offesiell Bot eier og er logget inn som «."
set dop(lang.7.244) "Det er allerede en eier i denne kanalen."
set dop(lang.7.245) "Registreringsmail for « med din bekreftelse har blitt sent til «."
set dop(lang.7.246) "INNLOGGIN FEILET SOM «. (Maksimum innlogginger er nådd)."
set dop(lang.7.247) "Nåværende innlogging: «"
set dop(lang.7.248) "« er ikke logget inn."
set dop(lang.7.249) "BRUKERNAVN: « Registrert med epost: «"
set dop(lang.7.250) "Du kan skrive /msg « pass « <ditt passord> fra nå av!"
set dop(lang.7.251) "Registreringsnummer ikke funnet!"
set dop(lang.7.252) "SYNTAKS: PASS <brukernavn> <passord>"
set dop(lang.7.253) "PASSORDBYTTE SOM « FEILET! (Galt Passord)"
set dop(lang.7.254) "Passord må være lenger enn « tegn."
set dop(lang.7.255) "Passord satt til: «"
set dop(lang.7.256) "Passord allerede satt. Bruk /msg « pass <gammelt passord> <nytt passord>"
set dop(lang.7.257) "Epost:"
set dop(lang.7.258) "Ikke bekreftet (Lagt til siden «)"
set dop(lang.7.259) "Do har ikke registrert din regid ennå!"
set dop(lang.7.260) "SYNTAKS: JOIN <kanal>"
set dop(lang.7.261) "SYNTAKS: PART <kanal>"
set dop(lang.7.262) "Anmoded av «"
set dop(lang.7.263) "Jeg er ikke på denne kanalen."
set dop(lang.7.264) "Din aksess på « har blitt suspandert."
set dop(lang.7.265) "SUSPANDERINGEN for « på « er kansellert"
set dop(lang.7.266) "Kan ikke ta bort en suspandering med lik eller høyere aksess enn din egen."
set dop(lang.7.267) "/msg « join <#kanal>"
set dop(lang.7.268) "Gjør at « joiner en kanal."
set dop(lang.7.269) "/msg « part <#kanal>"
set dop(lang.7.270) "Gjør at « drar fra din kanal."
set dop(lang.7.271) "/msg « suspend <#channel> <username> \[level\]"
set dop(lang.7.272) "Suspanderer en bruker sin aksess i « på kanalen din for det angitte nivået, hvis gitt."
set dop(lang.7.273) "Hvis et nivå ikke er satt, vil standard suspanderingsnivået som brukes være aksess-verdien til den som setter det."
set dop(lang.7.274) "Du kan bare suspandere noen med lavere aksess enn din egen."
set dop(lang.7.275) "/msg « unsuspend <#kanal> <brukernavn>"
set dop(lang.7.276) "Tar bort suspanderingen av en bruker sin aksess i « i din kanal-brukerliste"
set dop(lang.7.277) "Du kan bare ta bort suspanderingen av noen med lavere aksess enn din egen,"
set dop(lang.7.278) "hvis suspanderingsnivået er laveret eller lik ditt eget aksessnivå."
set dop(lang.7.279) "/msg « reguser <brukernavn> <gyldig epost>"
set dop(lang.7.280) "Lager et brukernavn. Den vil sjekke gyldigheten av eposten."
set dop(lang.7.281) "/msg « regid <registrerings ID>"
set dop(lang.7.282) "Gjør ditt brukernavn brukbart."
set dop(lang.7.283) "/msg « pass <brukernavn> <passord>"
set dop(lang.7.284) "Setter ditt passord."
set dop(lang.7.285) "Ugyldig kanalnavn."
set dop(lang.7.286) "La til ban « til «."
set dop(lang.7.287) "Verdien FLOATLIM må være ON eller OFF"
set dop(lang.7.288) "Ugyldig flytende maksimumsgrense (Må være 2-20)."
set dop(lang.7.289) "Ugyldig flytende maksimumsgrense max (Må være 0-65536)."
set dop(lang.7.290) "Ugyldig flytende maksimumsgrense periode (Må være 20-200)."
set dop(lang.7.291) "Ugyldig flytende frist innstilling (Må være 0-19)."
set dop(lang.7.292) "SYNTAKS: CYCLE <#kanal>"
set dop(lang.7.293) "SYNTAKS: ACTION <#kanal> <action/msg>"
set dop(lang.7.294) "«!« (logget inn som «) \[«\] lar meg gjøre en handling på «: «"
set dop(lang.7.295) "/msg « cycle <#kanal>"
set dop(lang.7.296) "gjør at « går ut og inn av kanalen din."
set dop(lang.7.297) "« for « minutter."
set dop(lang.7.298) "« for alltid"
set dop(lang.7.299) "SISTE LOGG: «"
set dop(lang.7.298) "tilkoblet « siden «"
set dop(lang.7.299) "Denne emailen har en ugyldig syntaks. (..@..)"

#Danish
set dop(lang.8.1) "Liste over udgået brugere:"
set dop(lang.8.2) "Aldrig"
set dop(lang.8.3) "BRUGER -- « -- Sidst set: «"
set dop(lang.8.4) "ja"
set dop(lang.8.5) "nej"
set dop(lang.8.6) "Host"
set dop(lang.8.7) "Identificeret"
set dop(lang.8.8) "Sprog"
set dop(lang.8.9) "Sidst Set"
set dop(lang.8.10) "Adgang"
set dop(lang.8.11) "Ingen adgang"
set dop(lang.8.12) "URL"
set dop(lang.8.13) "DESC"
set dop(lang.8.14) "NØGLEORD"
set dop(lang.8.15) "Nick"
set dop(lang.8.16) "Liste over DCC kommandoer"
set dop(lang.8.17) "dag nummer"
set dop(lang.8.18) "SYNTAX: HELP \[kommando\]"
set dop(lang.8.19) "/msg « op <#kanal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.8.20) "Opper en eller flere personer i din kanal. Hvis intet nick gives, vil « oppe dig."
set dop(lang.8.21) "/msg « deop <#kanal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.8.22) "Deopper en eller flere personer i din kanal. Hvis intet nick gives, vil « oppe dig."
set dop(lang.8.23) "/msg « voice <#kanal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.8.24) "Voicer en eller flere personer i din kanal."
set dop(lang.8.25) "/msg « devoice <#kanal> \[nick\] \[nick2\] ... \[nickN\]"
set dop(lang.8.26) "Devoicer en eller flere personer i din kanal."
set dop(lang.8.27) "/msg « access <#kanal> <brugernavn> \[-min <level>\] \[-max <level>\]"
set dop(lang.8.28) "Viser adgangs-level på en givet bruger."
set dop(lang.8.29) "/msg « login <brugernavn> <adgangskode>"
set dop(lang.8.30) "Logger dig ind i botten."
set dop(lang.8.31) "/msg « dauth <brugernavn> <adgangskode>"
set dop(lang.8.32) "Logger dig ud af botten."
set dop(lang.8.33) "/msg « help <kommando>"
set dop(lang.8.34) "Viser hjælpe-information om en givet kommando."
set dop(lang.8.35) "/msg « uptime"
set dop(lang.8.36) "Viser «'s oppetid."
set dop(lang.8.37) "/msg « verify <nick>"
set dop(lang.8.38) "Viser om en person er logget ind eller ej, og hvis det er tilfældet, så viser den brugernavnet."
set dop(lang.8.39) "Og viser også om brugeren er en officiel administrator eller ej."
set dop(lang.8.40) "/msg « status <#kanal>"
set dop(lang.8.41) "Viser #kanal's status."
set dop(lang.8.42) "/msg « info <brugernavn>"
set dop(lang.8.43) "Viser information om et brugernavn samt dets user@host hvis denne er online, "
set dop(lang.8.44) "deres sprog og usynlig-indstillinger og sidst-set information. Hvis du bruger den på dig selv, viser den også alle"
set dop(lang.8.45) "kanaler du har adgang i (Kun administratore og dig kan se disse informationer, ikke andre brugere)."
set dop(lang.8.46) "Hvis du ønsker at skjule disse informationer, brug venligst SET INVISIBLE kommandoen. (level 0)."
set dop(lang.8.47) "/msg « showcommands <#kanal>"
set dop(lang.8.48) "Viser alle kommandoer der er tilgængelig for dig over en givet kanal."
set dop(lang.8.49) "/msg « ban <#kanal> <nick|*!*user@*.host> \[årsag\]"
set dop(lang.8.50) "Sætter et ban på *!*user@*.host til «'s banliste over kanalen."
set dop(lang.8.51) "/msg « unban <#kanal> <nick|*!*user@*.host>"
set dop(lang.8.52) "Fjerner et *!*user@*.host ban fra bottens ban-database over en givet kanal, samt alle bans der matcher den host."
set dop(lang.8.53) "/msg « topic <#kanal> <topic>"
set dop(lang.8.54) "Får « til at ændre topic i en kanal."
set dop(lang.8.55) "/msg « clearmode <#kanal>"
set dop(lang.8.56) "Fjerner alle kanal-modes. Kan f.eks. bruges hvis der er sat en mode der gør det umuligt for dig at joine kanalen (som +i og +k)."
set dop(lang.8.57) "/msg « kick <#kanal> <nick|pattern> \[årsag\]"
set dop(lang.8.58) "Får « til at kicke nogle fra en givet kanal."
set dop(lang.8.59) "/msg « set <#kanal> <variabel> <værdi>"
set dop(lang.8.60) "/msg « set <variabel> <værdi>"
set dop(lang.8.61) "Dette vil ændre instillinger på en user eller kanal."
set dop(lang.8.62) "Brugerkonto indstillinger: INVISIBLEE LANG  - Sprog tilgængelig: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.8.63) "Kanal indstillinger: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.8.64) "/msg « invite <#kanal>"
set dop(lang.8.65) "Får « til at invite dig til din kanal."
set dop(lang.8.66) "/msg « banlist <#kanal>"
set dop(lang.8.67) "Viser kanal-banlisten. Denne kommando virker selvom du ikke er på kanalen."
set dop(lang.8.68) "/msg « adduser <#kanal> <brugernavn> <adgang>"
set dop(lang.8.69) "Tilføjer en bruger til kanalens brugerliste. Du kan ikke lave ADDUSER på en bruger der har mere eller samme adgangs-level som dig."
set dop(lang.8.70) "/msg « remuser <#kanal> <brugernavn>"
set dop(lang.8.71) "Fjerner en bruger fra kanalens brugerliste. Du skal have højere adgangs-level end den bruger du vil fjerne."
set dop(lang.8.72) "/msg « modinfo <#kanal> <access|automode> <brugernavn> <værdi>"
set dop(lang.8.73) "De følgende kommandoer kan bruges til at lave ændringer på en eksisterende bruger."
set dop(lang.8.74) "Du kan ikke modificere nogle der har højere eller samme level som dig."
set dop(lang.8.75) "Med denne variabel kan du ændre en brugers adgangsniveau. Rækkeviden kan være mellem 1 og til din egen adgangs-level."
set dop(lang.8.76) "Automode variablen lader dig sætte mode none, voice eller op."
set dop(lang.8.77) "Baseret på hvad du vælger, kan brugeren få op eller voice så snart vedkommende joiner kanalen."
set dop(lang.8.78) "** SUSPENDERET ** - (Level «)"
set dop(lang.8.79) "Kan ikke suspendere en bruger med samme eller højere adgangs-level end dig."
set dop(lang.8.80) "/msg « showignore"
set dop(lang.8.81) "Shows «'s ignore liste. Ignores sker, når en ved en fejl eller med vilje flooder «."
set dop(lang.8.82) "/msg « chaninfo <#kanal>"
set dop(lang.8.83) "Viser om en kanal er registeret eller ej, og til hvem."
set dop(lang.8.84) "/msg « motd"
set dop(lang.8.85) "Viser «'s 'message of the day'."
set dop(lang.8.86) "/msg « search <search parameter>"
set dop(lang.8.87) "Får botten til at skrive en liste over kanaler med de givne søgeord, hvis der er nogle."
set dop(lang.8.88) "Brugen af wildcards er ikke nødvendigt."
set dop(lang.8.89) "Der er ingen hjælp tilgængelig for det topic."
set dop(lang.8.90) "SYNTAX: REMOVEALL <#kanal>"
set dop(lang.8.91) "Du skal være logget ind for at bruge denne kommando."
set dop(lang.8.92) "Du har ikke adgangs-level nok til at udføre denne kommando."
set dop(lang.8.93) "Kanalen « er ikke registreret."
set dop(lang.8.94) "«!« (auth as «) \[«\] fjerner alle bruger-levels fra «."
set dop(lang.8.95) "Slettet « adgangs-liste fra «."
set dop(lang.8.96) "dage"
set dop(lang.8.97) "Oppetid"
set dop(lang.8.98) "Kanaler"
set dop(lang.8.99) "Version"
set dop(lang.8.100) "Bot linket"
set dop(lang.8.101) "SYNTAX: SHOWCOMMANDS <#kanal>"
set dop(lang.8.102) "Adgangs-level"
set dop(lang.8.103) "SYNTAX: REGUSER <brugernavn> <email>"
set dop(lang.8.104) "Jeg ved ikke hvem « er."
set dop(lang.8.105) "« er allerede registreret."
set dop(lang.8.106) "Email i blacklist: «"
set dop(lang.8.107) "SYNTAX: ADDIGNORE <host>"
set dop(lang.8.108) "«!« (logget ind som «) \[«\] tilføjer til ignore listen: «."
set dop(lang.8.109) "Ignoreret"
set dop(lang.8.110) "Tilføjet ignore («)"
set dop(lang.8.111) "SYNTAX: REMIGNORE <host>"
set dop(lang.8.112) "«!« (logget ind som «) \[«\] fjerner fra ignore liste: «."
set dop(lang.8.113) "Removed ignore («)"
set dop(lang.8.114) "«!« (logget ind som «) \[«\] får botten til at hoppe til: «."
set dop(lang.8.115) "Ingen årsag"
set dop(lang.8.116) "«!« (logget ind som «) \[«\] lukkede mig ned."
set dop(lang.8.117) "«!« (logget ind som «) \[«\] kigger på kanal-listen."
set dop(lang.8.118) "Botten har ikke joined nogle kanaler."
set dop(lang.8.119) "Ende af kanal-listen"
set dop(lang.8.120) "SYNTAX: SAY <#kanal> <besked>"
set dop(lang.8.121) "«!« (logget ind som «) \[«\] sender beskeder på «: «."
set dop(lang.8.122) "SYNTAX: BROADCAST <besked>"
set dop(lang.8.123) "«!« (logget ind som «) \[«\] sender en broadcast besked: «."
set dop(lang.8.124) "Du har registreret brugeren: «. På botten «. For at få dit brugernavn bliver du nød til at registrere det. Her er dit registrations-ID: «"
set dop(lang.8.125) "Brugernavn"
set dop(lang.8.126) "SYNTAX: REGID <verificerings id>"
set dop(lang.8.127) "«!« (logget ind som «) \[«\] genstarter konfigurations-filen."
set dop(lang.8.128) "Kanal, bruger og note-filer geninstalleret."
set dop(lang.8.129) "SYNTAX: ADDHAND <brugernavn> <host>"
set dop(lang.8.130) "« er allerede tiføjet botten."
set dop(lang.8.131) "«!« (logget ind som «) \[«\] tilføjer brugernavn: «."
set dop(lang.8.132) "Tilføjet bruger «"
set dop(lang.8.133) "SYNTAX: CHANINFO <#kanal>"
set dop(lang.8.134) "« er registreret af:"
set dop(lang.8.135) "- sidst set: « siden"
set dop(lang.8.136) "« har ikke en bruger med adgangs-level 500."
set dop(lang.8.137) "«!« (logget ind som «) \[«\] kigger på kanal-listen."
set dop(lang.8.138) "- « (ejer)"
set dop(lang.8.139) "- « (normal bruger)"
set dop(lang.8.140) "Ende af bruger-liste"
set dop(lang.8.141) "SYNTAX: REMHAND <brugernavn>"
set dop(lang.8.142) "«!« (logget ind som «) \[«\] fjerner brugernavn: «"
set dop(lang.8.143) "Brugernavn fjernet «"
set dop(lang.8.144) "SYNTAX: REGISTER <#kanal>"
set dop(lang.8.145) "« er allerede tilføjet."
set dop(lang.8.146) "«!« (logget ind som «) \[«\[ tilføjer kanal: «"
set dop(lang.8.147) "Kanal tilføjet «"
set dop(lang.8.148) "SYNTAX: PURGE <#kanal>"
set dop(lang.8.149) "«!« (logget ind som «) \[«\] fjerner kanal: «"
set dop(lang.8.150) "Kanal fjernet «"
set dop(lang.8.151) "« er en officiel Service Bot."
set dop(lang.8.152) "«« er IKKE logget ind."
set dop(lang.8.153) "Jeg kan ikke se « nogensteder."
set dop(lang.8.154) "«« er en officiel Bot Administrator og er logget ind som «."
set dop(lang.8.155) "«« er logget ind som «."
set dop(lang.8.156) "Din host matcher ingen af dem jeg kender."
set dop(lang.8.157) "Skriv /msg « regid «"
set dop(lang.8.158) "Du har ikke sat et password endnu."
set dop(lang.8.159) "HOSTTILFØJNING MISLYKKEDES som « (Forkert kodeord)"
set dop(lang.8.160) "Din host er tilføjet « (*!*«)"
set dop(lang.8.161) "SYNTAX: LOGIN <brugernavn> <kodeord>"
set dop(lang.8.162) "Du er allerede logget ind som «"
set dop(lang.8.163) "LOGIN MISLYKKEDES som « (Forkert kodeord)"
set dop(lang.8.164) "«!« (logget ind som «) \[«\] login MISLYKKEDES."
set dop(lang.8.165) "LOGIN LYKKEDES som «."
set dop(lang.8.166) "«!« (logget ind som «) \[«\] er nu logget ind som en ejer."
set dop(lang.8.167) "SYNTAX: DAUTH <brugernavn> <kodeord>"
set dop(lang.8.168) "LOGUD MISLYKKEDES as « (Forkert kodeord)"
set dop(lang.8.169) "LOGUD LYKKEDES as «."
set dop(lang.8.170) "SUSPENDERING for « på « er aktiveret"
set dop(lang.8.171) "SYNTAX: SUSPEND <kanal> <bruger> \[adgangs-level\]"
set dop(lang.8.172) "SYNTAX: UNSUSPEND <kanal> <bruger>"
set dop(lang.8.173) "SYNTAX: ADDUSER <#kanal> <brugernavn> <adgangs-level>"
set dop(lang.8.174) "« er allerede tilføjet til « med adgangs-level «."
set dop(lang.8.175) "Du kan ikke tilføje en bruger med samme eller højere adgangs-level end dig selv."
set dop(lang.8.176) "Forkert adgangs-level."
set dop(lang.8.177) "Tilføjet bruger « til « med adgangs-level «."
set dop(lang.8.178) "SYNTAX: REMUSER <#kanal> <brugernavn>"
set dop(lang.8.179) "« har ingen adgangs-level i «"
set dop(lang.8.180) "Fjernet bruger « fra «."
set dop(lang.8.181) "SYNTAX: MODINFO <#kanal> \[ACCESS <brugernavn <adgangs-level>\] \[AUTOMODE <brugernavn> <NONE|OP|VOICE>\]"
set dop(lang.8.182) "Modificeret «'s adgangs-level « til «."
set dop(lang.8.183) "Set AUTOMODE to OP for « på kanalen «"
set dop(lang.8.184) "Set AUTOMODE to VOICE for « på kanalen «"
set dop(lang.8.185) "Set AUTOMODE to NONE for « på kanalen «"
set dop(lang.8.186) "SYNTAX: SET \[#kanal\] <variabel> <værdi> eller, SET <invisible> <ON|OFF>, SET <lang> <sprog nummer>"
set dop(lang.8.187) "Din INVISIBLE indstilling er nu ON."
set dop(lang.8.188) "Din INVISIBLE indstilling er nu OFF."
set dop(lang.8.189) "Værdi ved brug af INVISIBLE skal være ON eller OFF"
set dop(lang.8.190) "Din LANG indstilling er nu «."
set dop(lang.8.191) "Sprog nummer skal være mellem 1 og «."
set dop(lang.8.192) "« for « er: «"
set dop(lang.8.193) "værdi for AUTOTOPIC skal være ON eller OFF"
set dop(lang.8.194) "Værdi for NOOP skal være ON eller OFF"
set dop(lang.8.195) "« for « er nulstillet."
set dop(lang.8.196) "værdi for STRICTOP skal være ON eller OFF"
set dop(lang.8.197) "SYNTAX: INVITE <#kanal>"
set dop(lang.8.198) "Du er allerede på «."
set dop(lang.8.199) "SYNTAX: OP <#kanal> \[nick\] \[nick\] .."
set dop(lang.8.200) "Desværre, NOOP er sat til ON «"
set dop(lang.8.201) "SYNTAX: DEOP <#kanal> \[nick\] \[nick\] .."
set dop(lang.8.202) "Jeg tror ikke « ville være glad for det."
set dop(lang.8.203) "SYNTAX: VOICE <#kanal> \[nick\] \[nick\] .."
set dop(lang.8.204) "SYNTAX: DEVOICE <#kanal> \[nick\] \[nick\] .."
set dop(lang.8.205) "SYNTAX: BAN <#kanal> <nick | *!*user@*.host> \[livstid\] \[årsag\]"
set dop(lang.8.206) "SYNTAX: KICK <#kanal> <nick> <årsag>"
set dop(lang.8.207) "SYNTAX: TOPIC <#kanal> <topic>"
set dop(lang.8.208) "SYNTAX: UNBAN <#kanal> <*!*user@*.host>"
set dop(lang.8.209) "Fjernet 1 ban der matchede «"
set dop(lang.8.210) "SYNTAX: BANLIST <#kanal>"
set dop(lang.8.211) "-« af «"
set dop(lang.8.212) "Ende af ban-liste"
set dop(lang.8.213) "SYNTAX: INFO <brugernavn>"
set dop(lang.8.214) "Kan ikke se bruger-detaljer (Usynlig)"
set dop(lang.8.215) "Information over: «"
set dop(lang.8.216) "Lige nu logget ind via.:"
set dop(lang.8.217) "OFFLINE"
set dop(lang.8.218) "INVISIBLE er «"
set dop(lang.8.219) "Kanaler"
set dop(lang.8.220) "SYNTAX: ACCESS <#kanal> <brugernavn> \[-min <adgangs-level>\] \[-max <adgangs-level>\]"
set dop(lang.8.221) "Ugyldig minimum adgangs-level."
set dop(lang.8.222) "Ugyldig maksimum adgangs-level."
set dop(lang.8.223) "BRUGER: « ADGANGS-LEVEL: « «"
set dop(lang.8.224) "KANAL: « -- AUTOMODE: «"
set dop(lang.8.225) "SIDST SET: « siden."
set dop(lang.8.226) "Kan ikke finde brugeren/kanalen!"
set dop(lang.8.227) "Ende af adgangs-liste"
set dop(lang.8.228) "SYNTAX: STATUS <#kanal>"
set dop(lang.8.229) "« har « brugere (« operatører)"
set dop(lang.8.230) "Mode er: «"
set dop(lang.8.231) "Jeg er i denne kanal."
set dop(lang.8.232) "Flood indstilling"
set dop(lang.8.233) "Flags set"
set dop(lang.8.234) "Ignore liste:"
set dop(lang.8.235) "Ende af ignore-liste"
set dop(lang.8.236) "Der er mere end 10 der matcher \[«\]"
set dop(lang.8.237) "Prøv at være mere specifik."
set dop(lang.8.238) "Ingenting fundet der matcher \[«\]"
set dop(lang.8.239) "SYNTAX: CLEARMODE <#kanal>"
set dop(lang.8.240) "Ingen brugere udløbet."
set dop(lang.8.241) "Bot nick"
set dop(lang.8.242) "«« er en officiel Bot Manager og er logget ind som «."
set dop(lang.8.243) "«« er en Official Bot Owner og er logget ind som «."
set dop(lang.8.244) "Der er allerede en master på denne kanal."
set dop(lang.8.245) "Registrationsemail for « er sendt til «."
set dop(lang.8.246) "LOGIN MISLYKKEDES som «. (Maksimum logins overtrådt)."
set dop(lang.8.247) "Nuværende sessioner: «"
set dop(lang.8.248) "« er ikke logget ind."
set dop(lang.8.249) "Brugernavn: « registreret med emailen: «"
set dop(lang.8.250) "Du kan skrive /msg « pass « <dit kodeord> fra nu af!"
set dop(lang.8.251) "Registrationsnummer ikke fundet!"
set dop(lang.8.252) "SYNTAX: PASS <brugernavn> <kodeord>"
set dop(lang.8.253) "KODEORD SKIFT MISLYKKEDES som « (Forkert kodeord)"
set dop(lang.8.254) "Kodeord skal være længere end « cifre."
set dop(lang.8.255) "Kodeord sat til: «"
set dop(lang.8.256) "Kodeord allerede sat... Brug /msg « pass <gammelt kodeord> <kodeord>"
set dop(lang.8.257) "Email:"
set dop(lang.8.258) "Ikke verificeret (Eksisteret siden «)"
set dop(lang.8.259) "Du har ikke registreret dit regid endnu!"
set dop(lang.8.260) "SYNTAX: JOIN <#kanal>"
set dop(lang.8.261) "SYNTAX: PART <#kanal>"
set dop(lang.8.262) "Beordret af «"
set dop(lang.8.263) "Jeg er ikke i den kanal."
set dop(lang.8.264) "Din adgangs-level på « er blevet suspenderet."
set dop(lang.8.265) "SUSPENSION for « på « er annulleret"
set dop(lang.8.266) "Kan ikke fjerne en suspensasion der er sat med samme eller højere adgangs-level end dig selv."
set dop(lang.8.267) "/msg « join <#kanal>"
set dop(lang.8.268) "Får « til at joine en kanal."
set dop(lang.8.269) "/msg « part <#kanal>"
set dop(lang.8.270) "Får « til at parte din kanal."
set dop(lang.8.271) "/msg « suspend <#kanal> <brugernavn> \[adgangs-level\]"
set dop(lang.8.272) "Suspenderer en brugers adgangs-level til « på din kanals bruger liste med en givet level hvis givet."
set dop(lang.8.273) "Hvis en level ikke bliver specificeret, vil standard suspensions-level blive samme level som den der sætter suspendasionen."
set dop(lang.8.274) "Du kan kun suspendere en bruger med lavere adgangs-level end din egen."
set dop(lang.8.275) "/msg « unsuspend <#kanal> <brugernavn>"
set dop(lang.8.276) "Fjerner suspendasion af en brugers adgangs-level til « på din kanals brugerliste. "
set dop(lang.8.277) "Du kan kun fjerne suspendasion på en bruger der har lavere adgangs-level end dig selv,"
set dop(lang.8.278) "men hvis suspenderings-level er under din level, er det også muligt."
set dop(lang.8.279) "/msg « reguser <brugernavn> <valid email>"
set dop(lang.8.280) "Lav et brugernavn. Det vil blive valificeret via. email."
set dop(lang.8.281) "/msg « regid <identifikations id>"
set dop(lang.8.282) "Gør dit brugernavn brugbart."
set dop(lang.8.283) "/msg « pass <brugernavn> <kodeord>"
set dop(lang.8.284) "Sætter dit kodeord."
set dop(lang.8.285) "Ugyldigt kanal-navn."
set dop(lang.8.286) "Tilføjede ban « til «."
set dop(lang.8.287) "Værdi af FLOATLIM skal være ON eller OFF"
set dop(lang.8.288) "Ugyldig floating-limit Margin (2-20 accepteret)."
set dop(lang.8.289) "Ugyldig floating-limit maks (0-65536 accepteret)."
set dop(lang.8.290) "Ugyldig floating-limit period (20-200 accepteret)."
set dop(lang.8.291) "Ugyldig floating-grace setting (0-19 accepteret)."
set dop(lang.8.292) "SYNTAX: CYCLE <#kanal>"
set dop(lang.8.293) "SYNTAX: ACTION <#kanal> <action/msg>"
set dop(lang.8.294) "«!« (auth som «) \[«\] får mig til at lave en action på «: «"
set dop(lang.8.295) "/msg « cycle <#kanal>"
set dop(lang.8.296) "Får « til at forlade din kanal."
set dop(lang.8.297) "« i « minut(ter)."
set dop(lang.8.298) "« for ever"
set dop(lang.8.299) "Denne email-adresse har en forkert syntax. (..@..)"
set dop(lang.8.300) "Tilsluttet via « siden «"


#Italian
set dop(lang.9.1) "Lista degli utenti scaduti:"
set dop(lang.9.2) "Mai"
set dop(lang.9.3) "UTENTE -- « -- Ultimo accesso: «"
set dop(lang.9.4) "Si"
set dop(lang.9.5) "no"
set dop(lang.9.6) "Host"
set dop(lang.9.7) "Identificati"
set dop(lang.9.8) "Linguaggio"
set dop(lang.9.9) "Ultimo accesso"
set dop(lang.9.10) "Accesso"
set dop(lang.9.11) "Accesso negaa"
set dop(lang.9.12) "URL"
set dop(lang.9.13) "DESCRIZIONE"
set dop(lang.9.14) "PAROLACHIAVE"
set dop(lang.9.15) "utentename"
set dop(lang.9.16) "Lista dei comandi DCC"
set dop(lang.9.17) "numero del giono"
set dop(lang.9.18) "SINTASSI: AIUTO \[comando\]"
set dop(lang.9.19) "/msg « op <#canale> \[nome\] \[nome2\] ... \[nomeN\]"
set dop(lang.9.20) "Oppa una o piu persone nel tuo canale.Se nessun nome e specificato, e tu non sei oppato nel canale in questione vieni auamaticamente oppato, « Sei staa oppato."
set dop(lang.9.21) "/msg « deop <#canale> \[nome\] \[nome2\] ... \[nomeN\]"
set dop(lang.9.22) "Deoppa una o piu persone nel tuo canale. Se nessun  nome e specificato, e tu sei oppato nel canale, $botnick ti ha deoppato."
set dop(lang.9.23) "/msg « voice <#canale> \[nome\] \[nome2\] ... \[nomeN\]"
set dop(lang.9.24) "Da il voice a una o piu persone nel canale."
set dop(lang.9.25) "/msg « devoice <#canale> \[nome\] \[nome2\] ... \[nomeN\]"
set dop(lang.9.26) "aglie il voice a una o piu persone nel canale."
set dop(lang.9.27) "/msg « access <#canale> <utente> \[-min <livello>\] \[-max <livello>\]"
set dop(lang.9.28) "Può osservare in su il per di accesso una persona sicura o una stringa."
set dop(lang.9.29) "/msg « login <utente> <password>"
set dop(lang.9.30) "Vieni loggato nel bot."
set dop(lang.9.31) "/msg « dauth <utente> <password>"
set dop(lang.9.32) "Ti deintifichi dal bot."
set dop(lang.9.33) "/msg « help <comando>"
set dop(lang.9.34) "Visualizza un aiua per un determinaa comando ."
set dop(lang.9.35) "/msg « connesso"
set dop(lang.9.36) "Mostra « di attività."
set dop(lang.9.37) "/msg « verify <nome>"
set dop(lang.9.38) "Visualizza se una persona e loggata o no , E se lo e Mostra il nome utente"
set dop(lang.9.39) "e indica se e o no un Amministratore  pricipale del bot"
set dop(lang.9.40) "/msg « status <#canale>"
set dop(lang.9.41) "Mostra lo staa del canale"
set dop(lang.9.42) "/msg « inper <utente>"
set dop(lang.9.43) "Mostra le inpermazioni circa un utente come per esempio il suo nome e il utente@host se e attualmente collegaa, "
set dop(lang.9.44) "Il loo linguaggio e i settaggi di invisibile,inpermazioni sull'ultimo accesso. Se lo usi , ti mostra la lista completa "
set dop(lang.9.45) "dei canali dove stai chattando (Solo l'amministraae puo vedere cio,nessun 'altro utente )."
set dop(lang.9.46) "Se vuoi nascondere queste informazioni al pubblico , setta il  SET INVISIBLE comando (livello 0)."
set dop(lang.9.47) "/msg « SHOWCOMMANDS <#canale>"
set dop(lang.9.48) "Mostra i comandi che puoi usare nel canale scela."
set dop(lang.9.49) "/msg « ban <#canale> <nome|*!*utente@*.host> \[motivo\]"
set dop(lang.9.50) "Adds a specific *!*utente@*.host a the « banlist di your canale."
set dop(lang.9.51) "/msg « unban <#canale> <nome|*!*utente@*.host>"
set dop(lang.9.52) "Rimuove un  *!*utente@*.host dal $botnick lista dei ban del tuo canale and ogni altra corrispondenza dei ban nella lista."
set dop(lang.9.53) "/msg « apic <#canale> <apic>"
set dop(lang.9.54) "Makes « change l'intestazione del tuo canale."
set dop(lang.9.55) "/msg « clearmode <#canale>"
set dop(lang.9.56) "Cancella tutti i mode del canale. puo essere usaa per ripristinare i mode oiginali (set +i o +k senza la tua conoscenza)."
set dop(lang.9.57) "/msg « kick <#canale> <nome|pattern> \[motivo\]"
set dop(lang.9.58) "Makes « kick someone da your canale."
set dop(lang.9.59) "/msg « set <#canale> <variabile> <valore>"
set dop(lang.9.60) "/msg « set <variabile> <valore>"
set dop(lang.9.61) "Ciò regolerà una regolazione di cliente del utente del canale o."
set dop(lang.9.62) "Settaggi account utente: INVISIBLE LANG  - Lingua invisibile: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.9.63) "settaggi canale: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.9.64) "/msg « invite <#canale>"
set dop(lang.9.65) "Makes « invite you a your canale."
set dop(lang.9.66) "/msg « banlist <#canale>"
set dop(lang.9.67) "Mostra il banlist della scanalatura.  Questo ordine funziona se siete sulla scanalatura oppure no."
set dop(lang.9.68) "/msg « addutente <#canale> <utente> <accesso>"
set dop(lang.9.69) "Aggiunge un utente al userlist della scanalatura.  Non potete ADDUSER qualcuno con accesso uguale o più alto che il vostri propri."
set dop(lang.9.70) "/msg « remutente <#canale> <utente>"
set dop(lang.9.71) "Rimuove  un utente dal canale databcomee. Dovete avere più alto accesso che il utente che desiderate una rimozione."
set dop(lang.9.72) "/msg « modinfo <#canale> <accesso|automode> <utente> <valore>"
set dop(lang.9.73) "I seguenti ordini possono essere usati per fare i cambiamenti agli utenti attuali in userlist della vostra scanalatura."
set dop(lang.9.74) "Tu non puoi modificare qualcuno con un livello di accesso uguale o piu alto del tuo."
set dop(lang.9.75) "Con l'accesso variabile potete cambiare un livello di accesso degli utenti. La gamma è 1 il vostri propro livello - 1."
set dop(lang.9.76) "La variabile del automode vi non ne concede al modo stabilito, voce o op."
set dop(lang.9.77) "in bcomee a questo settaggio un utente puo essere voicizzato , quando esso entra nel canale."
set dop(lang.9.78) "** SUSPENDED ** - (livello «)"
set dop(lang.9.79) "Non puoi sospendere un  utente con livello uguale o piu alto del tuo."
set dop(lang.9.80) "/msg « showignore"
set dop(lang.9.81) "Visualizza «'ignore list. gli Ignore accadono quando qualcuno intenzionalmente fa flood accidentale o no «."
set dop(lang.9.82) "/msg « chaninper <#canale>"
set dop(lang.9.83) "Mostra se un canale e o no registrato e da chi."
set dop(lang.9.84) "/msg « motd"
set dop(lang.9.85) "Mostra « messaggio del giorno."
set dop(lang.9.86) "/msg « search <parametri di ricerca>"
set dop(lang.9.87) "Makes « elencano il canale dove i parametri di ricerca corrispondono alle chiavi  stabilite sul canale, se ce n'è."
set dop(lang.9.88) " non e richiesa l'uso dei metacaratteri."
set dop(lang.9.89) "Non e disponibile un aiua per questa comando."
set dop(lang.9.90) "SINTASSI: REMOVEALL <#canale>"
set dop(lang.9.91) "Spiacente, devi essere riconsciua per fare quesa comando."
set dop(lang.9.92) "Spiacente, Non hai abbastanza livello per eseguire quesa comando."
set dop(lang.9.93) "il canale « non sembra essere  registrato."
set dop(lang.9.94) "«!« (idenitficato come «) \[«\] e staa rimosso dagli accessi «."
set dop(lang.9.95) "Bene. Compresso « dati di accesso da «."
set dop(lang.9.96) "Gioni"
set dop(lang.9.97) "Tempo dall'attivazione"
set dop(lang.9.98) "canali"
set dop(lang.9.99) "Versione"
set dop(lang.9.100) "Bot linkaa"
set dop(lang.9.101) "SINTASSI: SHOWCOMMANDS <#canale>"
set dop(lang.9.102) "Livello"
set dop(lang.9.103) "SINTASSI: REGUSER <utente> <email>"
set dop(lang.9.104) "Non conosco chi sei  « tu."
set dop(lang.9.105) "« gia registrato."
set dop(lang.9.106) "Email nella blacklist: «"
set dop(lang.9.107) "SINTASSI: ADDIGNORE <host>"
set dop(lang.9.108) "«!« (idenitficato come «) \[«\] e stato aggiunto  alla lista degli ignore: «."
set dop(lang.9.109) "Ignora"
set dop(lang.9.110) "Aggiunto un ignore («)"
set dop(lang.9.111) "SINTASSI: REMIGNORE <host>"
set dop(lang.9.112) "«!« (idenitficato come «) \[«\] e stato rimosso dalla lista degli ignore: «."
set dop(lang.9.113) "Removed ignoe («)"
set dop(lang.9.114) "«!« (idenitficato come «) \[«\] sta attivando il jump verso: «."
set dop(lang.9.115) "No motivo"
set dop(lang.9.116) "«!« (idenitficato come «) \[«\] sta spegnendomi."
set dop(lang.9.117) "«!« (idenitficato come «) \[«\] sta vedendo la lista dei canali."
set dop(lang.9.118) "Il Bot non è entrato in nessun canale."
set dop(lang.9.119) "End di canale list"
set dop(lang.9.120) "SINTASSI: SAY <#canale> <msg>"
set dop(lang.9.121) "«!« (idenitficato come «) \[«\] is msging on «: «."
set dop(lang.9.122) "SINTASSI: BROADCcomeT <msg>"
set dop(lang.9.123) "«!« (idenitficato come «) \[«\] sta messagiando : «."
set dop(lang.9.124) "hai registrato l'utente: «. sul bot «. per avere il tuo nome utente, tu devi registrarlo. questa e la tua id di registrazione: «"
set dop(lang.9.125) "utentename"
set dop(lang.9.126) "SINTASSI: REGID <verify id>"
set dop(lang.9.127) "«!« (idenitficato come «) \[«\] sta rehcomehando la configurazione del bot."
set dop(lang.9.128) "canale, utente e file delle note ricaricato"
set dop(lang.9.129) "SINTASSI: ADDHAND <utente> <email>"
set dop(lang.9.130) "« e gia addato al bot."
set dop(lang.9.131) "«!« (identificato come «) \[«\] è aggiunto il nome utente: «."
set dop(lang.9.132) "Aggiunta hand «"
set dop(lang.9.133) "SINTASSI: CHANINFO <#canale>"
set dop(lang.9.134) "« è registrato da:"
set dop(lang.9.135) "- ultimo accesso: « fa"
set dop(lang.9.136) "« non sembra apparire come un utente con livello di accesso pari a 500."
set dop(lang.9.137) "«!« (idenitficato come «) \[«\] is looking at the utentename list."
set dop(lang.9.138) "- « (owner)"
set dop(lang.9.139) "- « (nomal utente)"
set dop(lang.9.140) "fine di  hand lista"
set dop(lang.9.141) "SINTASSI: REMHAND <utente>"
set dop(lang.9.142) "«!« (idenitficato come «) \[«\] sta rimovendo l'utente: «"
set dop(lang.9.143) "Rimozione hand «"
set dop(lang.9.144) "SINTASSI: REGISTER <#canale>"
set dop(lang.9.145) "« is already added."
set dop(lang.9.146) "«!« (idenitficato come «) \[«\] ha aggiunto il canale: «"
set dop(lang.9.147) "Aggiunto il canale «"
set dop(lang.9.148) "SINTASSI: PURGE <#canale>"
set dop(lang.9.149) "«!« (idenitficato come «) \[«\] e stato rimosso  dal canale: «"
set dop(lang.9.150) "Removed chan «"
set dop(lang.9.151) "« e un Bot di servizio ufficiale."
set dop(lang.9.152) "««  NON è loggato."
set dop(lang.9.153) "non vedo « da nesuna parte."
set dop(lang.9.154) "«« e un  Amminstratore ufficiale del bot loggato come «."
set dop(lang.9.155) "«« e loggato come «."
set dop(lang.9.156) "il tuo host non corrisponde a nulla che mi ricordi."
set dop(lang.9.157) "Type /msg « regid «"
set dop(lang.9.158) "tu non hai nessuna password settata."
set dop(lang.9.159) "AGGIUNTAHOST FALLITA come « (password non valida)"
set dop(lang.9.160) "Il tuo host e stato aggiunto come « (*!*«)"
set dop(lang.9.161) "SINTASSI: LOGIN <utente> <password>"
set dop(lang.9.162) "Mi spiace , tu sei gia autenticato come «"
set dop(lang.9.163) "AUTENTICAZIONE FALLITA come « (password non valida)"
set dop(lang.9.164) "«!« (idenitficato come «) \[«\] autorizzazione FALLITA."
set dop(lang.9.165) "AUTENTICAZIONE EFFETTUATA come «."
set dop(lang.9.166) "«!« (idenitficato come «) \[«\] e ora autenticato come creatore del bot."
set dop(lang.9.167) "SINTASSI: DAUTH <utente> <password>"
set dop(lang.9.168) "DEAUTENTICAZIONE FALLITA come « (password non valida)"
set dop(lang.9.169) "DEAUTENTICAZIONE EFFETTUATA come «."
set dop(lang.9.170) "SUSPENSION per « su « è attiva"
set dop(lang.9.171) "SINTASSI: SUSPEND <canale> <utente> \[livello\]"
set dop(lang.9.172) "SINTASSI: UNSUSPEND <canale> <utente>"
set dop(lang.9.173) "SINTASSI: ADDUSER <#canale> <utente> <accesso>"
set dop(lang.9.174) "« e gia stato aggiunto a « con il livello «."
set dop(lang.9.175) "Non puoi aggiungere un untente con livello di accesso uguale o piu alto di quello che hai ora."
set dop(lang.9.176) "Livello di accesso non valido."
set dop(lang.9.177) "Aggiunto l'utente « a « con livello di accesso «."
set dop(lang.9.178) "SINTASSI: REMUSER <#canale> <utente>"
set dop(lang.9.179) "« non sembra aver accesso a «"
set dop(lang.9.180) "l'utente e stato rimosso  « da «."
set dop(lang.9.181) "SINTASSI: MODINFO <#canale> \[ACCESS <utente> <livello>\] \[AUTOMODE <utente> <NONE|OP|VOICE>\]"
set dop(lang.9.182) "Modificaa « livello di accesso al canale da « a «."
set dop(lang.9.183) "Set AUTOMODE a OP per « on canale «"
set dop(lang.9.184) "Set AUTOMODE a VOICE per « on canale «"
set dop(lang.9.185) "Set AUTOMODE a NONE per « on canale «"
set dop(lang.9.186) "SINTASSI: SET \[#canale\] <variabile> <valore> o, SET <invisible> <ON|OFF>, SET <lang> <lingua numero>"
set dop(lang.9.187) "il tuo settaggio di INVISIBLE e ora ON."
set dop(lang.9.188) "il tuo settaggio di INVISIBLE e ora OFF."
set dop(lang.9.189) "valore di INVISIBLE deve essere ON o OFF"
set dop(lang.9.190) "la tua  LANG e settata ora «."
set dop(lang.9.191) "il nr della lingua deve essere tra  1 e «."
set dop(lang.9.192) "« per « e: «"
set dop(lang.9.193) "il valore di AUTOTOPIC deve essere ON o OFF"
set dop(lang.9.194) "il valore di NOOP deve essere ON o OFF"
set dop(lang.9.195) "« per « is cleared."
set dop(lang.9.196) "il  valore di STRICTOP deve essere ON o OFF"
set dop(lang.9.197) "SINTASSI: INVITE <#canale>"
set dop(lang.9.198) "Mi spiace, tu sei gia on «."
set dop(lang.9.199) "SINTASSI: OP <#canale> \[nome\] \[nome\] .."
set dop(lang.9.200) "la NOOP flag è settata on «"
set dop(lang.9.201) "SINTASSI: DEOP <#canale> \[nome\] \[nome\] .."
set dop(lang.9.202) "I don't think « would appreciate that."
set dop(lang.9.203) "SINTASSI: VOICE <#canale> \[nome\] \[nome\] .."
set dop(lang.9.204) "SINTASSI: DEVOICE <#canale> \[nome\] \[nome\] .."
set dop(lang.9.205) "SINTASSI: BAN <#canale> <nome | *!*utente@*.host> \[attività\] \[motivo\]"
set dop(lang.9.206) "SINTASSI: KICK <#canale> <nome> <motivo>"
set dop(lang.9.207) "SINTASSI: aPIC <#canale> <apic>"
set dop(lang.9.208) "SINTASSI: UNBAN <#canale> <*!*utente@*.host>"
set dop(lang.9.209) "Trovaa rimosso 1 bannato «"
set dop(lang.9.210) "SINTASSI: BANLIST <#canale>"
set dop(lang.9.211) "-« by «"
set dop(lang.9.212) "Fine della lista dei bannati"
set dop(lang.9.213) "SINTASSI: INFO <utente>"
set dop(lang.9.214) "Impossibile vedere il dettaglio dell'utente (Invisibile)"
set dop(lang.9.215) "Inpermazione circa: «"
set dop(lang.9.216) "Correntemente loggato come:"
set dop(lang.9.217) "OFFLINE"
set dop(lang.9.218) "INVISIBLE è «"
set dop(lang.9.219) "canali"
set dop(lang.9.220) "SINTASSI: ACCESS <#canale> <utente> \[-min <livello>\] \[-max <livello>\]"
set dop(lang.9.221) "Livello minimo non valido."
set dop(lang.9.222) "Livello massimo non valido."
set dop(lang.9.223) "utente: « ACCESS: « «"
set dop(lang.9.224) "canale: « -- AUTOMODE: «"
set dop(lang.9.225) "ultimo accesso: « ago."
set dop(lang.9.226) "Nessuna corispondenza!"
set dop(lang.9.227) "Fine della lista accessi"
set dop(lang.9.228) "SINTASSI: STATU <#canale>"
set dop(lang.9.229) "Il Canale « ha « utenti (« oppati)"
set dop(lang.9.230) "I Modi sono: «"
set dop(lang.9.231) "Io sono attualmente nel canale."
set dop(lang.9.232) "Settaggi flood"
set dop(lang.9.233) "Le bandierine si sono regolate"
set dop(lang.9.234) "Lista utenti Ignoati:"
set dop(lang.9.235) "Fine della lista degli utenti Ignoati"
set dop(lang.9.236) "Sono state trovate piu di 10 corispondenze \[«\]"
set dop(lang.9.237) "Per favore restringi la tua maschera di ricerca"
set dop(lang.9.238) "Nessuna corispondenza trovata per \[«\]"
set dop(lang.9.239) "SINTASSI: CLEARMODE <#canale>"
set dop(lang.9.240) "Nessun utente scaduto."
set dop(lang.9.241) "Nome del Bot"
set dop(lang.9.242) "«« e il Manager Ufficiale del bot e è loggato come «."
set dop(lang.9.243) "«« e il Creatore Ufficiale del bot e è loggato come «."
set dop(lang.9.244) "Ci è già un padrone su questa scanalatura."
set dop(lang.9.245) "Registratione email per « con una richesta di conferma e stata inviata «."
set dop(lang.9.246) "AUTENTICAZIONE FALLITA come «. (Raggiuna il nr massimo di login per utente)."
set dop(lang.9.247) "Sessioni attuali: «"
set dop(lang.9.248) "« non e loggato."
set dop(lang.9.249) "utente: « registrato con la seguente email: «"
set dop(lang.9.250) "tu puoi scrivere /msg « pass « <tua password> e ora attiva!"
set dop(lang.9.251) "Numero di registrazione non trovata!"
set dop(lang.9.252) "SINTASSI: PcomeS <utente> <password>"
set dop(lang.9.253) "CAMBIAMENTO PASSWORD FALLITA come « (password sbagliata)"
set dop(lang.9.254) "La password deve essere piu lunga di « lettere."
set dop(lang.9.255) "password set a: «"
set dop(lang.9.256) "password gia settata.. Usa /msg « pass <vecchia password> <nuova password>"
set dop(lang.9.257) "Email:"
set dop(lang.9.258) "Non Verificaa (Aggiunto dal «)"
set dop(lang.9.259) "Non avete registrato il vostro regid ancora!"
set dop(lang.9.260) "SINTASSI: JOIN <canale>"
set dop(lang.9.261) "SINTASSI: PART <canale>"
set dop(lang.9.262) "At the request di «"
set dop(lang.9.263) "io non sono in quesa canale."
set dop(lang.9.264) "Il tuo accesso « e stato cancellato."
set dop(lang.9.265) "SUSPENSION per « su « e cancellata"
set dop(lang.9.266) "Non puoi SUSPEND o DESUSPEND una persona con un livello di accesso piu ala o uguale al tuo."
set dop(lang.9.267) "/msg « join <#canale>"
set dop(lang.9.268) "Genera « l'entrata nel canale indicato."
set dop(lang.9.269) "/msg « part <#canale>"
set dop(lang.9.270) "Genera « luscita dal canale indicato."
set dop(lang.9.271) "/msg « suspend <#canale> <utente> \[livello\]"
set dop(lang.9.272) "Sospende dall'accesso un utente « sulla tua lista utenti per il livello che e staa preso."
set dop(lang.9.273) "Se un livello non e specificato, il livello di base e usato."
set dop(lang.9.274) "Tu puoi SUSPEND qualcuno che abbia un livello di accesso piu basso  del tuo."
set dop(lang.9.275) "/msg « unsuspend <#canale> <utente>"
set dop(lang.9.276) "Desospende dall'accesso un utente  « sulla tua lista utenti dei canali. "
set dop(lang.9.277) "Tu puoi  DESUSPEND qualcuno che abbia un livello di accesso piu basso del tuo,"
set dop(lang.9.278) "a condizione che il livello della sospensione è inoltre di meno che il uguale della o un il vostro proprio livello di accesso."
set dop(lang.9.279) "/msg « REGUSER <utente> <valid email>"
set dop(lang.9.280) "Crea un utente valido , e viene controllata la veridicità della mail."
set dop(lang.9.281) "/msg « regid <id di autenticazione>"
set dop(lang.9.282) "Rende il tuo nome utente usabile."
set dop(lang.9.283) "/msg « pass <utente> <password>"
set dop(lang.9.284) "Serve per settare la tua parola chiave."
set dop(lang.9.285) "Nome canale non valido."
set dop(lang.9.286) "Aggiuna il ban « a «."
set dop(lang.9.287) "il valore di  FLOATLIM deve essere ON oppure OFF"
set dop(lang.9.288) "Invalido floating-limit Margin (2-20 permesso)."
set dop(lang.9.289) "Invalido floating-limit max (0-65536 permesso)."
set dop(lang.9.290) "Invalido floating-limit period (20-200 permesso)."
set dop(lang.9.291) "Invalido floating-grace setting (0-19 permesso)."
set dop(lang.9.292) "SYNTAX: CYCLE <#canale>"
set dop(lang.9.293) "SYNTAX: ACTION <#canale> <azione/messaggio>"
set dop(lang.9.294) "«!« (autenticato  come «) \[«\] incitilo a fare un'azione sopra «: «"
set dop(lang.9.295) "/msg « cicli <#canale>"
set dop(lang.9.296) "creati « cicli nel tuo canale."
set dop(lang.9.297) "« per « minuti."
set dop(lang.9.298) "« per sempre"
set dop(lang.9.299) "LAST LOG: «"
set dop(lang.9.298) "Connesso via « dal «"
set dop(lang.9.299) "questa e-mail ha una sintassi invalida. (..@..)"

#Turkish
set dop(lang.10.1) "Kullanýcý Listesi Sona Erdi:"
set dop(lang.10.2) "Asla"
set dop(lang.10.3) "KULLANICI -- « -- Son Görüþ: «"
set dop(lang.10.4) "evet"
set dop(lang.10.5) "hayýr"
set dop(lang.10.6) "Host"
set dop(lang.10.7) "Tanýmlandý"
set dop(lang.10.8) "Lisan"
set dop(lang.10.9) "Son Görüþ"
set dop(lang.10.10) "Eriþim"
set dop(lang.10.11) "Eriþim Yok"
set dop(lang.10.12) "Site"
set dop(lang.10.13) "Taným"
set dop(lang.10.14) "Anahtar"
set dop(lang.10.15) "Rumuz"
set dop(lang.10.16) "DCC komutlarýnýn listesi"
set dop(lang.10.17) "Günün Toplamý"
set dop(lang.10.18) "SYNTAX: HELP \[komut\]"
set dop(lang.10.19) "/msg « op <#kanal> \[rumuz\] \[rumuz2\] ... \[rumuzN\]"
set dop(lang.10.20) "Kanalýnýzdaki bir veya daha fazla kiþiye operatörlük verir. Eðer hiçbir rumuz yazýlmaz ve sizde kanalda operatör deðilseniz, « size operatorlük verir."
set dop(lang.10.21) "/msg « deop <#kanal> \[rumuz\] \[rumuz2\] ... \[rumuzN\]"
set dop(lang.10.22) "Kanalýnýzdaki bir ya da daha fazla kiþinin operatörlüðünü alýr. Eðer hiçbir rumuz belirtilmezse, ve siz kanalda operatör iseniz, $botnick sizin operatörlüðünüzü alýr."
set dop(lang.10.23) "/msg « voice <#kanal> \[rumuz\] \[rumuz2\] ... \[rumuzN\]"
set dop(lang.10.24) "Kanalýnýzda bir ya da daha fazla kiþiye söz hakký verir."
set dop(lang.10.25) "/msg « devoice <#kanal> \[rumuz\] \[rumuz2\] ... \[rumuzN\]"
set dop(lang.10.26) "Kanalýnýzda bir ya da daha fazla kiþiden söz hakkýný alýr."
set dop(lang.10.27) "/msg « access <#kanal> <kullanýcý_adý> \[-min <level>\] \[-max <level>\]"
set dop(lang.10.28) "Belirli kullanýcý ya da dizgi için eriþime bakar."
set dop(lang.10.29) "/msg « login <kullanýcý_adý> <þifre>"
set dop(lang.10.30) "Eriþim listelenmenizi hafýzaya alýrken, eþzamanlý olarak, eriþimli olduðunuz tüm kanallarda tanýmlanmanýzý saðlar."
set dop(lang.10.31) "/msg « dauth <kullanýcý_adý> <þifre>"
set dop(lang.10.32) "Çýkýþ yapýn."
set dop(lang.10.33) "/msg « help <komut>"
set dop(lang.10.34) "Verilen komut için yardým bilgilerini görüntüler."
set dop(lang.10.35) "/msg « uptime"
set dop(lang.10.36) "«'un baðlantý zamanýný gösterir."
set dop(lang.10.37) "/msg « verify <rumuz>"
set dop(lang.10.38) "Bir kiþinin, resmi bir yönetici ya da temsilci olup olmadýðýný"
set dop(lang.10.39) "ve eðer tanýmlanmýþsa, kullanýcý adýný bildirir."
set dop(lang.10.40) "/msg « status <#kanal>"
set dop(lang.10.41) "Kanalýn durumunu gösterir."
set dop(lang.10.42) "/msg « info <kullanýcý_adý>"
set dop(lang.10.43) "Kullanýcý adý için, eðer IRC'ye baðli ise,rumuzunu ve user@host'unu, lisan seçeneðini,"
set dop(lang.10.44) "son görülme bilgilerini ve eðer bir Yönetici tarafýndan yetkisinin askýya alýnýp alýnmadýðýný(suspend) bildirir."
set dop(lang.10.45) "Eðer bu komutu kendi kendiniz üzerinde kullanýrsanýz ayný zamanda yetkiniz olan kanallarýda listeler(Bu bilgi sadece siz ve Yönetici'ler tarafýndan görülebilir, Diðer kullanýcýlar tarafýndan deðil.)"
set dop(lang.10.46) "Eðer bu bilgilerin herkese açýk olmasýný istemiyorsanýz; INVISIBLE (seviye 0) komutuna baþvurunuz."
set dop(lang.10.47) "/msg « showcommands <#kanal>"
set dop(lang.10.48) "Eriþim seviyenize göre, kanalda kullanabilceðiniz tüm komutlarý listeler. Eðer hiçbir kanal belirtilmezse, sadece 0 erisim komutlarý görüntülenir."
set dop(lang.10.49) "/msg « ban <#kanal> <rumuz|*!*user@*.host> \[sebep\]"
set dop(lang.10.50) "Kanalýnýzýn yasaklýlar listesine belirli bir *!*user@*.host ekler."
set dop(lang.10.51) "/msg « unban <#kanal> <rumuz|*!*user@*.host>"
set dop(lang.10.52) "*!*user@*.host deðerliðini ve diðer benzer yasaklamalarý, kanal yasaklýlar listenizden çýkarýr. Ancak kendi seviyenize eþit ya da daha düþük olan yasaklamalarý, $botnick'in yasaklýlar listesinden çýkarabilirsiniz."
set dop(lang.10.53) "/msg « topic <#kanal> <baþlýk>"
set dop(lang.10.54) "Kanal baþlýðýný, baþlýk baþlangýcýna, parantez içerisinde kullanýcý adýnýzý barýndýrarak deðiþtirecektir (en fazla 145 karakter)."
set dop(lang.10.55) "/msg « clearmode <#kanal>"
set dop(lang.10.56) "Tum kanal modlarýný temizler. Kanalýnýz kilitlendiði zaman kullanabilirsiniz (bilginiz olmadan +i ya da +k konulmasý gibi)."
set dop(lang.10.57) "/msg « kick <#kanal> <rumuz|örnek> \[sebep\]"
set dop(lang.10.58) "Kanalýnýzdan bir kiþiyi atmanýzý saðlar; sebep opsiyoneldir. Rumuzunuz sebep içerisine eklenecektir."
set dop(lang.10.59) "/msg « set <#kanal> <deðiþken> <deðer>"
set dop(lang.10.60) "/msg « set <deðiþken> <deðer>"
set dop(lang.10.61) "Bu, bir kanal veya kullanýcýnýn hesabýný ayarlamaya yarar."
set dop(lang.10.62) "Useraccount settings: INVISIBLE LANG  - Lang available: 1->English 2->Francais 3->Romanian 4->Magyar 5->Svenska 6->Español 7->Norsk 8->Dansk 9->Italiano 10->Turkish"
set dop(lang.10.63) "Kanal ayarlarý: CHAN-FLOOD DEOP-FLOOD KICK-FLOOD JOIN-FLOOD MSG-FLOOD STRICTOP URL DESCRIPTION KEYWORDS MODE NOOP"
set dop(lang.10.64) "/msg « invite <#kanal>"
set dop(lang.10.65) "«'in sizi kanalýnýza davet etmesini saðlar."
set dop(lang.10.66) "/msg « banlist <#kanal>"
set dop(lang.10.67) "Kanal yasaklýlar listesini gösterir. Bu komut kanalda olsanýz da olmasanýz da çalýþýr."
set dop(lang.10.68) "/msg « adduser <#kanal> <kullanýcý_adý> <eriþim>"
set dop(lang.10.69) "Kanal eriþim listesine yeni bir kullanýcý ekler. Kendi eriþim seviyenize eþit ya da büyük bir deðerle ekleme YAPAMAZSINIZ."
set dop(lang.10.70) "/msg « remuser <#kanal> <kullanýcý_adý>"
set dop(lang.10.71) "Bir kullanýcýyý yetki veri bankasýndan silmeyi saðlar. Kendilerini silmek isteyen kanal sahipleri için, kanallarýný kapattýrmalarý gereklidir."
set dop(lang.10.72) "/msg « modinfo <#kanal> <access|automode> <kullanýcý_adý> <deðer>"
set dop(lang.10.73) "Bu komutlar, kanalýnýzýn kullanýcý listesinde deðiþiklik yapmak için kullanýlýr."
set dop(lang.10.74) "Sizden daha yüksek seviyedeki birinin eriþimini düzenleyemezsiniz."
set dop(lang.10.75) "Eriþim seviyenizle bir kullanýcýnýn eriþimini deðiþtirebilirsiniz. 1 den kendi seviyenize kadar düzenleyebilirsiniz."
set dop(lang.10.76) "Automode özelliði ile modunuzu op / voice veya none olarak ayarlayabilirsiniz."
set dop(lang.10.77) "Bu, sizin kanala girdiðinizde otomatik olarak op / voice almanýzý veya none durmanýzý saðlar."
set dop(lang.10.78) "** ASKIYA ALINMIÞ ** - (Seviye «)"
set dop(lang.10.79) "Kendi eriþim seviyenize eþit ya da büyük eriþimleri askýya alamazsýnýz."
set dop(lang.10.80) "/msg « showignore"
set dop(lang.10.81) "«'in komutlarýna aldýrmadýðý kiþilerin listesini gösterir. \"komutlara aldýrmama iþlemi\" bir kiþinin isteyerek ya da kaza ile «'e aþýrý komut gönderimi yapmasýyla gerçekleþir."
set dop(lang.10.82) "/msg « chaninfo <#kanal>"
set dop(lang.10.83) "Bir kanalýn kayýtlý olup olmadýðýný gösterir."
set dop(lang.10.84) "/msg « motd"
set dop(lang.10.85) "«'in günün mesajýný görüntüler.."
set dop(lang.10.86) "/msg « search <arama parametresi>"
set dop(lang.10.87) "Verdiðiniz ve bir kanal için nitelendirilmiþ arama parametrelerinin, eðer varsa, bulunduðu kanallarý listeler."
set dop(lang.10.88) "Wildcard kullanýlýþý gerekli deðildir."
set dop(lang.10.89) "Bu konuda yardým bulunamadý."
set dop(lang.10.90) "SYNTAX: REMOVEALL <#kanal>"
set dop(lang.10.91) "Üzgünüm, bu komutu uygulamak için login olmanýz gerekir."
set dop(lang.10.92) "Üzgünüm, o komutu uygulamak için yeterli eriþiminiz yok."
set dop(lang.10.93) "« kanalý kayýtlý olarak gözükmüyor."
set dop(lang.10.94) "«!« (« tarafýndan) \[«\] « kanalýndaki tüm kayýtlar silindi."
set dop(lang.10.95) "Bitti. « giriþlerin kayýt edildiði yer «."
set dop(lang.10.96) "gün"
set dop(lang.10.97) "Uptime"
set dop(lang.10.98) "Kanallar"
set dop(lang.10.99) "Version"
set dop(lang.10.100) "Bot Link Edildi."
set dop(lang.10.101) "SYNTAX: SHOWCOMMANDS <#kanal>"
set dop(lang.10.102) "Eriþim"
set dop(lang.10.103) "SYNTAX: REGUSER <kullanýcý_adý> <email>"
set dop(lang.10.104) "« kimdir bilmiyorum."
set dop(lang.10.105) "« zaten kayýtlý."
set dop(lang.10.106) "Email karalistede: «"
set dop(lang.10.107) "SYNTAX: ADDIGNORE <host>"
set dop(lang.10.108) "«!« (« tarafýndan) \[«\] yasaklama listesine eklendi: «."
set dop(lang.10.109) "Yasaklandý"
set dop(lang.10.110) "Yasaklama eklendi («)"
set dop(lang.10.111) "SYNTAX: REMIGNORE <host>"
set dop(lang.10.112) "«!« (« tarafýndan) \[«\] yasaklama listesinden silindi: «."
set dop(lang.10.113) "Yasaklama silindi («)"
set dop(lang.10.114) "«!« (« tarafýndan) \[«\] bot atlýyor: «."
set dop(lang.10.115) "Sebep Yok"
set dop(lang.10.116) "«!« (« tarafýndan) \[«\] beni kapattý."
set dop(lang.10.117) "«!« (« tarafýndan) \[«\] kanal listesine bakýlýyor."
set dop(lang.10.118) "Bot ile hiçbir kanala girilmedi."
set dop(lang.10.119) "Kanal listesinin sonu"
set dop(lang.10.120) "SYNTAX: SAY <#kanal> <msg>"
set dop(lang.10.121) "«!« (« tarafýndan) \[«\] msg yazýlýyor «: «."
set dop(lang.10.122) "SYNTAX: BROADCAST <msg>"
set dop(lang.10.123) "«!« (« tarafýndan) \[«\] yayýnlanýyor: «."
set dop(lang.10.124) "Kayýt ettiðin Username: «. Bot: «. Username için kayýda sahipsin. Kayýt numarasý: «"
set dop(lang.10.125) "Kullanýcý Adý"
set dop(lang.10.126) "SYNTAX: REGID <verify id>"
set dop(lang.10.127) "«!« (« tarafýndan) \[«\] bot yeniden çalýþtýrýlýyor."
set dop(lang.10.128) "Kanal, Kullanýcý ve Not dosyalarý yeniden çalýþtýrýldý"
set dop(lang.10.129) "SYNTAX: ADDHAND <kullanýcý_adý> <email>"
set dop(lang.10.130) "« botta zaten kayýtlý."
set dop(lang.10.131) "«!« (« tarafýndan) \[«\] kullanýcý adý ekleniyor: «."
set dop(lang.10.132) "« kullanýcý adý eklendi"
set dop(lang.10.133) "SYNTAX: CHANINFO <#kanal>"
set dop(lang.10.134) "« kanalýný kayýt ettirmiþ olan:"
set dop(lang.10.135) "- son görüþ: « önce"
set dop(lang.10.136) "« kanalýnda 500 seviyeli accessi olan bir kullanýcý gözükmüyor"
set dop(lang.10.137) "«!« (« tarafýndan) \[«\] kullanýcý adý listesine bakýlýyor."
set dop(lang.10.138) "- « (owner)"
set dop(lang.10.139) "- « (normal user)"
set dop(lang.10.140) "Yönetim listesinin sonu"
set dop(lang.10.141) "SYNTAX: REMHAND <kullanýcý_adý>"
set dop(lang.10.142) "«!« (« tarafýndan) \[«\] kullanýcý adý siliniyor: «"
set dop(lang.10.143) "« kullanýcý adý silindi"
set dop(lang.10.144) "SYNTAX: REGISTER <#kanal>"
set dop(lang.10.145) "« zaten kayýtlý."
set dop(lang.10.146) "«!« (« tarafýndan) \[«\] kanal ekleniyor: «"
set dop(lang.10.147) "« kanalý eklendi"
set dop(lang.10.148) "SYNTAX: PURGE <#kanal>"
set dop(lang.10.149) "«!« (« tarafýndan) \[«\] kanal siliniyor: «"
set dop(lang.10.150) "« kanalý silindi"
set dop(lang.10.151) "« Resmi bir Servis Robotu."
set dop(lang.10.152) "«« tanýmlanmamýþ durumda."
set dop(lang.10.153) "« hiçbir yerde görünmüyor"
set dop(lang.10.154) "«« Resmi bir Yönetici ve « olarak tanýmlý"
set dop(lang.10.155) "«« olarak tanýmlý"
set dop(lang.10.156) "Hostunuz baþka bir kullanýcýmýzda da bulunuyor."
set dop(lang.10.157) "Çeþit: /msg « regid «"
set dop(lang.10.158) "Henüz belirlenmiþ bir þifreniz yok."
set dop(lang.10.159) "HOST Ekleme Baþarýsýz « (Geçersiz Þifre)"
set dop(lang.10.160) "Hostun Eklendi « (*!*«)"
set dop(lang.10.161) "SYNTAX: LOGIN <kullanýcý_adý> <þifre>"
set dop(lang.10.162) "Üzgünüm, « olarak zaten tanýmlýsýnýz."
set dop(lang.10.163) "« kanalýnda TANIMLAMA BAÞARISIZ (Geçersiz Þifre)"
set dop(lang.10.164) "«!« (« tarafýndan) \[«\] tanýmlama BAÞARISIZ."
set dop(lang.10.165) "« olarak TANIMLAMA BAÞARILI"
set dop(lang.10.166) "«!« (« tarafýndan) \[«\] þimdi bot sahibi olarak tanýmlandý."
set dop(lang.10.167) "SYNTAX: DAUTH <kullanýcý_adý> <þifre>"
set dop(lang.10.168) "« kanalýnda TANIMSIZLIK BAÞARISIZ (Geçersiz Þifre)"
set dop(lang.10.169) "« olarak TANIMSIZLIK BAÞARILI"
set dop(lang.10.170) "« için ASKIYA ALMA « kanalýnda aktif"
set dop(lang.10.171) "SYNTAX: SUSPEND <#kanal> <kullanýcý> \[seviye\]"
set dop(lang.10.172) "SYNTAX: UNSUSPEND <#kanal> <kullanýcý>"
set dop(lang.10.173) "SYNTAX: ADDUSER <#kanal> <kullanýcý_adý> <eriþim>"
set dop(lang.10.174) "« zaten « kanalýnda « eriþim seviyesi ile eklenmiþ."
set dop(lang.10.175) "Sizikine eþit ya da yüksek seviye ile kullanýcý ekleyemezsiniz."
set dop(lang.10.176) "Geçersiz eriþim seviyesi."
set dop(lang.10.177) "« kullanýcýsý « kanalýnda « eriþim seviyesi ile eklendi."
set dop(lang.10.178) "SYNTAX: REMUSER <#kanal> <kullanýcý_adý>"
set dop(lang.10.179) "« « kanalýnda eriþimli gözükmüyor."
set dop(lang.10.180) "« kullanýcýsý « kanalýnda silindi."
set dop(lang.10.181) "SYNTAX: MODINFO <#kanal> \[ACCESS <username> <level>\] \[AUTOMODE <username> <NONE|OP|VOICE>\]"
set dop(lang.10.182) "« icin eriþim seviyesi « kanalýnda « olarak deðiþtirildi."
set dop(lang.10.183) "« kullanýcý adý için « kanalýnda otomatik operatörlük verildi"
set dop(lang.10.184) "« kullanýcý adý için « kanalýnda otomatik konuþma verildi"
set dop(lang.10.185) "« kullanýcý adý için « kanalýnda otomatik seçeneði kaldýrýldý"
set dop(lang.10.186) "SYNTAX: SET \[#kanal\] <variable> <value> or, SET <invisible> <ON|OFF>, SET <lang> <language number>"
set dop(lang.10.187) "GÖRÜNMEZLÝK ayarýnýz açýldý."
set dop(lang.10.188) "GÖRÜNMEZLÝK ayarýnýz kapatýldý."
set dop(lang.10.189) "INVISIBLE için deðer ON ya da OFF olmalý"
set dop(lang.10.190) "Lisanýn þimdi: «."
set dop(lang.10.191) "Lisan numarasý 1 ya da « olmalý."
set dop(lang.10.192) "« için « is: «"
set dop(lang.10.193) "AUTOTOPIC için deðer ON ya da OFF olmalý"
set dop(lang.10.194) "NOOP için deðer ON ya da OFF olmalý"
set dop(lang.10.195) "« için « temizlendi."
set dop(lang.10.196) "STRICTOP için deðer ON ya da OFF olmalý"
set dop(lang.10.197) "SYNTAX: INVITE <#kanal>"
set dop(lang.10.198) "Üzgünüm, zaten « kanalýndasýn."
set dop(lang.10.199) "SYNTAX: OP <#kanal> \[rumuz\] \[rumuz\] .."
set dop(lang.10.200) "NOOP « için ON"
set dop(lang.10.201) "SYNTAX: DEOP <#kanal> \[rumuz\] \[rumuz\] .."
set dop(lang.10.202) "«'nin kabul olacaðýný sanmýyorum."
set dop(lang.10.203) "SYNTAX: VOICE <#kanal> \[rumuz\] \[rumuz\] .."
set dop(lang.10.204) "SYNTAX: DEVOICE <#kanal> \[rumuz\] \[rumuz\] .."
set dop(lang.10.205) "SYNTAX: BAN <#kanal> <rumuz | *!*user@*.host> \[lifetime\] \[sebep\]"
set dop(lang.10.206) "SYNTAX: KICK <#kanal> <rumuz> <sebep>"
set dop(lang.10.207) "SYNTAX: TOPIC <#kanal> <baþlýk>"
set dop(lang.10.208) "SYNTAX: UNBAN <#kanal> <*!*user@*.host>"
set dop(lang.10.209) "« tane « ile eþleþen yasaklama silindi"
set dop(lang.10.210) "SYNTAX: BANLIST <#kanal>"
set dop(lang.10.211) "-« by «"
set dop(lang.10.212) "Ban listesi sonu"
set dop(lang.10.213) "SYNTAX: INFO <kullanýcý_adý>"
set dop(lang.10.214) "Kullanýcý detaylarý listelenemedi (Görünmez)"
set dop(lang.10.215) "Hakkýnda bilgiler: «"
set dop(lang.10.216) "Currently logged on via:"
set dop(lang.10.217) "OFFLINE"
set dop(lang.10.218) "INVISIBLE is «"
set dop(lang.10.219) "Kanallar"
set dop(lang.10.220) "SYNTAX: ACCESS <#kanal> <username> \[-min <seviye>\] \[-max <seviye>\]"
set dop(lang.10.221) "Geçersiz en düþük eriþim."
set dop(lang.10.222) "Geçersiz en yüksek eriþim."
set dop(lang.10.223) "KULLANICI: « ERÝÞÝM: « «"
set dop(lang.10.224) "KANAL: « -- OTOMOD: «"
set dop(lang.10.225) "SON GÖRÜÞ: « önce."
set dop(lang.10.226) "Eþleþme Yok!"
set dop(lang.10.227) "Eriþim listesi sonu"
set dop(lang.10.228) "SYNTAX: STATUS <#kanal>"
set dop(lang.10.229) "« kanalýnda « tane kullanýcý var (« operatör)"
set dop(lang.10.230) "Mod: «"
set dop(lang.10.231) "Kanal zaten mevcut."
set dop(lang.10.232) "Flood ayarý"
set dop(lang.10.233) "Flags set"
set dop(lang.10.234) "Yasaklama listesi:"
set dop(lang.10.235) "Yasaklama listesi sonu"
set dop(lang.10.236) "10'dan fazla eþleþen giriþ var. \[«\]"
set dop(lang.10.237) "Lütfen soruyu sýnýrlandýrýn."
set dop(lang.10.238) "\[«\] için geçerli eþleþme yok"
set dop(lang.10.239) "SYNTAX: CLEARMODE <#kanal>"
set dop(lang.10.240) "Sona eren kullanýcý yok."
set dop(lang.10.241) "Bot rumuz"
set dop(lang.10.242) "«« Resmi bir Bot Yoneticisi ve « olarak tanýmlý."
set dop(lang.10.243) "«« Resmi bir Bot Sahibi ve « olarak tanýmlý."
set dop(lang.10.244) "Bu kanalýn zaten bir sahibi var."
set dop(lang.10.245) "« kullanýcý adýnýn onaylanmasý için bilgi « E-mail adresine yollanmýþtýr."
set dop(lang.10.246) "« kanalýnda TANIMLAMA BAÞARISIZ. (Maximum geçersiz taným)."
set dop(lang.10.247) "Mevcut oturumlar: «"
set dop(lang.10.248) "« tanýmlanmamýþ durumda."
set dop(lang.10.249) "Kullanýcý Adý: «. « E-maili ile kayýt edildi."
set dop(lang.10.250) "Þimdi /msg « pass « <senin_þifren> yazýn!"
set dop(lang.10.251) "Kayýt numarasý bulunamadý!"
set dop(lang.10.252) "SYNTAX: PASS <kullanýcý_adý> <þifre>"
set dop(lang.10.253) "PASS deðiþimi baþarýsýz « (Geçersiz Þifre)"
set dop(lang.10.254) "Þifre « harflerinden daha uzun olmalýdýr."
set dop(lang.10.255) "Þifre belirlendi: «"
set dop(lang.10.256) "Þifre girilmiþ.. Kullaným /msg « pass <eski_þifre> <yeni_þifre>"
set dop(lang.10.257) "Email:"
set dop(lang.10.258) "Tanýmlanmadý («'den itibaren eklendi)"
set dop(lang.10.259) "Henüz kullanýcýnýzý kayýt etmediniz!"
set dop(lang.10.260) "SYNTAX: JOIN <#kanal>"
set dop(lang.10.261) "SYNTAX: PART <#kanal>"
set dop(lang.10.262) "At the request of «"
set dop(lang.10.263) "Bu kanalda deðilim."
set dop(lang.10.264) "« kanalýndaki eriþiminiz askýya alýnmýþtýr."
set dop(lang.10.265) "« için « kanalýndaki askýya alma iptal edildi."
set dop(lang.10.266) "Kendi eriþim seviyenize eþit ya da büyük eriþimli kiþinin askýya alinmasini iptal edemezsiniz"
set dop(lang.10.267) "/msg « join <#kanal>"
set dop(lang.10.268) "Kanalýnýza «'in katýlmasýný saðlar."
set dop(lang.10.269) "/msg « part <#kanal>"
set dop(lang.10.270) "«'in kanaldan ayrýlmasýný saðlar."
set dop(lang.10.271) "/msg « suspend <#kanal> <kullanýcý_adý> \[seviye\]"
set dop(lang.10.272) "Belirtilen süre boyunca, kiþinin, kanalýnýzda «'e olan eriþimini askýya alýr."
set dop(lang.10.273) "Eðer hiçbir seviye belirtilmezse, standart eriþim askýya alma seviyesi komutu kullanan kiþinin seviyesi kadardýr."
set dop(lang.10.274) "Yalnýzca kendi eriþim seviyenizden daha düþük olan kiþilere uygulayabilirsiniz."
set dop(lang.10.275) "/msg « unsuspend <#kanal> <kullanýcý_adý>"
set dop(lang.10.276) "Kanalýzda eriþim listesinde bulunan kiþinin, eriþiminin askýya alýnma durumunu iptal eder."
set dop(lang.10.277) "Kendinizden düþük eriþimdeki kimseye uygulayabilirsiniz,"
set dop(lang.10.278) "Ayrýca askýya alma seviyesininde sizin seviyenize eþit yada daha az olmasý gerekmektedir."
set dop(lang.10.279) "/msg « reguser <kullanýcý_adý> <geçerli email>"
set dop(lang.10.280) "Bir Kullanýcý Adý yaratýn. Bu, e-postanýzýn doðruluðunu gösterecektir."
set dop(lang.10.281) "/msg « regid <tanýmlama_kimliði>"
set dop(lang.10.282) "Kullanýcý adýnýzý kullanýþlý yaratýn"
set dop(lang.10.283) "/msg « pass <kullanýcý_adý> <þifre>"
set dop(lang.10.284) "Bu, þifrenizi belirler."
set dop(lang.10.285) "Geçersiz kanal adý."
set dop(lang.10.286) "« yasaklamasý « kanalýna eklendi."
set dop(lang.10.287) "FLOATLIM için deðer ON ya da OFF olmalý"
set dop(lang.10.288) "Invalid floating-limit Margin (2-20 Allowed)."
set dop(lang.10.289) "Invalid floating-limit max (0-65536 Allowed)."
set dop(lang.10.290) "Invalid floating-limit period (20-200 Allowed)."
set dop(lang.10.291) "Invalid floating-grace setting (0-19 Allowed)."
set dop(lang.10.292) "SYNTAX: CYCLE <#kanal>"
set dop(lang.10.293) "SYNTAX: ACTION <#kanal> <action/msg>"
set dop(lang.10.294) "«!« (auth as «) \[«\] make me do an action on «: «"
set dop(lang.10.295) "/msg « cycle <#kanal>"
set dop(lang.10.296) "«'in kanaldan çýkýp girmesini saðlar."
set dop(lang.10.297) "« dakika icin «"
set dop(lang.10.298) "« for ever"
set dop(lang.10.299) "Bu e-posta adresi geçersiz bir karakter içeriyor. (..@..)"
set dop(lang.10.300) "« ile baðlanýldý. (« dan itibaren)"


proc dop:lang {hand id arg} {
	global dop
	set arg [join [lrange [split $arg] 0 end]]

	if {$hand != "adminreportuser"} {
		if {[dopValiduser $hand]} {
				if {[dopGetuser $hand xtra dop:lang] == "" || [dopGetuser $hand xtra dop:lang] == 0} {
					if {![matchattr $hand +b]} {
						dopSetuser $hand xtra dop:lang $dop(deflang)
					}
				}
		} {
			set hand "*"
		}
		
		if {$hand == "*"} {
			set lang $dop(deflang)
		} {
			set lang [dopGetuser $hand xtra dop:lang]
		}
		if {$lang == ""} { set lang $dop(deflang) }
		if {$lang == 0 && [matchattr $hand +b]} {
			 set lang 1
		}
	} {
		set lang $dop(adminreportlang)
	}
	
	set sen $dop(lang.${lang}.${id})
	set out [dop:replang $sen $arg]
	
	return $out
	
}


proc dop:replang {x y} {
	set a -1
	set x [join [split $x]]
	set y [join [split $y]]
	for {set i 0} {$i < [string length $x]} {incr i} {
		if {[string index $x $i] == "«"} {
			incr a
		}
	}
	if {$a == -1} {
		return $x
	}
	set b -1
	set z ""
	for {set i 0} {$i < [string length $x]} {incr i} {
		if {[string index $x $i] == "«"} {
			incr b
			if {$b != $a} {
				append z "[lindex $y $b]"
			} {
				append z "[lrange $y $b end]"
			}
		} {
			append z "[string index $x $i]"
		}
	}
	return $z
}

putlog "\r"
putlog "_-¯->$dop(tclversion) has been loaded<-¯-_\r"
putlog "_-¯->This software is free software under the terms of GNU GPL 2<-¯-_\r"

if {$numversion < 1061000} {
	putlog "!WARNING! You are using Eggdrop1.6.10 or bellow. Some command of the windop may not work on these version. Please upgrade it !"
}


proc dop:checkupdate {min hour day month year} {
	global dop
	if {[info tclversion] >= 8.0} {
		if {$dop(upautocheck) == 1} {
			package require http

			set url "http://www.windop.com/curversion.php"

			set token [http::config -useragent "mozilla"]
			set token [http::geturl $url]
			set html [http::data $token]
			set html [split $html "|"]

			if {[lindex $html 0] > $dop(tclversionn)} {
				putlog "\002!WARNING! Version [lindex $html 0] of windop has been released on [lindex $html 1]. You should update it! You can download it at http://www.windop.com"
			}
		}
	} {
		putlog "\002!WARNING! Tcl Libraries version is lower than the needed version. You should upgrade it."
	}
}
