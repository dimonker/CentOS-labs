#!bin/bash
email="[a-z0-9A-Z._%+-]+@[a-z0-9A-Z._-]+\.[a-zA-Z]+"
grep -E -h -s -o -r --binary-files=without-match $email /etc/* | awk '{print $1,","}' | tr -d ' ' | tr -d '\n' > emails.lst
cat emails.lst
