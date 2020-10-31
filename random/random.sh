#!/bin/bash

#===============================================================================
#
#          FILE:  random.sh
#
#   DESCRIPTION: Generates the distinct n random numbers.
#
#   INSTRUCTION:  Install bats: 
#                   Ubuntu: sudo apt-get install bats
#                   Mac: brew install bats
#                 Run script: ./random.sh
#                 Run tests: ./test_random.sh
#
#         USAGE:  ./random.sh -n NUMBER -vh
#
#
#  REQUIREMENTS:  bats
#          BUGS:  ---
#        AUTHOR:  Bal K. Poudel
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  Sat 31 Oct 2020 12:58:07 PM CET
#      REVISION:  1.0.0
#===============================================================================

NUMBERS=10

# Exit on error. 
set -e

# Function to display the usage info and exit.
usage() {
	echo "Usuage: ${0} [-n NUMBERS] [-vh]" >&2
	echo 'Generates n random numbers.' >&2
	echo ' -n NUMBER   Allows user to provide the numbers of random number.' >&2
	echo ' -v          Increase verbosity.'  >&2
    echo ' -h          Shows this help message.'  >&2
	exit 1
}

log(){
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
}

# Parse the options.
while getopts n:vh OPTION
do
	case ${OPTION} in
		n) 
            NUMBERS="${OPTARG}" 
            ;;			
		v)             
            VERBOSE='true' 
            log 'Verbose mode on.'
            ;;
        h)  
            usage
            ;;
		?)  
            usage 
            ;;
	esac
done

log "Generating ${NUMBERS} random numbers."

numbers=($(shuf -i 1-${NUMBERS}))
echo ${numbers[@]}