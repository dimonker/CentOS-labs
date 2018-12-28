#!bin/bash
ppid=$(ps -fp $$ -eo ppid | tail -n 1)
echo "TASKH PPID=$ppid"
echo "pid=$$"
tail -f $(/proc/$ppid/fd/1) |
while true
do
	read line
	echo "taskh $line" 
	if [[ $line == "2000" ]]
	then
		kill $ppid
		exit
	fi
done
