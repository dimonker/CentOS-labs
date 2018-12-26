#!bin/bash
read a
n="1"
while [[ $(($a % 2)) == 1 ]]
	do
	let "n++"
	read a
	done
echo $n
