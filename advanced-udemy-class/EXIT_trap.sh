#!/bin/bash

# This line explicitly tells to the bash to exit on error. 
set -e
trap 'catch $? $LINENO' EXIT
catch() {
  echo "catching!"
  if [ "$1" != "0" ]; then
    # error handling goes here
    echo "Error $1 occurred on $2"
  fi
}
simple() {
  badcommand
  echo "Hi from simple()!"
}
simple
echo "After simple call"
