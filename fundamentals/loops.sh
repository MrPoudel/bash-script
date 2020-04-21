
#! /bin/bash


#while loop

i=1

while [[ $i -le 10 ]] # -le: less than or equal
do
	echo "$i"
	#i=$(( i+1 ))
	(( ++i ))

done


#for loops. There are serveral varities of for loop
for i in 1 2 3 4 5 
do
	echo $i
done


#we can also give the ranges of values
for i in {50..55} 
do
	echo $i
done


#Another way

for i in {1..10..2} #START..END..INCREMENT
do
	echo $i
done

#Another way

for (( i=100; i<105; i++))
do
	echo $i
done


