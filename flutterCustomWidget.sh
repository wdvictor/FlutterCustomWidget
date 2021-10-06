#!/bin/zsh

echo $@
if [[ -z "$@" ]]
then
	echo "Invalid usage of flutter-custom-widget"
	echo "Try 'flutter-custom-widget -h' for more information"
	exit 1
fi

while getopts :l:p:h opt; do
	
	case $opt in
		p) FILE_PATH="$OPTARG"	
		;;
		l) LINE="$OPTARG"
		;;
		h) echo "flutter-custom-widget"
		   echo "by Victor Hugo (github.com/wdvictor)"
		;;
		\?) echo "Invalid option -$opt">&2
		exit 1
		;;
	esac

	case $OPTARG in
	    -*) echo "Option $opt needs a valid argument"
	    exit 1
	    ;;
	  esac
	
done


		
		
	
