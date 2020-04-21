#!/bin/bash

# This script demonstrates the use of the functions in shell script

log() {
	# This function sends a message to syslog and to standard output if VERBOSE is true.
	local MESSAGE="${@}"
	
        if [[ "${VERBOSITY}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
	logger -t function_with_global.sh "${MESSAGE}"
}

 backup_file() {
	# This function creates a backup of  a file. Returns non-zero status on error.
	local FILE="${1}"
	# Make sure the file exists.
	if [[ -f "${FILE}" ]] 
	then 
		local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
		log "Backing up  ${FILE} to ${BACKUP_FILE}."

		# The exit status of the functin will be the exit status of the cp command.
		cp -p ${FILE} ${BACKUP_FILE} # -p preserves the owner and the timestamp of the file
	else
		# The file does not exist, so return a non-zero exit status.
		return 1
	fi
}

		

readonly VERBOSITY='true'
log 'Hello!'
log 'This is fun!'

backup_file '/etc/passwd'

# Make a decision based on the exit status of the function.

if [[ "${?}" -eq '0' ]]
then
	log 'File backup succeded'
else
	log 'File backup failed!'
	exit 1
fi
 
