filedate=$(date '+%d%m%y')
fileid=$(date '+%H%M%S')
#echo $filedate
#echo $fileid
filename='AB_'$filedate'_'$fileid'.txt'
logfilename='FileCreate_'$filedate'.log'
touch /apps/doapp/IN/source/$filename
echo $filename ":Created!" >>/apps/doapp/standalone/logs/CreateFiles/$logfilename 2>&1
