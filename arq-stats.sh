#!/bin/bash

COUNT=25

UPLOAD_STATS=`mktemp /tmp/arq-upload-stats.XXXXXXXXXX`
./scripts/parse-uploads.pl ~/Library/Logs/arqcommitter/*.log > $UPLOAD_STATS

QUIET_SKIPPED='Logs|Caches|Cache|Saved Application State|.DS_Store'
SKIPPED_STATS=`mktemp /tmp/arq-skipped-files.XXXXXXXXXX`
./scripts/parse-skipped.pl ~/Library/Logs/arqcommitter/*.log > $SKIPPED_STATS

function header {
    echo -e "\n\n" 
    echo "$1"
    echo "-------------------------------------"
}

# Parsed output is $date,$size,$file
header "Top $COUNT Largest Single Upload Size"
cat $UPLOAD_STATS | cut -d, -f2-3 | sort | uniq | sort -t , -k 1 -nr | head -n $COUNT | tr '\n' '\0' | xargs -0 -n1 ./scripts/bytes.sh

header "Top $COUNT Largest Total Upload Size"
cat $UPLOAD_STATS | awk -F, '{i[$3]+=$2} END{for(x in i){print i[x]","x}}' | sort -t , -k 1 -nr | head -n $COUNT | tr '\n' '\0' | xargs -0 -n1 ./scripts/bytes.sh

header "Top $COUNT Most Frequent Uploads"
cat $UPLOAD_STATS | cut -d, -f3 | sort | uniq -c | sort -nr | head -n $COUNT

# Parsed output is $name,$file
header "Skipped files and directories"
cat $SKIPPED_STATS | grep -iEv "^($QUIET_SKIPPED)," | cut -d, -f2 | sort | uniq | sort -nr

header "Skipped bulk files and directories"
cat $SKIPPED_STATS | grep -iE "^($QUIET_SKIPPED)," | sort | uniq | cut -d, -f1 | sort | uniq -c | sort -nr

rm -f $UPLOAD_STATS 2>/dev/null
rm -f $SKIPPED_STATS 2>/dev/null
exit 0
