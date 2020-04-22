#!/bin/bash

# This script shows the open network ports in a system.
# Use -4 as an arguemnt to limit to tcpv4 ports.

if [[ "${1}" = '-4' ]]
then 
		netstat -nutl ${1} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'		
else
		netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'
fi

echo 'End of script.'