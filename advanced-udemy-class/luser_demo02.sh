#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user is the root user or not.

# Display the UID

echo "Your UID is:  ${UID}"

# Display username

#USER_NAME=$(id -un)  # Modern style

USER_NAME=`id -un` # Older style
echo "Your username is ${USER_NAME}"

# Display if the user is the root or not

if [[ "${UID}" -eq 0 ]]   # we can also use a single bracket but this is a older style
then 
	echo 'You are root.'
else
	echo 'You are not root.'
fi

