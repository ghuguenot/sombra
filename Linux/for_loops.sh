#! /bin/bash

States=(
	'Oregon'
	'Hawaii'
	'Washington'
	'Colorado'
	'New York'
)

for States in ${States[@]}
do
    if [ $States = 'Hawaii' ]
    then
        echo "Hawaii is the best"
    else
        echo "I am not fond of Hawaii"
    fi
done

