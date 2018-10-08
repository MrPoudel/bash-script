
#! /bin/bash

#to interpret the back slash  we need to use -e
echo -e "Enter the name of the file : \c"

read file_name

#check if the file exists
if [ -e $file_name ]
then
	echo "$file_name found"
else
	echo "$file_name not found"
fi

#for block special file use -b
#for character special file use -c
#if file is empty or not -s
#if file has read permission -r
#if file has write permission -w