#!/usr/bin/env bash

#PUT THIS FILE IN ~/.local/share/rofi/finder.sh
#USE: rofi  -show find -modi find:~/.local/share/rofi/finder.sh
if [ ! -z "$@" ]; then
	QUERY=$@
	if [[ "$@" == /* ]]; then
		if [[ "$@" == *\?\? ]]; then
			coproc (xdg-open "${QUERY%\/* \?\?}" >/dev/null 2>&1)
			exec 1>&-
			exit
		else
			coproc (xdg-open "$@" >/dev/null 2>&1)
			exec 1>&-
			exit
		fi
	elif [[ "$@" == \?* ]]; then
		find ~ -type d -iname "*${QUERY#\?}*"
	elif [[ "$@" == \!* ]]; then
		find ~ rg --files ~ | rg "*${QUERY#!}*" -l ~
	else
		find ~ -type f -iname "${QUERY}"
	fi
else
	echo "Type your search query to find files"
	echo "-- ?<search> directory search\n"
	echo "-- !<search> contents search"
	echo "-- <search> file search"
fi
