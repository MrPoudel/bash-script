
#! /bin/bash

#This shell script checks if file exists and if so it also checks if it is writable
#How to test this script?
#1. create a file : touch test
#2. chmod -w test
#3. ./function test
#4. restlt should be: file found
#                : file found and not writable
#5. chmod +w test and go to step 3.
#6. Finally result shoud be : file found
#                           : file found and writable

usuage() {
	echo "Please provide an argument :"
	echo "usuage : $0 file_name"
}


is_file_exist() {
	local file="$1"
	[[ -f "$file" ]] && return 0 || return 1
}

is_file_writable() {
	local file="$1"
	[[ -w "$file" ]] && return 0 || return 1
}

[[ $# -eq 0 ]] && usuage 

if (is_file_exist "$1")
then
	echo "File found"
	if (is_file_writable "$1")
    then
	    echo "File is found and writable"
	
    else
	echo "File is found but not writable"
    fi
else
	echo "File not found"
fi
