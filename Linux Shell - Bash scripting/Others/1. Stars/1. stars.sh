#!/bin/bash

if [ $# -ne 1 ]; then
	echo 'Error. Add an integer as a second parameter'
	exit 1
fi

for i in $(seq 1 $1); do
	echo -n '*'
done
echo
exit 0
