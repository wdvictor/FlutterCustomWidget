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

function check_dependency(){
    exist=$(cat pubspec.yaml | grep $1)
    if [[ -z $exist ]]; then
        flutter pub add "$1"
    fi
   
}

function install_alert_dialog(){
    check_dependency "awesome_dialog"
    if [[ ! -d "./lib/widgets" ]]; then
        mkdir ./lib/widgets   
    fi
    cp $FLUTTERCW_DIR/alert_dialog/alert_dialog.dart ./lib/widgets
    echo "Alert Dialog file was added to lib/widgets folder"
}

function install_fab_button(){
    if [[ ! -d "./lib/widgets" ]]; then
        mkdir ./lib/widgets   
    fi
    cp -r $FLUTTERCW_DIR/animated_fab_button ./lib/widgets
    echo "Animated Fab Button directory was added to lib/widgets folder"
}

function install_custom_awesome_dialog(){
    check_dependency "awesome_dialog"
    if [[ ! -d "./lib/widgets" ]]; then
        mkdir ./lib/widgets   
    fi
     cp $FLUTTERCW_DIR/custom_awesome_dialog/custom_awesome_dialog.dart ./lib/widgets
    echo "Custom Dialog file was added to lib/widgets folder"
}

function install_custom_widget(){
   case $1 in
    extensions)
        cp -r $FLUTTERCW_DIR/extensions ./lib
        echo "Extensions was added to lib/extension folder"
    ;;
    alert_dialog)
        install_alert_dialog
    ;;
    animated_fab_button)
        install_fab_button
    ;;
    custom_awesome_dialog)
        install_custom_awesome_dialog
    ;;
    *)  echo "´$1´ widget not found. Use ´fluttercw -l´ to list all available widgets"
    ;;
   esac
}

function check_flutter_root_directory(){
   if [[ -f "pubspec.yaml" ]]; then
        return 0
    else
        return 1
   fi
}

function list_widgets_available(){
    echo ''' 
    Available widgets:

    extensions            Create a file with handy dart extensions.
    alert_dialog          Alert Dialog widget to display in cases of warnings or alerts.
    animated_fab_button   A Widget to use with floating Action Button parameter in Scaffold. Has an beautiful animation.
    '''
}

function show_help(){
    echo '''
    

    '''
}



check_flutter_root_directory
IS_FLUTTER_DIR=$?
if [[ IS_FLUTTER_DIR -eq 1 ]]; then
    printf "Error: No pubspec.yaml file found"
    printf "\n"
    printf "This command should be run from the root of your Flutter project"
    exit 1
fi



if [[ ${#ARGS[@]} -eq 0 ]]; then
    echo "Missing arguments"
    printf "\n\n"
    printf "Run fluttercw -h available commands"
    exit 2

fi

for i in ${!ARGS[@]}; do
    
    if [[ ${ARGS[$i]} == -* ]]; then
        case ${ARGS[$i]} in
        -i) 
            install_custom_widget "${ARGS[$i+1]}"
        ;;
        --install) 
            install_custom_widget "${ARGS[$i+1]}"
        ;;
        -l) 
            list_widgets_available
        ;;
        --list) 
            list_widgets_available
        ;;
        -h) 
            list_widgets_available
        ;;
        --help) 
            list_widgets_available
        ;;
        *) echo "$i not a option"
        ;;
        esac
        exit 0
    
        
    fi
done


