#!/bin/bash
trash=~/.local/share/Trash/files
inf=~/.local/share/Trash/info

DATE=$(date '+%Y-%m-%d_%H:%M:%S')
if [[ -f $trash/$1 ]]
then
	mv $trash/$1 $trash/$1_$DATE
	echo PATH=$PWD/$1 > $inf/$1_$DATE.trashinfo
	mv $1 $trash/$1
else
	mv $1 $trash/$1
	echo PATH=$PWD/$1 > $inf/$1.trashinfo
fi



