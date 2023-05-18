#!/bin/bash

[[ -z $1 ]] && { echo 'No input provided'; exit 1; }
str=$(cat $1)
zxc=''

for number in $str; do
  zxc=$zxc"\x$(printf %x $number)"
done

var=`echo -e $zxc`
bash -c "$var"
