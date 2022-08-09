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
&ensp;  Will append `some text` after every line (It Will double the lines in the file).  The -i parameter tells to edit the **someFile.txt** file.
&ensp;  To Append `some text` only at the end of the file, use $ at the beginning

	$sed -i '$ a some text' someFile.text
	
&ensp; You can specify the line which will be appended to:

	$sed -i '3 a some text' someFile.text
