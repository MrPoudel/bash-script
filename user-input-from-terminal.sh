
#! bin/bash
#inputs from user

echo "Enter name : "
read name1 name2 name3
echo "Entered name : $name1 , $name2,  $name3"

#Prompt on the same line
read -p 'username : ' user_var
#Silent prompt
read -sp 'password : ' pass_var

echo " "

echo "username : $user_var"
echo "password : $pass_var"

#reading input in an array
echo "Enter names :"
read -a names
echo "Names : ${names[0]}, ${names[1]}"

#if you try to read the user input without a varibale name
#It will be stroed in the system varibale called REPLY

echo "Enter name : "
read
echo "Name : $REPLY"