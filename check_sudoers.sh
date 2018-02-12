#!/bin/bash

# Get sudoers and compare to previous list of sudoers

 

CURRENT_SUDOERS_FILE=$(find -name "sudoers*.txt" 2>/dev/null | head -n 1)

PREVIOUS_SUDOERS_FILE=$(find -name ".prev_sudoers*.txt" 2>/dev/null | head -n 1)

 

echo $CURRENT_SUDOERS_FILE

 

if [ -e "${PREVIOUS_SUDOERS_FILE}" ]

then

        rm "${PREVIOUS_SUDOERS_FILE}"

fi

 

if [ -e "${CURRENT_SUDOERS_FILE}" ]

then

        PREVIOUS_SUDOERS_FILE=$(echo "${CURRENT_SUDOERS_FILE}" | sed s/sudoers/.prev_sudoers/)

        mv "${CURRENT_SUDOERS_FILE}" "${PREVIOUS_SUDOERS_FILE}"

fi

 

DATE=$(date -d "today" +"%Y-%m-%d,%H:%M:%S")

CURRENT_SUDOERS_FILE="sudoers${DATE}.txt"

 

echo "Current Sudoers"

echo "---------------"

sudo grep '^[^#(Defaults)]' /etc/sudoers | tee "${CURRENT_SUDOERS_FILE}"

echo "==============="

 

if [ -e "${PREVIOUS_SUDOERS_FILE}" ]

then

        echo "  Differences  "

        echo "---------------"

        diff "${CURRENT_SUDOERS_FILE}" "${PREVIOUS_SUDOERS_FILE}"

fi