
#! bin/bash
#input arguments are stored in 1,2,3 and so on
#Run as ./pass-arguments.sh Par1 Par2 Par3
echo $0 $1 $2 $3 '> echo $1 $2 $3'

#Store arguments in an array
#one important thing, whenever you assign the arguments 
#in an array the first argument will be stored in the 
#zeroth index
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]}

#OR
echo $@

#count the number of commandline arguments
echo $#