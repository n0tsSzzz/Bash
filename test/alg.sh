#!/bin/bash

bubble() {
  for ((i=0; i<$length; i++)); do
    for((j=0; j<$length-i-1; j++)); do
      if [[ ${arr[j]} -gt ${arr[$((j+1))]} ]]; then
        temp=${arr[j]}
        arr[$j]=${arr[$((j+1))]}
        arr[$((j+1))]=$temp
      fi
    done
  done
}

if [[ -z $1 ]]; then
  echo "Вы ничего не подали"
  exit 1
fi

arr=($*)
length=${#arr[@]}

bubble

echo ${arr[@]}