
#! bin/bash

#to interpret the back slash  we need to use -e
echo -e "Enter the name of the file : \c"

read file_name

#check if the file exists
if [ -f $file_name ]
then
	if [ -w $file_name ] #does file has a write permission
    then
		echo " Type some text data. To quit press ctrl+d"
		cat >> $file_name # single direction arrow < overwrites!
	else
		echo "The file do not have write permissions"
    fi
else
	echo "$file_name does not exist"
fi

#how to use this script
#create a file test: touch test
#remove write perission: chmod -w
#then run the script and type test
#it will show file does not have write permission
#again, run chmod +w test
#after that the file should work

