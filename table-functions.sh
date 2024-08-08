#!/bin/bash

#-------------------------Table-functions-file---------------------------

#-------------database-file-path---------
db_dir=" ./DBMS-project/databases"

#-----------create-tables-functions--------
create_table() {
	local db_name="$1"
        read -p "please, Enter table name: " table_name

	 if [ -f "$db_dir/$db_name/$table_name" ]; then
                echo "Table already exists"
        else
                read -p "please, Enter columns names: " columns_names
		echo "$columns_names" > "$db_dir/$db_name/$table_name" 
		echo "Table created"

        fi

}

#-----------list-tables-functions--------
list_tables() {

local db_name="$1"
echo "Tables in Database $db_name: "
ls -l "$db_dir/$db_name"

}

#-----------drop-tables-functions--------
drop_table() {
	local db_name="$1"
	read -p "please, Enter table name: " table_name

	if [ -f "$db_dir/$db_name/$table_name" ]; then
                rm "$db_dir/$db_name/$table_name"
		echo "Table dropped properly"
        else
		echo "Table dosn't exist"

	fi

}

insert_into_table() {

}

select_from_table() {

}

delete_from_table(){

}

update_table() {

}
