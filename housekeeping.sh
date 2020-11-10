#! /bin/bash
# Author: Waseem
# Dicription: This script will delete old files
time=$(date '+%Y-%m-%d:%H:%M:%S')
fileid=$(date '+%m%Y')
logfilename=HOUSEKEEPING_$fileid.log

echo '------Task Started!------------' >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
echo $time 'Conditions Applied for below files.' >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
find /apps/doapp/OUT/uploads/ -mtime +10 -exec ls -ltr {} \; >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
echo $time 'Renaming Started...' >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
find /apps/doapp/OUT/uploads/ -mtime +10 -exec mv {} {}.old \; >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
find /apps/doapp/OUT/uploads/ -mtime +10 -exec ls -ltr {} \; >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
echo $time 'Renaming Done!' >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
echo $time 'Deletion Started!...' >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
find /apps/doapp/OUT/uploads/ -type f -name "*.old" -exec rm -rf {} \; >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
echo $time 'Deletion Done...' >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1
echo '--------Task Completed!----------' >>/apps/doapp/standalone/logs/housekeeping/$logfilename 2>&1

