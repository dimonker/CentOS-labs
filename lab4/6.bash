#!bin/bash
./6h &
while true
do
	read line
	if [[ $line == "TERM" ]]
	then
		kill -SIGTERM $(cat .pid6h)
		exit
	fi
done
