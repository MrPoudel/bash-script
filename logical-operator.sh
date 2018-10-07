
#! /bin/bash

age=25
if [ $age -gt 18 ] && [ "$age" -lt 30 ]
then
	echo "valid age"
	else
		echo "age is not valid"
fi


#alternative AND operator

age=25
if [ $age -gt 18 -a "$age" -lt 30 ]
then
	echo "valid age"
	else
		echo "age is not valid"
fi


#Another alternative
age=25
if [[ $age -gt 18  && "$age" -lt 30 ]]
then
	echo "valid age"
	else
		echo "age is not valid"
fi



####OR operator
###############
###############

age=25
if [ $age -eq 18 ] || [ "$age" -eq 30 ]
then
	echo "valid age"
	else
		echo "age is not valid"
fi


#alternative OR operator

if [ $age -eq 18 -o "$age" -eq 30 ]
then
	echo "valid age"
	else
		echo "age is not valid"
fi


#Another alternative. You need to give the double brackets.
if [[ $age -eq 18  || "$age" -eq 30 ]]
then
	echo "valid age"
	else
		echo "age is not valid"
fi