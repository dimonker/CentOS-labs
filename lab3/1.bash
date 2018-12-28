#!bin/bash
ps -u user -o pid,command | 
tail -n +2 |
sed -r "s/\s*([0-9]+)\s(.+)$/\1:\2/" > ans1

ps -u user -o pid,command | 
tail -n +2 |
sed -r "s/\s*([0-9]+)\s(.+)$/\1:\2/" |
wc -l >> ans1

cat ans1
