#!/bin/bash

echo "Write the array's length"
read -r length

bubble() {
  for ((i = 0; i<$length; i++)); do
    for((j = 0; j<$length-i-1; j++)); do
      if [[ ${arr[j]} -gt ${arr[$((j+1))]} ]]; then
        temp=${arr[j]}
        arr[$j]=${arr[$((j+1))]}
        arr[$((j+1))]=$temp
      fi
    done
  done
}

for i in $(seq 0 $(($length-1))); do
  read -r val
  arr[$i]=$val
done

bubble

for i in $(seq 0 $(($length-1))); do
    echo -n "${arr[$i]} "
  done