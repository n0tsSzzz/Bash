#!/bin/bash

chmod +x test/testalg2.sh 
test=$(./test/alg.sh 8 -777 0 228 123 1337 -2)

if [[ "$test" != "-777 -2 0 8 123 228 1337" ]]; then
  echo "Тест провален"
  exit 1
else
  echo "Тест прошел"
fi