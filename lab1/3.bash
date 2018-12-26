#!bin/bash
read in
a=""

while [[ "$in" != "q" ]]
do
    a=$a" "$in
    read in
done

echo $a
