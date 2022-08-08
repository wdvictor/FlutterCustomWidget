# FlutterCustomWidget

Install custom widgets commonly used in flutter apps with a single command line. 
This project is used by me to learn bash, and came with a very handly ideia: Install custom widgets that I use in flutter projects with a single command line rather than find the code, copy and past.


# How to use

	$ flutter-custom-widget -i [widget_name]
	
Example:

	$ flutter-custom-widget -i extensions

   
 &ensp; &ensp; &ensp; &ensp; Will create a folder called extension in the /lib folder and create a file called extensions.dart with a lot very handy extensions to use in dart code.
  &ensp; &ensp; &ensp; &ensp; 



 
 # Commands

- -i --install [widget name]
&ensp; &ensp;  Install [widget name] in /lib folder. Some widgets will create diferent name folders such as **widgets** or **extentions**
- 



  
  
  
  
  

# Bash knowledge 

### Arguments passed in command line
- **$*** Stores the numbers of arguments passed to bash program
- **$?** stores the exit value of the last command that was executed
- **$0** The first argument passed (The command line name)
- **$#** Stores all the argument that were entered on the command line

### Tips
- Make sure to leave no spaces around the equal sign. Otherwise, Bash will treat the variable name as a program to execute, and the = as its first parameter.

  
### Arrays
- Curly brackets are required for arrays to access index. Ex ${ARGS[0]}
- **@** is used to output all elements of an array. Ex ${ARGS[@]}
- **${#array[@]}** is a way to find array length
-  **!** return the list of all array indices. Ex ${!ARGS[@]} ---> 0,1,2....n

