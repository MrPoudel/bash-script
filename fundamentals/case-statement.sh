
#! /bin/bash

LANG=C #The 'LANG' environment variable indicates the language/locale and encoding, where "C" is the language setting

country=$1

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


#check whether the entered argument is character, caps, small or integer

echo -e "Enter some character : \c"
read value

case $value in
	[a-z] )
		echo "$value is small letter" ;;
	[A-Z] )
		echo "$value is capital letter"  ;;
	[0-9] )
		echo "$value is integer"  ;;
	? ) #special onle letter character
		echo "$value is special charater" ;;
	* )
		echo "$value is unknown" ;;
esac
