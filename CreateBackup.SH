#!/bin/bash
# Author: Waseem
# Discription: This cript for creating files backup
time=$(date '+%Y:%m:%d::%H:%M:%S')
fileid=$(date '+%d%m%Y_%H%M%S')
logfilename=BKP_$(date '+%Y%m%d').log
tar cvf /apps/doapp/OUT/uploads/Archive/BKP_$fileid.tar /apps/doapp/OUT/uploads &> /dev/null
gzip /apps/doapp/OUT/uploads/Archive/BKP_$fileid.tar &> /dev/null



find /apps/doapp/OUT/uploads/Archive/BKP_$fileid.tar.gz -mtime -1 -type f -print &> /dev/null

if [ $? -eq 0 ]
then
	echo $time '------------Backup Started-------------' >>/apps/doapp/standalone/logs/BackupCreator/$logfilename 2>&1
	echo $time 'BKP_'$fileid'.tar.gz Backup Created Successfully!' >>/apps/doapp/standalone/logs/BackupCreator/$logfilename 2>&1
	echo $time 'Archiving Started...' >>/apps/doapp/standalone/logs/BackupCreator/$logfilename 2>&1
	echo $time 'Archiving Done Successfully!' >>/apps/doapp/standalone/logs/BackupCreator/$logfilename 2>&1
	#scp /tmp/backup.tar.gz root@192.168.1.x:/path
else
	echo $time 'OOPs! Backup failed!' >>/apps/doap/standalone/logs/BackupCreator/$logfilename 2>&1
fi

