#!/bin/bash

# This script creates an account on the local system.
# You will be prompted for the account name and password.

# Make sure the script is running using the root privilleges.

if [[ "${UID}" -ne 0 ]]
then
	echo "Script needs root previlidge!"
	exit 1
fi

# Ask for the user name.
read -p 'Enter the username to create: ' USER_NAME

# Ask for the real name. This is the content for the description field.
read -p 'Enter the name of the person who this account is for: ' COMMENT

# Ask for the password.
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the user.

useradd -c "${COMMENT}" -m ${USER_NAME}

# Check if the useradd command is succeeded. Just check if the last command was executed successufully.

if [[ "${?}" -ne 0 ]]
then 
	echo 'User account was failed to add'
	exit 1
fi

# Set the password for the user.

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check if the password was set successfully.

if [[ "${?}" -ne 0 ]]
then 
	echo 'User account was failed to add'
	exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# So, now let's display the detail info of the recently created user


echo "username:"
echo "${USER_NAME}"

echo
echo "password:"
echo "${PASSWORD}"

echo 
echo "host:"
echo "${HOSTNAME}"





