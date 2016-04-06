#/bin/bash

function judge_root_authority() {
	if [ $UID -ne 0 ]; then
		return 0
	fi
	return 1
}

function usage() {
	case "$2" in
		route)
			echo "$1 route network-segment mask_number gw"
			;;
	esac
}

function route_add() {
	judge_root_authority
	if [ "$?" == "0" ]; then
		echo "this cmd need a superior authority"
		mysuper="sudo"
	fi

	$mysuper route add -net $1/$2 gw $3
}

case "$1" in
	route)
		if [ $# != 4 ]; then
			usage $0 $1
			exit
		fi

		route_add $2 $3 $4
		;;
esac
