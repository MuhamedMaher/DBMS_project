#!/bin/bash

#this is main file

#-------Intialization-message-------
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}##############################${NC}"
echo -e "${YELLOW}#   ____       _             #${NC}"
echo -e "${YELLOW}#  | __ )  ___| |_ __ __     #${NC}"
echo -e "${YELLOW}#  |  _ \ / _ \ __/ _  |     #${NC}"
echo -e "${YELLOW}#  | |_) |  __/ || (_| |     #${NC}"
echo -e "${YELLOW}#  |____/ \___|\__\__ _|     #${NC}"
echo -e "${YELLOW}#                            #${NC}"
echo -e "${BLUE}##############################${NC}"

#--------------------------sourcing-section-----------------------------------
source ./db-functions.sh
source ./table-functions.sh

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
echo "-----------------------------"

#---------running-choice---------
case $choice in
	1) create_database
	       	;;
        2) list_database
	       	;;
        3) connect_to_database
	       	;;
        4) drop_database
	       	;;
        5) exit 0  
	       	;;
        *) echo "Invalid Input, Try Again...."
	       	;;
esac

done
