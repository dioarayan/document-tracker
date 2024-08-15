#!/bin/bash

while ! mysql -h db -D app_test -e "select 1"
do
  echo "waiting for MySQL"
  sleep 2
done
