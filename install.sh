#!/bin/bash


chmod +x ./fluttercw.sh


USER_SHELL=$(echo $SHELL | awk -F'/' '{ print $3}')
FILE=~/".${USER_SHELL}rc"

sed -i "$ a export FLUTTERCW_DIR=$(pwd)" $FILE
sed -i "$ a alias fluttercw=$(pwd)/fluttercw.sh" $FILE
echo '''fluttercw was installed successfully. Close the terminal to changes make effect

Run fluttercw -h to see how to use.'''