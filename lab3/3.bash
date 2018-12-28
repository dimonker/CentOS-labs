#!bin/bash
rm ans3
for i in $(ls /proc/ | grep -E "[0-9]+")
do
	a=$(echo $i | readlink /proc/$i/exe | grep "/sbin")
	if [[ -n "$a" ]]
		then echo $i >> ans3
	fi
done

cat ans3
