#!bin/bash
reg="^#!/"
grep -E -h -s $reg /bin/* | uniq -c | sort -n -k 1 | awk '{print $2}'
