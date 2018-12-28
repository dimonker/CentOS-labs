#!bin/bash
echo $$ > .pid6h
state="running"
i=0
sigterm()
{
	state="stop"
}
trap 'sigterm' SIGTERM
while true
do
	case $state in
	"running")
	echo $i
	let i=$i+1
	;;
	"stop")
	echo "stopped by SIGTERM"
	exit
	;;
	esac
	sleep 1
done
