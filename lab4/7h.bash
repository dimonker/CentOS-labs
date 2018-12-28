#!bin/bash
echo $$ > .pid7h
state="+"
i=1
sigterm()
{
	state="stop"
}
trap 'sigterm' SIGTERM

usr1(){
	state="+"
}
trap 'usr1' USR1

usr2(){
	state="m"
}
trap 'usr2' USR2

while true
do
	case $state in
	"+")
	let i=$i+1
	echo $i
	;;
	"m")
	let i=$i*2
	echo $i
	;;
	"stop")
	echo "stopped by SIGTERM"
	exit
	;;
	esac
	sleep 1
done
