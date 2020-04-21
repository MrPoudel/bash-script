#!/bin/bash

# This script demonstrates the case statement.

#if [[ "${1}" = 'start' ]]
#then
#	echo 'Starting.'
#	exit 1
#elif [[ "${1}" = 'stop' ]]
#then
#	echo 'Stop.'
#	exit 1
#elif [[ "${1}" = 'status' ]]
#then 
#	echo 'Status.'
#	exit 1
#else
#	echo 'Supply a valid option.'  >&2
#	exit 1
#fi 


#case "${1}" in 
#	start)
#		echo 'Starting.'
#		;;
#	stop)
#		echo 'Stopping.'
#		;;
#	status|state|--state|--status)
#		echo 'Status.'
#		;;
#	*)
#		echo 'Supply a valid option.' >&2
#		exit 1
#		;;
#esac

case "${1}" in 
	start) echo 'Starting.' ;;
	stop) echo 'Stopping.' ;;
	status)	echo 'Status.' ;;
	*)
		echo 'Supply a valid option.' >&2
		exit 1
		;;
esac


	
