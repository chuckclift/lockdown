#!/bin/bash

date=date|awk '{print $4}'
file=process$(date |awk '{print $4}').txt
ps -aux > $file

