#!/bin/bash

test_1='101 99 104 111 32 72 101 108 108 111 32 119 111 114 108 100'
test_2='97 61 53 10 98 61 54 10 101 99 104 111 32 36 40 40 36 97 32 43 32 36 98 41 41'
test_3='101 99 104 111 32 49 50 51 32 124 32 103 114 101 112 32 45 105 111 32 39 49 39'
ans_1='Hello world'
ans_2=11
ans_3=1


for i in {1..3}; do
    name=$(echo test_$i)
    echo ${!name} > in.txt
    ans=$(../hitrost.sh in.txt)
    ans_name=$(echo ans_$i)
    if [[ $? == 0 && $ans == ${!ans_name} ]]; then
        echo Тест $i пройден
    else
        echo Тест $i провален
        rm in.txt
        exit 1
    fi
done
rm in.txt
