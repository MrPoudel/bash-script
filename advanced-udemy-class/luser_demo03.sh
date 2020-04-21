#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user is  the vagrant user or not

# Display the UID
echo "Your UID is ${UID}"

# Only display if the UID does not match 1000
UID_TO_TEST_FOR='1000'
if [[ "${UID_TO_TEST_FOR}" -ne  "${UID}" ]]
then
	echo "Your UID does not match ${UID_TO_TEST_FOR}"
	exit 1
fi

# Display the suername
USER_NAME=$(id -un)

# Test if the command succeeded.
if [[ "${?}" -ne 0 ]]  # ${?} holds the exit status of most recent command that was executed
then
	echo 'The id command did not execute successfully.'
	exit 1
fi
echo "Your username is ${USER_NAME}"

# You can use a strng test conditional.
USER_NAME_TO_TEST_FOR='vagrant'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]] # == used for the pattern matching!
then 	
	echo "Your username matches ${USER_NAME_TO_TEST_FOR}."
fi

# Test for  != (not equal) for the string.
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then 
	echo "Your username does not match ${USER_NAME_TO_TEST_FOR}."
	exit 1
fi 
exit 0
