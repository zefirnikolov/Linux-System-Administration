#!/bin/bash

read -p "" num_one
read -p "" num_two

if [ $num_one -lt $num_two ]; then
    echo "X is less than Y"
elif [ $num_one -gt $num_two ]; then
    echo "X is greater than Y"
else
    echo "X is equal to Y"
fi
