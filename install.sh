#!/bin/bash


chmod +x ./fluttercw.sh
sed -i "$ a export FLUTTERCW_DIR=$(pwd)" ~/.bashrc
sed -i "$ a alias fluttercw=$FLUTTERCW_DIR/fluttercw.sh" ~/.bashrc

echo '''fluttercw was installed successfully.

Run fluttercw -h to see how to use.'''