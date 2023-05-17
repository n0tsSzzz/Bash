#!/bin/bash

chmod +x test/testalg2.sh 
test=$(./test/alg.sh)

if [[ "$test" != "Вы ничего не подали" ]]; then
  echo "Тест провален"
  exit 1
else
  echo "Тест прошел"
fi