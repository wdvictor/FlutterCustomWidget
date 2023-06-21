#!/bin/bash

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
    fade_and_scale_animation)
        install_fade_and_scale_animation
    ;;
    center_to_bottom_animation)
        install_bottom_to_center_animation
    ;;
    *)  echo "´$1´ widget not found. Use ´fluttercw -l´ to list all available widgets"
    ;;
   esac
}

function install_fade_and_scale_animation(){
    if [[ ! -d "./lib/widgets" ]]; then
        mkdir ./lib.widgets
    fi
    cp -r $FLUTTERCW_DIR/fade_and_scale_animation ./lib/widgets
    echo "Fade and scale animation was added to lib/widgets folder"
}

function install_bottom_to_center_animation(){
    if [[ ! -d "./lib/widgets" ]]; then
        mkdir ./lib.widgets
    fi
    cp -r $FLUTTERCW_DIR/bottom_to_center_animation ./lib/widgets
    echo "Bottom to center animation was added to lib/widgets folder"
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

    extensions                          Create a file with handy dart extensions.
    alert_dialog                        Alert Dialog widget to display in cases of warnings or alerts.
    animated_fab_button                 A Widget to use with floating Action Button parameter in Scaffold. Has an beautiful animation.
    fade_and_scale_animation            An animation that start scale and opacty at 0 and animate to 1. Cool to use in lists.
    center_to_bottom_animation          Animate a widget from outsite the screen to the center
    '''
}

function show_help(){
    echo '''Install Custom Flutter widgets into your project.

Usage: fluttercw <command> [arguments]

Available commands:

    -i, --install                          Install a custom widget into lib folder.
    -l, --list                             List all available custom widgets.
    -h, --help                             See help options.
    '''
}



check_flutter_root_directory
IS_FLUTTER_DIR=$?
if [[ IS_FLUTTER_DIR -eq 1 ]]; then
    printf "Error: No pubspec.yaml file found"
    printf "\n"
    echo "This command should be run from the root of your Flutter project"
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
            show_help
        ;;
        --help) 
            show_help
        ;;
        *) echo "$i not a option"
        ;;
        esac
        exit 0
    
        
    fi
done


