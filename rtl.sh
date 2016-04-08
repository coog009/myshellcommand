#!/bin/bash

if [ $UID -ne 0 ];then
	echo "$0 need super user privilege"
	exit
fi

WIRELESS_INTERFACE=`iwconfig | grep ESSID | cut -f 1 -d " "`

route del default dev $WIRELESS_INTERFACE
