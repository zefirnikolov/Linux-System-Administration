#!/bin/bash

read -r X
read -r Y

SUM=$((X + Y))
DIFFERENCE=$((X - Y))
PRODUCT=$((X * Y))
QUOTIENT=$((X / Y))

echo $SUM
echo $DIFFERENCE
echo $PRODUCT
echo $QUOTIENT
