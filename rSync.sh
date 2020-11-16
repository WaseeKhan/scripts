#!/bin/bash
#Author: Waseem
#Description: This is rSysnc script will copy all the file from one machine to another machine
#Create on: 14 Nov, 2020

cur_time=$(date '+%Y-%m-%d')
logfilename=rsync_$cur_time.log

rsync -rvzhu -p -o -g --delete --exclude '/apps/doapp/standalone/logs/' --log-file=/apps/doapp/standalone/logs/rsync/$logfilename /apps/doapp/standalone/scripts/ lucifer@192.168.0.103:/apps/doapp/standalone/scripts/

rsync -rvzhu -p -o -g --delete --log-file=/apps/doapp/standalone/logs/rsync/$logfilename /apps/doapp/IN/ lucifer@192.168.0.103:/apps/doapp/IN/

rsync -rvzhu -p -o -g --delete --log-file=/apps/doapp/standalone/logs/rsync/$logfilename /apps/doapp/OUT/ lucifer@192.168.0.103:/apps/doapp/OUT/

rsync -rvzhu -p -o -g --delete --log-file=/apps/doapp/standalone/logs/rsync/$logfilename /apps/doapp/backup/ lucifer@192.168.0.103:/apps/doapp/backup/


