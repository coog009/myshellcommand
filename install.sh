#!/bin/bash

function InstallOrUninstall() {
	for file in `find . -path "./.git" -prune -o -print | egrep -ive ".*(install).*"`
	do
		if [ -x $file -a ! -d $file ]; then
			case "$1" in
				install)
					libtool --mode=install cp $file /usr/local/bin
				;;
				uninstall)
					libtool --mode=uninstall rm /usr/local/bin/$file
				;;
			esac
		fi
	done
}

InstallOrUninstall $1
