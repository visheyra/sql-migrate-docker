#!/bin/sh

set -e
cd /tmp


if [ "$#" -eq 0 ]
then
    echo "You must specify either [down | new | redo | skip | status | up | reset]"
    exit 1
fi

if [ -z "$(ls -A)" ]
then
    echo "Empty /tmp folder, This should hold the entire migration and configuration file"
    exit 2
fi

for arg in "$@"
do
 if [ "$arg" == "reset" ]; then
   limit="$(ls -l *.sql | wc -l)"
   for i in $(seq 0 1 $limit)
   do
     if [ -z $CONFIG ]
     then
         sql-migrate down
     else
         sql-migrate down --config $CONFIG
     fi
   done
   continue
 fi

 if [ -z $CONFIG ]
 then
     sql-migrate $arg
 else
     sql-migrate $arg --config $CONFIG
 fi
done
