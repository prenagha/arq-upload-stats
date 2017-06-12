#!/bin/bash

COUNT=25
PARSED=`mktemp /tmp/arq-upload-stats.XXXXXXXXXX`
./upload-parse.pl ~/Library/Logs/arqcommitter/*.log > $PARSED

# Parsed output is $date,$size,$file
echo -e "\n\n" 
echo "Top $COUNT Largest Total Upload Size"
echo "------------------------------------"
cat $PARSED | awk -F, '{i[$3]+=$2} END{for(x in i){print i[x]","x}}' | sort -t , -k 1 -nr | head -n $COUNT | tr '\n' '\0' | xargs -0 -n1 ./bytes.sh

echo -e "\n\n" 
echo "Top $COUNT Most Frequent Uploads"
echo "---------------------------------"
cat $PARSED | cut -d, -f3 | sort | uniq -c | sort -nr | head -n $COUNT

rm -f $PARSED 2>/dev/null
exit 0
