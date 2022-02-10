#!/bin/bash 

grep "$2" $1_Dealer_schedule | awk '{print $5, $6}'
