#!/bin/bash

# This script executes on several remote servers from the remote admin machine via ssh.
FILE='/vagrant/servers'
SSH_OPTIONS='-o ConnectTimeout=2'

# Function to display the usage info and exit.
usage() {
	echo 'Do not execute this script as root. Use the -s option instead.'  >&2
	echo "Usuage: ${0} [-nsv] [-f FILE] COMMAND" >&2
	echo 'Executes the commands on the remote servers provided as commandline arguments.' >&2
	echo ' -f Allows user do overwrite the default file: /vagrant/servers.' >&2
	echo ' -n Display the COMMAND that would have been executed and exit.'  >&2
	echo ' -s Run the commands as the superuser privileges on the remote server.'  >&2
	echo ' -v Verbose mode. Displays the server name before executing COMMAND.'  >&2
	exit 1
}

# Parse the options.
while getopts f:nsv OPTION
do
	case ${OPTION} in
		f) FILE="${OPTARG}" ;;			
		n) DRY_RUN='true' ;;			
		s) SUDO='sudo' ;;
		v) VERBOSE='true' ;;		
		?) usage ;;
	esac
done

# Remove the options while leaving the remainning arguments.

shift "$(( OPTIND - 1 ))"

# Enforce the script to be run as non super user.
if [[ "${UID}" -eq 0 ]]
then
	echo 'Please run the script as -s option to run it as as a superuser instead.' >&2
	usage
fi

# If user doesn't supply at least one argument, give them help.
if [[ "${#}" -lt 1 ]]
then	
    #echo "No of arguments: ${#}."
	usage
fi

# Now anything that remains on the command line is to be treated as a single line command.
COMMAND="${@}"

# make sure the server file exists.
if [[ ! -e "${FILE}" ]]
then 
	echo "Cannot open server file: ${FILE}" >&2 # Sending error to to the stderr.
	exit 1
fi

# Expect the best, prepare for the worst.
EXIT_STATUS='0'

# Loop through the list of failed attempts and corresponding IP address.
#awk '{print $(NF)}' ${FILE} | while read SERVER_NAME
for SERVER_NAME in $(cat ${FILE})
do
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "Command: ${1} is being executing on: ${SERVER_NAME}"
	fi
	
	SSH_COMMAND="ssh ${SSH_OPTIONS} ${SERVER_NAME} ${SUDO} ${COMMAND}"
	
	#if it's a dry run, don't execute anything, just echo it.
	if [[ "${DRY_RUN}" = 'true' ]]
	then 
		echo "DRY RUN: ${SSH_COMMAND}"
	else
		${SSH_COMMAND}
		SSH_EXIT_STATUS="${?}"
		
		# Capture any non-zero exit status from the SSH_COMMAND and report to the user.
		if [[ "${SSH_EXIT_STATUS}" -ne 0 ]]
		then
			EXIT_STATUS="${SSH_EXIT_STATUS}"
			echo "Execution on ${SERVER} failed." >&2 # There might be hundreds of servers so we want to continue even if the command fails on some of the servers.
		fi
	fi
done

exit 0



