#!/bin/sh

a=0

while [ $a -lt 3 ]
do a=$(($a+1));
    read line
    version=${line:8:3}
done < "$XMAP_PATH/xwsm/man/README"

echo $version