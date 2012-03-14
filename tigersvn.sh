#!/bin/bash

# 
# TigerSVN SVN Monitoring Shell Script
# Version 1.2.1 - Last Updated 1 March 2011
# 2010 Geoff Stokes - Email: tigersvn@geoffstokes.net
# 
# Licensed under the terms of the CC-BY-SA 3.0 license:
# 	http://creativecommons.org/licenses/by-sa/3.0/
# 

VERSION=1.2.1
MESSAGE=
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'
fi

# Enter the directory which holds your Working Copies here.
# (If all the Working Copies you want to monitor are in different places,
# make symlinks of them all into one directory, and point to that)
SVN_ROOT="/Users/geoffstokes/svn"

echo TigerSVN $VERSION
echo By Geoff Stokes. CC-BY-SA 3.0 Licensed.

for file in $SVN_ROOT/* ; do
	REPOSITORY=`basename $file`
        if ( svn stat --show-updates "$file" | grep \* ); then
		MESSAGE=$MESSAGE$'\n'$REPOSITORY
		echo $REPOSITORY: Changes Detected
	fi
done

if [ -n "$MESSAGE" ]; then
	if [ "$platform" == "darwin" ]; then
		/usr/local/bin/growlnotify "TigerSVN: Changes Detected" --sticky -m "Unsynced changes in;$MESSAGE"$'\n'"An SVN Update is recommended." --name tigersvn
	elif [ "$plaform" == "linux" ]; then
		notify-send "TigerSVN: Changes Detected" "Unsynced changes in;$MESSAGE"$'\n'"An SVN Update is recommended."
	fi
fi