#!/bin/bash

# This script counts teh number of failed logins by IP address.
# If there are any IPs with over LIMIT failures, display the count, IP, and location.

LIMIT='10'
LOG_FILE="${1}"

# make sure the login log file exists.
if [[ ! -e "${LOG_FILE}" ]]
then 
	echo "Cannot open log file: ${LOG_FILE}" >&2
	exit 1
fi

# Loop through the list of failed attempts and corresponding IP address.
grep Failed syslog-sample | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while read COUNT IP
do
	# If the number of failed attempt is greater than the limit, display count, IP and location.
	if [[ "${COUNT}" -gt "${LIMIT}" ]]
	then 
		LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
		echo "${COUNT}, ${IP}, ${LOCATION}"
	fi
done
exit 0
	


# make sure file is passes as an argument.
if [[ "${#}" -lt 1 ]]
then 
	echo "Cannot open log file." >&2
	exit 1
fi

# Some commands.
# grep Failed syslog-sample | awk -F 'from ' '{print $2}' | awk '{print $1}'
# grep Failed syslog-sample | awk -F 'from ' '{print $2}' | awk -F ' ' '{print $1}'
# grep Failed syslog-sample | awk '{print $(NF - 3)}'
# OR using cut
# grep Failed syslog-sample | awk -F 'from ' '{print $2}' | cut -d ' ' -f 1

#  grep Failed syslog-sample | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr
#  geoiplookup 182.100.67.59

# cut -d '"' -f  2 {LOG_FILE} | cut -d ' ' -f 2 | sort | uniq -c | sort -n | tail -3

