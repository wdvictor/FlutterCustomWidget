#!/bin/bash

sed -i "$ a export FLUTTERCW_DIR=$(pwd)" ~/.bashrc
sed -i "$ a alias fluttercw=$FLUTTERCW_DIR/fluttercw.sh" ~/.bashrc
