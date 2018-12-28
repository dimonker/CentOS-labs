#!bin/bash
./7h &
while true
do
	read line
	case $line in
	'+')
	kill -USR1 $(cat .pid7h)
	;;
	'*')
	kill -USR2 $(cat .pid7h)
	;;
	"TERM")
	kill -SIGTERM $(cat .pid7h)
	exit
	;;
	esac
done
