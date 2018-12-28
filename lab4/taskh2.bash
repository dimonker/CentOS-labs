#!bin/bash
#echo "ppid=$PPID"
#echo "pid=$$"

echo $i
if [[ $i -eq 2000 ]]
then
	kill -9 $ppid
	exit
fi

