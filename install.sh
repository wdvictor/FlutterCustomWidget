#!/bin/bash

sed -i "$ a export FLUTTERCW_DIR=$(pwd)" ~/.text
sed -i "$ a alias fluttercw=$FLUTTERCW_DIR/fluttercw.sh" ~/.text
exit 0