# Bash knowledge

  

  

  

## Arguments passed in command line

  

  

-  **$*** Stores the numbers of arguments passed to the bash program

  

  

-  **$?** stores the exit value of the last command that was executed

  

  

-  **$0** The first argument passed (The command line name)

  

  

-  **$#** Stores all the arguments that were entered on the command line

  

  

  

## Tips

  

  

- Make sure to leave no spaces around the equal sign. Otherwise, Bash will treat the variable name as a program to execute, and the = as its first parameter.

  

  

  

## Arrays

  

  

- Curly brackets are required for arrays to access the index. Ex ${ARGS[0]}

  

  

-  **@** is used to output all elements of an array. Ex ${ARGS[@]}

  

  

-  **${#array[@]}** is a way to find array length

  

  

-  **!** return the list of all array indices. Ex ${!ARGS[@]} ---> 0,1,2....n

  

  

  

## Conditions

  

  

- -**eq**  &ensp;  &ensp; Equal to. Ex: if [[ $i -eq $j ]

  

-  **-ne**  &ensp;  &ensp; Not Equal

  

-  **-gt**  &ensp;  &ensp; Grater than

  

-  **-ge**  &ensp;  &ensp; Greater than or equal

  

-  **-lt**  &ensp;  &ensp; Less than

  

-  **-le**  &ensp;  &ensp; Less than or equal

  

-  **!=**  &ensp;  &ensp; different

  

-  **\$i == z*** True if $a starts with an z (pattern matching)

  

-  **\$a == "z\*"** True if $a is equal to z* (String literal)

  

## Files

  

-  **-f** check if the file exists. Ex: if [[ -f "main.py" ]]; then

  

-  **-d** Check if a directory exists

  

## Sed

  

$sed -i 'a some text' someFile.text

&ensp; Will append `some text` after every line (It Will double the lines in the file). The -i parameter tells to edit the **someFile.txt** file.

&ensp; To Append `some text` only at the end of the file, use $ at the beginning

  

$sed -i '$ a some text' someFile.text

&ensp; You can specify the line which will be appended to:

  

$sed -i '3 a some text' someFile.text

  

# AWK

Print a text file
	
	$ awk ' { print } ' /etc/passwd
  
  Print specific field

Use  **:** as the input field separator and print first field only i.e. usernames (will print the the first field. all other fields are ignored):

	$ awk -F':' '{ print $1 }' /etc/passwd

Send output to sort command using a shell pipe:  

	$ awk -F':' '{ print $1 }' /etc/passwd | sort
  
  Print pattern possibly on separate lines:  

	$ awk '/tom|jerry|vivek/' /etc/passwd`

Print 1st Line From File

	$ awk "NR==1{print;exit}" /etc/resolv.conf  
  
	$ awk "NR==$line{print;exit}" /etc/resolv.conf

# Notes

  

 -The : operation

: operator is same as **nothing**. **Do nothing**.

Ex:

[ ! -d test ] && mkdir test || :

  

If the test directory does not exist [ ! -d test] then create it. But if the first condition is false (The test directory exist, then do nothing)

 - grep, regex, awk and pipe

       $ cat data.json | grep -E '.*_id_.*' | awk -F':' '{ print $2 }'   

The cat command sends the data.json string to grep, which uses regex to print all lines that contain \_id_ in it. Then is sent to awk to split the string using ':' (-F':') and print the second line ( { print $2 }). The result of this code will be all values of the field that have \_id_ in it  