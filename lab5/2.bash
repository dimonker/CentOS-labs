#!/bin/bash
path=$PWD/$1
if [[ $# -ne 1 ]] 
then
	echo "Requies 1 argument"
	exit 1
fi
for i in $(grep -h $1 ~/.trash.log)
do
	fullPath=$(echo $i | awk -F ":" '{print $1}')
	trFile=$(echo $i | awk -F ":" '{print $2}')
	rmFile=~/.trash/$trFile
	if [[ -e $rmFile ]]
	then
		echo "Restore file - $fullPath ? (y/n)"
		read ans
		if [[ $ans != "y" ]]
		then
			continue
		fi

		if [[ -d $(dirname $fullPath) ]]
		then
			if [[ -f $fullPath ]]
			then
				echo "File already exists. New file name:"
				read newName
				ln "$rmFile" "$(dirname $fullPath)/$newName"
			else
				ln $rmFile $fullPath
			fi
		else
			echo "$(dirname $fullPath) doesn't exist. File restored to $HOME"
			ln $rmFile ~/$1
		fi
		rm $rmFile
		grep -v $trFile ~/.trash.log > ~/.trash0.log
		mv ~/.trash0.log ~/.trash.log
	fi
done
