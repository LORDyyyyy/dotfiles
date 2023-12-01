#!/usr/bin/bash
# rclone copy and sync script to my google drive


pcDesktop="$HOME/Desktop/G-Drive"
gdrive="gdrive:PC_Desktop"

if [ $# -lt 1 ]; then
    echo "Usage: $0 <sync|copy> <post|get>"
    exit 1
fi

if [ "$1" == "sync" ]; then
	if [ "$2" == "post" ]; then
		rclone sync -u -P $pcDesktop $gdrive
	elif [ "$2" == "get" ]; then
		rclone sync -u -P $gdrive $pcDesktop
	else
		echo "Invalid second argument. Usage: $0 <sync|copy> <post|get>"
		exit 1
	fi
elif [ "$1" == "copy" ]; then
	if [ "$2" == "post" ]; then
		rclone copy -u -P $pcDesktop $gdrive
	elif [ "$2" == "get" ]; then
		rclone copy -u -P $gdrive $pcDesktop
	else
		echo "Invalid second argument. Usage: $0 <sync|copy> <post|get>"
		exit 1
	fi

else
    echo "Invalid argument. Usage: $0 <sync|copy> <post|get>"
    exit 1
fi

