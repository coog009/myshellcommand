#!/bin/bash

MYSHELLCMD_HOME=$HOME/.myshellcmd

#-D: hide decorator bar
#-u: user name
#-p: password
#-r: option
#-g: size

GET_VARIABLE_VALUE=
function get_variable_value() {
	GET_VARIABLE_VALUE=`grep $1 $MSTSC_ACCOUNT_FILE | cut -f 2 -d "=" | tr -d [:space:]`
}

MSTSC_ACCOUNT_FILE=$MYSHELLCMD_HOME/mstsc_account

REAL_USER=
REAL_PASSWD=

get_variable_value HOME_USER
HOME_USER=$GET_VARIABLE_VALUE
get_variable_value HOME_PASSWD
HOME_PASSWD=$GET_VARIABLE_VALUE

get_variable_value WORK_USER
WORK_USER=$GET_VARIABLE_VALUE
get_variable_value WORK_PASSWD
WORK_PASSWD=$GET_VARIABLE_VALUE

get_variable_value ALYUN_USE
ALYUN_USER=$GET_VARIABLE_VALUE
get_variable_value ALYUN_PASSWD
ALYUN_PASSWD=$GET_VARIABLE_VALUE

#echo $WORK_USER
#echo $WORK_PASSWD

case "$1" in
	home)
		REAL_USER=$HOME_USER
		REAL_PASSWD=$HOME_PASSWD
		;;
	work)
		REAL_USER=$WORK_USER
		REAL_PASSWD=$WORK_PASSWD
		;;
	alyun)
		REAL_USER=$ALYUN_USER
		REAL_PASSWD=$ALYUN_PASSWD
esac

if [ $# -lt 2 ];then
	echo "mstsc.sh home|work ip_address"
	exit
fi

rdesktop $2 -g 1920x1056 -D -u $REAL_USER -p $REAL_PASSWD -r clipboard:PRIMARYCLIPBOARD -r disk:linux=/home/zhaojun -r sound:remote &
