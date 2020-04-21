#!/bin/bash

# Add some accounts to test with
if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or as root.' >&2
	exit 1
fi

for U in harry barry dennis lukas
do
	useradd ${U}
	echo 'pass123' | passwd --stdin ${U}
done
