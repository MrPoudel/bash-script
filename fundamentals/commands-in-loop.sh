
#! /bin/bash


for commands in ls pwd date
do
	echo "------------------ $commands ----------------"
	$commands
done



#check whether it is diretory or file

for item in *
do
	if [[ -d $item ]]
	then
		echo $item is a directory
	else
		echo $item is not a directory
	fi
done

