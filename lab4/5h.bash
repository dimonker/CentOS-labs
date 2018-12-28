#!bin/bash
result=1
operate='+'
(tail -n 0 -f 5.in) |
while true
do
	pidtail=$!
	read line
	case $line in
		'+')
		operate='+'
		echo "adding"
		;;
		m)
		operate='*'
		echo "multiplying"
		;;
		[0-9]*)
		if [[ $operate == '+' ]]
		then
			let result="$result+$line"
		else
			let result="$result*$line"
		fi
		echo "$operate$line = $result"
		;;
		"QUIT")
		echo "stopping"
		killall tail
		break
		;;
		*)
		echo "Error!"
		;;
	esac
done
