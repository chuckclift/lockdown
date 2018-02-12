#!/bin/bash

#this script searches for files with 777 permisions and logs them in 777log(time)


date=date|awk '{print $4}'
file=777log$(date |awk '{print $4}').txt

find 2>/dev/null / -type f -perm 0777 > $file

