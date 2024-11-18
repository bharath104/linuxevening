#!/bin/bash
#this is used for creating directory

read -p "enter a main directory: " main
if [ -z $main ]
then
	echo "input is invalid try again"
	exit 0
else
	mkdir $main
fi
dircount=3
until [ $dircount -eq 0 ]
do
	read -p "enter a subdir name " dir
	if [ -z $dir ]
	then
		echo "invalid input"
	elif [ -d $main/$dir ]
	then
		echo "dir is already existing"
	else
		mkdir $main/$dir
		filecount=0
		while [ $filecount -lt $dircount ]
		do
			read -p "enter a file name " file
			if [ -z $file ]
			then
				echo "invalid input"
			elif [ -f $main/$dir/$file ]
			then
				echo "file is already existing"
			else
				touch $main/$dir/$file
				filecount=$((filecount+1))
			fi
		done
		dircount=$((dircount-1))
	fi
done
list=`ls $main`
cd $main
read -p "enter a file name to search: " search
