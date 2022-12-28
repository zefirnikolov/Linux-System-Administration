#!/bin/bash
FIRST_NAME=''
LAST_NAME=''
BIRTHPLACE=''

for i in {1..3}; do
	if (($i == 1)); then
		read -p "Enter your first name: " FIRST_NAME
	elif (($i == 2)); then
		read -p "Enter your last name: " LAST_NAME
	else
		read -p "Enter your place of birth: " BIRTHPLACE
	fi
done
echo "$FIRST_NAME;$LAST_NAME;$BIRTHPLACE" >> /tmp/user-data.dat