#!bin/bash
d=$(date '+%d.%m.%y_%H:%M:%S')
mkdir /home/test && {
    echo "catalog test was created successfully" > ~/report 
    touch /home/test/$d
}
ping www.net_nikogo.ru 2>> ~/report
