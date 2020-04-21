#!/bin/bash

# This script generate a random password.
# This user can set the password length -l and add a special character with -s.
# Verbose mode can be enabled with -v.

usuage() {
	echo "Usuage: ${0} [-vs] [-l LENGTH]" >&2
	echo 'Generate a random password.'
	echo ' -l LENGTH Specify the password length.'
	echo ' -s 		 Append a special character to the password.'
	echo ' -v        Increase verbosity.'
	exit 1
}

log(){
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
}

# Set a default password lenght
LENGTH=48

while getopts vl:s OPTION
do
	case ${OPTION} in
		v)
			VERBOSE='true'
			log 'Verbose mode on.'
			;;
		l)
			LENGTH="${OPTARG}"
			;;
		s)
			USE_SPECIAL_CHARACTER='true'
			;;
		?)
			usuage
			;;
	esac
done

log 'Generating a password'

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

# Append a special character if requested to do so.
if [[ "${USE_SPECIAL_CHARACTER}" = 'true' ]]
then
	log 'Selecting a random special character.'
	SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=-' | fold -w1 | shuf | head -c1)
	PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi

log 'Done.'
log 'Hereis the password.'

# display the password.
echo "${PASSWORD}"

exit 0
	

