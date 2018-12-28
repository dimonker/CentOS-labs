#!bin/bash
ps -A -o pid,stime |
tail -n +2 |
sort -r -k2 |
head -1 |
awk '{print $1}' > ans2
cat ans2
