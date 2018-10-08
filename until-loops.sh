
#! /bin/bash

n=1

until [[ $n -ge 10 ]] #executed until n is greater than or equal to 10
do
	echo $n
	n=$(( n+1 ))
	
done