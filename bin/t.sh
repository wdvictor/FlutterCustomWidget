#!/bin/bash

# -i --install (custom widget name)
# -l --list (list custom widgets available)
# Check if the user is using in an flutter directory
# when installing, if the custom widget use any package (such as awesome_dialog), verify if the user has the 
# dependency, if not install it. 


#(https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays) <-- Source to learn array in bash
#And just as with any other Bash variable, make sure to leave no spaces around the equal sign. 
#Otherwise, Bash will treat the variable name as a program to execute, and the = as its first parameter!
ARGS=($*)

function installCustomWidget(){
   case $1 in
    error_pop_up)
        echo "installing error_pop_up"
    ;;
    extensions)
        echo "installing extensions"
    ;;
    *) "$1 not found"
   esac
}

# ${#arrayName[@]} is a way to find an array length
# -f: check is a file exist
function checkFlutterRootDirectory(){
   if [[ -f "pubspec.yaml" ]]; then
        echo "Is a flutter directory"
    else
        echo "not a flutter directory"
   fi
}

checkFlutterRootDirectory

# Curly brackets are required for arrays to access index
# @ is used to output all elements of an array
# the ! return the list of all array indices
for i in ${!ARGS[@]}; do
    
    if [[ ${ARGS[$i]} == -* ]]; then
        case ${ARGS[$i]} in
        -i) 
            
            installCustomWidget "${ARGS[$i+1]}"
        ;;
        *) echo "$i not a option"
        esac
    fi
done


