#!/bin/bash

#this script checks systemctl and services to get the services that are running. It categorizes them based off which command is being used to run them. For service there are two categories. The first one is just if it is being run with service. The other is if it is being  


date=date|awk '{print $4}'
file=services$(date |awk '{print $4}').txt
if [ -n $(which systemctl)  ] #makes sure systemctl exists (for ubuntu 16)
then
	echo 'SYSTEMCTL' >> services.txt
	systemctl | grep .service|grep running | awk '{print $1}' >> $file #outputs servces from systemctl
	echo 'SERVICE' >> services.txt
	service --status-all|grep '+'| awk '{print $4}' >> $file #outputs services with + (running) status 
	echo 'SERVICE ????' >> services.txt
	service --status-all|grep '?'| awk '{print $4}' >> $file #outputs services with ? (unkown) status 
else # if systemctl does not exist uses service 
	echo 'SERVICE' >> services.txt
	service --status-all|grep '+'| awk '{print $4}' >> $file
	echo 'SERVICE ????' >> services.txt
	service --status-all|grep '?'| awk '{print $4}' >> $file
fi
