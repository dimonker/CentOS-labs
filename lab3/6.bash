#!bin/bash
ppid=0
count=1
avg=0
res=""
newppid=""
newavg=""
while read a
do
	if [[ -z $a ]]
		then continue
	fi
	newppid=$(echo $a | grep -E -h -s -i -o "Parent_ProcessID=[0-9]+" | grep -E -o "[0-9]+")
	newavg=$(echo $a | grep -E -h -s -i -o "Average_Time=[0-9.]+" | grep -E -o "[0-9.]+")
	if [[ $ppid == $newppid ]]
	then
		avg=$(echo "$avg+$newavg" | bc -l -q)
		count=$(echo "$count+1" | bc -l -q)
	else
		avg=$(echo "$avg/$count" | bc -l -q)
		res=$res"Average_Sleeping_children_of_parentID="$ppid" is "$avg"\n"
		avg=$newavg
		ppid=$newppid
		count=1
	fi
	res=$res$a"\n"
done < ans5
avg=$(echo "$avg/$count" | bc -l -q)
res=$res"Average_Sleeping_children_of_parentID="$ppid" is "$avg"\n"
res=$res$a
echo -e $res > ans6
cat ans6
