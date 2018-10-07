
#! bin/bash

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