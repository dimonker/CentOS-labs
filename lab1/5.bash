#!bin/bash
echo "1 - nano, 2 - vi, 3 - links, 4 - exit"
read a
case $a in
 1)
    nano
 ;;
 2)
    vi
 ;;
 3)
    links
 ;;
 4)
    exit 0
esac
