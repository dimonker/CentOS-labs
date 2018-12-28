#!/bin/bash

if [[ $# -ne 1 ]] 
then
	echo "Requies 1 argument"
	exit 1
fi

trash=~/.local/share/Trash/files
inf=~/.local/share/Trash/info
for i in $(ls $trash | grep -E $1)
do	
	echo "Restore $i? (y/n)"
	read ans
	if [[ $ans != "y" ]]
	then
		continue
	fi
	fullPath=$(grep -E "PATH" $inf/$i.trashinfo | awk -F "=" '{print $2}')
	rm $inf/$i.trashinfo
	mv $trash/$i $fullPath
	break
done
