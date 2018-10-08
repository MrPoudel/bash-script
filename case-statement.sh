
#! /bin/bash

vehicle=$1


case $country in
	"Nepal" )
		echo "$country belongs to Asia" ;;
	"China" )
		echo "$country belongs to Asia"  ;;
	"Germany" )
		echo "$country belongs to Europe"  ;;
	* )
		echo "$country is beautiful" ;;
esac