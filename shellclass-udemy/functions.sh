#!/bin/bash

# This script demonstrates the use of the functions in shell script

#function log2 {
#	echo 'You callled the function log'
#}
#
#log2

log() {
	local VERBOSE="${1}"
	shift
	local MESSAGE="${@}"
	
        if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
	AVAILABLE_AFTER_FUN_CALL='Now, I exist'  # Without local keyword all the variables are global.
}

echo "${AVAILABLE_AFTER_FUN_CALL}"

VERBOSITY='true'
log "${VERBOSITY}" 'Hello!'
log "${VERBOSITY}" 'This is fun!'

echo "${AVAILABLE_AFTER_FUN_CALL}"

