
#! /bin/bash

#open 3 terminals
i=1

while [[ $i -le 3 ]] # -le: less than or equal
do
	echo "$i"
	#i=$(( i+1 ))
	(( ++i ))
	sleep 1 #delay of one second
	gnome-terminal &

done