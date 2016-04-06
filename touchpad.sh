#!/bin/bash

if [ $1 == "0" ]; then
	synclient TouchpadOff=1
else
	synclient TouchpadOff=0
fi
