#!/bin/bash
set -e

STYLE_PATH=~/astyle-script/default/astylerc
SRCS=

function GetAllCAndCPlusFiles() {
	SRCS=`find . -name '*.c' -or -name '*.cpp' -or -name '*.h' -type f`
}

case "$1" in
	libvpu)
	STYLE_PATH=~/astyle-script/libvpu-style/astylerc
	GetAllCAndCPlusFiles
	;;
esac

for file in $SRCS
do
	astyle --options=${STYLE_PATH} $file
done

#astyle --options=${STYLE_PATH} ./*.cpp ./*.h ./*.c
