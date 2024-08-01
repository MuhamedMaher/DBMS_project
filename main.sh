#!/bin/bash

#this is main file
 
#--------------------------sourcing-section-----------------------------------




#------------------------main-function-section--------------------------------
while  true 
do

#-------main_menu_options--------
	echo "-----------Options-----------"
	echo "1.Create Database"
	echo "2.List Databases"
	echo "3.connect to Database"
	echo "4.Drop Database"
	echo "5.Exit"
        echo "-----------------------------"
#---------taking-user-input------
read -p "please, Enter your choice: " choice

#---------running-choice---------
case $choice in
	1) echo "command 1"
	       	;;
        2) echo "command 2"
	       	;;
        3) echo "command 3"
	       	;;
        4) echo "command 4"
	       	;;
        5) exit 0  
	       	;;
        *) echo "Invalid Input, Try Again...."
	       	;;
esac

done
