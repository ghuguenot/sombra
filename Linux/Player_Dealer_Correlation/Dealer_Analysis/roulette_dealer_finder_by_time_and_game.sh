#!bin/bash

grep "$2" $1_Dealer_schedule |  awk -v var=$3 -v var2=$4 '{print $var, $var2}'
