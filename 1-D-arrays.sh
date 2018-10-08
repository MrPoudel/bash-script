
#! /bin/bash

os=('kali' 'ubuntu' 'windows')

os[3]='mac' #add element at index 3
unset os[1] #remove the kali from array
echo "${os[@]}"
echo "${os[1]}"
echo "${!os[@]}" #prints indices
echo "${#os[@]}" #prints length of array


string=guten_tag
echo "${string[@]}"
echo "${string[0]}"
echo "${string[1]}"
echo "${#string[@]}"

