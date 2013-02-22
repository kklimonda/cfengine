#!/bin/sh

gems=$(/usr/bin/gem list |/bin/egrep -v '^$|.*LOCAL GEMS.*')
IFS='
'
for gem in $gems; do
  name=$(/bin/echo $gem |cut -d' ' -f1)
  versions=$(/bin/echo $gem|cut -d' ' -f2-|tr -d ",)(")
  IFS=" "
  for version in $versions; do
    echo "$name ($version)"
  done
done
