#!/bin/bash
# take an input line
# [bytes] [name]
# and output bytes to friendly and fixed width format
KB=$((1024))
MB=$(($KB**2))
GB=$(($KB**3))

LINE="$1"
BYTES=`echo "$LINE" | cut -d,  -f1 | bc`
NAME=`echo "$LINE" | cut -d,  -f2`

if [[ $BYTES -ge $GB ]]
then
  N=`printf '% 8d' $(($BYTES/$GB))`
  OUT="$N GB"
elif [[ $BYTES -ge $MB ]]
then
  N=`printf '% 8d' $(($BYTES/$MB))`
  OUT="$N MB"
elif [[ $BYTES -ge $KB ]]
then
  N=`printf '% 8d' $(($BYTES/$KB))`
  OUT="$N KB"
else
  N=`printf '% 8d' $BYTES`
  OUT="$N B "
fi

echo "$OUT $NAME"
exit 0