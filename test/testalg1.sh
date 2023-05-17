#!/bin/bash

chmod +x test/testalg1.sh 
test=$(./test/alg.sh 4 3 2 1)

if [[ "$test" != "1 2 3 4" ]]; then
  echo "Тест провален"
  exit 1
else
  echo "Тест прошел"
fi