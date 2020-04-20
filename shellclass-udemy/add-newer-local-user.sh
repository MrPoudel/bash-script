#!/bin/bash

# Redirects the STDERR and STDOUT to the trash bin i.e. /dev/null. This is just an improvement of the add-new-local-user.sh

# This script creates an account on the local system.
# You will be prompted for the account name and password.

# Make sure the script is running using the root privilleges.

if [[ "${UID}" -ne 0 ]]
then
	echo "Script needs root previlidge!" >&2  # same as 1>&2
	exit 1
fi

# (Inside the script they are parameters, outside they are arguments.)
NUMBER_OF_PARAMETERS="${#}"
#echo "You supplied ${NUMBER_OF_PARAMETERS} arguemnt(s) on the commmand line."

# Make sure they at least supply one argument.
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then 
	echo "Usuage: ${0} USER_NAME [COMMENT]..." >&2
	exit 1
fi

USER_NAME="${1}"

# Rest of the parameters are for the comments
shift
COMMENT="${@}"

# Create the user.
useradd -c "${COMMENT}" -m ${USER_NAME}  &> /dev/null

# Check if the useradd command is succeeded. Just check if the last command was executed successufully.

if [[ "${?}" -ne 0 ]]
then 
	echo 'User account was failed to add' >&2
	exit 1
fi

# Set the password for the user.
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
# Append a special character to the password.
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+="' | fold -w1 | shuf | head -c1)
PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"

# Set the password for the user.
echo ${PASSWORD} | passwd --stdin ${USER_NAME} &> /dev/null

# Check if passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then 
	echo 'The password for the account could not be set.'  >&2
	exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}  &> /dev/null

# So, now let's display the detail info of the recently created user
echo "username:"
echo "${USER_NAME}"

echo "password:"
echo "${PASSWORD}"

echo "host:"
echo "${HOSTNAME}"

exit 0


