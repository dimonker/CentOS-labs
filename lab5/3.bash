#!/bin/bash

todayDate=$(date "+%F")
todaySec=$(date --date=$todayDate "+%s")
sourceDir=~/source

lastBackupDir=$(ls ~ -1 | grep -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | 
sort -r -k2 | head -1)
lastBackupSec=$(date --date=$(ls ~ -1 | grep -Eo "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" |
sort -r -k2 | head -1 | sed "s/^Backup-//") "+%s")

if [[ -z $lastBackupDir ]]
then
	dateDiff=8
else 
	let dateDiff=($todaySec-$lastBackupSec)/60/60/24
fi

if [[ "$dateDiff" -le 7 ]]
then
	curBackupDir=~/$lastBackupDir"/"
	echo "Updating backup $curBackupDir on $todayDate:" >> ~/backup-report
	for file in $(ls ~/source -1)
	do
		backupFile=$curBackupDir$file
		if [[ -f $backupFile ]]
		then
			srcSize=$(stat ~/source/$file -c%s)
			backupSize=$(stat $backupFile -c%s)
			if [[ "$srcSize" != "$backupSize" ]]
			then
				mv $backupFile "$backupFile.$todayDate"
				cp ~/source/$file $backupFile
				echo "Update: $file Previous version: $file.$todayDate" >> ~/backup-report
			fi
		else
			cp ~/source/$file $backupFile
			echo "New file: $file" >> ~/backup-report
		fi
	done
else
	mkdir ~/"Backup-"$todayDate
	curBackupDir=~/"Backup-"$todayDate"/"
	echo "Backup created $curBackupDir on $todayDate:" >> ~/backup-report
	for file in $(ls ~/source -1)
	do
		cp ~/source/$file $curBackupDir
		echo $file >> ~/backup-report
	done
fi





