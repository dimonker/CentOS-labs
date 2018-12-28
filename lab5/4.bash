#!/bin/bash

if [[ ! -d ~/restore/ ]]
then
	mkdir ~/restore/
fi

latestBackup=$(find ~ -maxdepth 1 -name "Backup-*" | sort -n | tail -n 1)
for file in $(ls $latestBackup -1)
do
	if [[ -z "$(echo $file | grep -Eo "[0-9]{4}-[0-9]{2}-[0-9]{2}")" ]]
	then
		cp $latestBackup/$file ~/restore
	fi
done

