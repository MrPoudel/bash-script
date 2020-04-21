#!/bin/bash

# This script deletes the user account that is passed a the first command line argument 

# Run as root.
if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or as root.' >&2
	exit 1
fi

# Assume the first argument is the user to delete.
USER="${1}"

# Delete the user.
userdel ${USER}  # Use option -r if you want to delete the user home directory too.

# Make sure the user got deleted.
if [[ "${?}" -ne 0 ]]
then
	echo "The account "${USER}" was NOT deleted." >&2
	exit 1
fi

# Tell the user the account was delted.
echo "The account ${USER} was deleted."

exit 0


