#! /bin/bash

for num in {0..9}
do
    if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
    then
        echo $num

    else
	echo
    fi
done

