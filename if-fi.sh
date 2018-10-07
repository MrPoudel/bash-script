
#! bin/bash
count=10

if [ $count -gt 9 ] 
then
	echo "condition1 is true"
fi

#using > sign
if [ $count > 9 ] 
then
	echo "condition2 is true"
fi

#using parenthesis
if (($count > 9 )) 
then
	echo "condition3 is true"
fi

word=abc
#string comparision
if [ $word == "abc" ]
 then
	echo "condition4 is true"
fi

#string comparision single = also works
if [ $word == "abc" ]
 then
	echo "condition5 is true"
fi

word=a
#when comparing the string with </> signs double square brackets must be used

if [[ $word < "b" ]]
then
	echo "a is less than b"
fi

#if-else
#string comparision
if [ $word == "abc" ]
then
	echo "condition is true"
else
	echo "condition is false"
fi

#nested-if-else


new_word=X
#when comparing the string with </> signs double square brackets must be used

if [[ $new_word == "q" ]]
then
	echo "condition q"
elif [[ $new_word == "a" ]]
then
	echo "condition a"
else
	echo "condition X"
fi





