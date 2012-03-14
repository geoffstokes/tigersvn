# TigerSVN

Growl notifications for Subversion updates on Mac OS X

## Prerequisites

### Mac OS X
* `svn` Command-line Client
* Growl Notification System
* `growlnotify` binary

### Linux
* `svn` Command-line Client
* Notification Daemon (Ubuntu Desktop Notifications)

**Note that Mac OS X is the only platform which has been tested. Linux support may not work, or may be partially missing. If you are on Linux, and have additional notification daemons you want added, or information on making it better, please email me.**

## Instructions
1. Download or clone the script.
2. Put script in a convenient location (your home directory, or bin directory would be appropriate)
3. Edit the script (in your favourite text editor) and find this section;
		SVN_ROOT="/Users/geoffstokes/svn"
	Edit the text between the "" to be the path to your SVN repository folder.
4. Make the script executable;
		chmod +x tigersvn.sh
5. Test the script to make sure there are no errors (Sorry, there is next to no actual error handling in the script currently. There shouldn't be any issues for a standard setup, though.)
		# For bash users:
		./tigersvn.sh

		# For most other shell users:
		sh tigersvn.sh
	Assuming the script is configured correctly, you should get output containing the files which have been modified, and at the end, a Growl (or Notification-Daemon) notification.
6. If all is well, then we can add an entry to our crontab (or similar scheduler) schedule. Mine is as follows;
		0 * * * mon,tue,wed,thu,fri,sat /Users/geoffstokes/tigersvn.sh
	This causes TigerSVN to poll every hour for changes. You can of course set it to run more or less frequently, depending on your needs.
(Note that this should be on one line. Consult the documentation regarding your scheduling software for more information)

## License
TigerSVN is licensed under the terms of the [CC-BY-SA 3.0 license](http://creativecommons.org/licenses/by-sa/3.0/).