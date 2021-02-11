#!/bin/bash

COUNT=50
PARSED=`mktemp /tmp/arq-upload-stats.XXXXXXXXXX`
./upload-parse.pl /Library/Logs/ArqAgent/*.log > $PARSED

# Parsed output is $date,$file

echo -e "\n\n" 
echo "Top $COUNT Most Frequent Uploads"
echo "---------------------------------"
cat $PARSED | cut -d, -f2 | sort | uniq -c | sort -nr | head -n $COUNT | grep -vE "^\W+[123]\W"

rm -f $PARSED 2>/dev/null
exit 0
