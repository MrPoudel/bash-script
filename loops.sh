
#! /bin/bash

i=1

while [[ $i -le 10 ]] # -le: less than or equal
do
	echo "$i"
	#i=$(( i+1 ))
	(( ++i ))

done