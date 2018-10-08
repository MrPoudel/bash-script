
#! /bin/bash

while read p
do
	echo $p
done  < advanced-loops2.sh


#using pipe
#read the content of file into a variable

cat advanced-loops2.sh | while read p
do
	echo $p
done 


#using IFS

while IFS= read -r line
do
	echo $line
done  < advanced-loops2.sh

#OR we can use Internel Field Separator(IFS) used for separating the words

while IFS=' ' read -r line
do
	echo $line
done  < advanced-loops2.sh


#print the content of /etc/host.conf
while IFS=' ' read -r line
do
	echo $line
done  <  /etc/host.conf
