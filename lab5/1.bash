#!/bin/bash
fileName=$1
trash=~/.trash
log=~/.trash.log
if [[ $# -ne 1 ]] 
then
	echo "Requies 1 argument"
	exit 1
fi

if [[ ! -f $fileName ]]
then
	echo "File $fileName doesn't exist"
	exit 1
fi 

if [[ ! -d $trash ]] 
then
	mkdir $trash
fi
newName=$(date +%s)
ln $fileName "$trash/$newName"
rm $fileName
if [[ ! -f $log ]]
then
	touch $log
fi
echo "$PWD/$fileName:$newName" >> $log
