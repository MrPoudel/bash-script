# bash-script
This is all about bash scripting. Bash is one of the commonly used Unix shells. Bash stands for "Bourne Again SHell". It is an improvement of the original Bourne shell (sh). 

# command line arguments

`$ ./filename.sh argument1 argument2 ... argumentN`

Where, filename.sh is a shell script file and argument1, argument2 ... argumentN are list of arguments.

1. The `$0` variable
This holds the name of the script.

2. The `$1` `$2` ... `$N` variables
These variables hold the arguments provided to the script.

3. The `$#` variable
This variable hold the total number of arguments passed to the script.

4. The `$@` and `$*` variables
They both holds the list of arguments provided to the script.

5. The `$?` variable
This variable holds the exit value of the last run command or return code from a function.

6. The `$!` variable
This variable holds the PID of the last run background process.

# Example 1


```#!/bin/sh

# display the file name
echo "The name of the script file is $0"

# display total number of arguments passed to the script
echo "Total number of arguments passed to the script = $#"

# display all the arguments using for loop
if [ $# -gt 0 ]
then
  
  echo "List of arguments:"
  for arg in $@
  do
    echo "$arg"
  done

else
  
  echo "No argument provided to the script."

fi 

Output:

$ sh example.sh 
The name of the script file is example.sh
Total number of arguments passed to the script = 0
No argument provided to the script.


$ sh example.sh Hello World! What's up ?
The name of the script file is example.sh
Total number of arguments passed to the script = 5
List of arguments:
Hello
World
WWhat's
up
?
```

# Example 2

```#!/bin/sh

# function to check number of arguments passed to the script
function isArgumentPresent {
  if [ $1 -gt 0 ]
  then
    return 0	# success code
  else
    return 1	# failure code
  fi
}
# calling the function
# and passing number of arguments passed to the script
isArgumentPresent $#

# get the returned code
returnedCode=$?

# check returnedCode
if [ $returnedCode -eq 0 ]
then
  echo "Arguments present!"
else
  echo "Arguments not present!"
fi
Output:

$ ./example.sh hello world
Arguments present!

$ ./example.sh 
Arguments not present!
```

# Example 3

```#!/bin/sh

echo "PID of the current file is $$"

Output:

$ sh example03.sh 
PID of the current file is 71084
```

# Example 4

```#!/bin/sh

echo "The PID of the last run background process was $!"
Output:

$ ./example.sh 
The PID of the last run background process was 84014
```
# Example 5
```integer comparison

-eq
is equal to

if [ "$a" -eq "$b" ]

-ne
is not equal to

if [ "$a" -ne "$b" ]

-gt
is greater than

if [ "$a" -gt "$b" ]

-ge
is greater than or equal to

if [ "$a" -ge "$b" ]

-lt
is less than

if [ "$a" -lt "$b" ]

-le
is less than or equal to

if [ "$a" -le "$b" ]
```

## Search commands:

```
Searching the files or folder inside given directory

$ ls . -d *xzy* xzy* *xzy


Searching the text inside a folder in many files
Do the following:

$ grep -rnw '/path/to/somewhere/' -e 'pattern'

-r or -R is recursive,
-n is line number, and
-w stands for match the whole word.
-l (lower-case L) can be added to just give the file name of matching files.


Along with these, --exclude, --include, --exclude-dir flags could be used for efficient searching:
This will only search through those files which have .c or .h extensions:
grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"
This will exclude searching all the files ending with .o extension:


$ grep --exclude=*.o -rnw '/path/to/somewhere/' -e "pattern"


For directories it's possible to exclude a particular directory(ies) through --exclude-dirparameter. For example, this will exclude the dirs dir1/, dir2/ and all of them
matching *.dst/:

$ grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/somewhere/' -e "pattern"


How to find how many source files(.h and .c) have included the "Time.h" module in the current directory (recursively)?

$ grep --include=\*.{c,h} -rnw . -e Time.h

```
