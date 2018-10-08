
#! /bin/bash

vehicle=$1


case $vehicle in
	"car" )
		echo "Rent of the  $vehicle is 100 dollar" ;;
	"van" )
		echo "Rent fo the $vehicle is 100 dollar"  ;;
	"bycycle" )
		echo "Rent fo the $vehicle is 100 dollar"  ;;
	* )
		echo "The vehicle is unknown" ;;
esac