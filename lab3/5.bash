#!bin/bash
result=""
for i in $(ps -A -o pid | tail -n +2)
do
	file1="/proc/$i/status"
	file2="/proc/$i/sched"
	ppid=$(grep -E -h -s -i "PPid:\s(.+)" $file1 | grep -E -o "[0-9]+")
	avgatom=$(grep -E -h -s -i "avg_atom" $file2 | grep -E -o "[0-9]+\.[0-9]+")	
	if [[ -n "$avgatom" ]] 
	then		
		result=$result"ProcessID="$i" : Parent_ProcessID="$ppid" : Average_Time="$avgatom"\n"
	fi	
done
echo -e $result | sort -t '=' -nk3 > ans5
cat ans5
