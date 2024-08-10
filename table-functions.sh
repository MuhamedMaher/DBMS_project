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
                read -p "please, Enter columns names (comma-separated): " columns
		echo "$columns" > "$db_dir/$db_name/$table_name" 
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

#-----------insert-tables-functions--------
insert_into_table() {
	local db_name="$1"
        read -p "please, Enter table name: " table_name

    if [ ! -f "$db_dir/$db_name/$table_name" ]; then
        echo "Table '$table_name' does not exist."
        return
    fi

    # Read the columns
    columns=$(head -n 1 "$db_dir/$db_name/$table_name")
    IFS=',' read -r -a column_array <<< "$columns"

    # Prepare to collect the row values
    row_values=""

    # Loop to get input for each column
    for column in "${column_array[@]}"; do
        read -p "Enter value for $column: " value
        row_values="$row_values$value|"
    done

    # Remove the last '|' and append the row to the table
    row_values="${row_values%|}"
    echo "$row_values" >> "$db_dir/$db_name/$table_name"
    echo "Record inserted successfully."


}

#-----------select-tables-functions--------
select_from_table() {
    local db_name="$1"
    read -p "please, Enter table name: " table_name

    if [ ! -f "$db_dir/$db_name/$table_name" ]; then
        echo "Table '$table_name' does not exist."
        return
    fi

    awk 'BEGIN { FS="|"; OFS="\t" } {print $0}' "$db_dir/$db_name/$table_name"

}

#-----------delete-from-tables-functions--------
delete_from_table(){

    local db_name="$1"
    read -p "please, Enter table name: " table_name

    if [ ! -f "$db_dir/$db_name/$table_name" ]; then
        echo "Table '$table_name' does not exist."
        return
    fi

    read -p "Enter column name to search: " search_column
    read -p "Enter value to search for: " search_value

    column_number=$(awk -v col="$search_column" 'BEGIN{FS=","; OFS="|"} NR==1 {for (i=1; i<=NF; i++) if ($i==col) print i}' "$db_dir/$db_name/$table_name")

    if [ -z "$column_number" ]; then
        echo "Invalid column name."
        return
    fi

    awk -v sc="$column_number" -v sv="$search_value" 'BEGIN{FS="|"; OFS="|"} NR==1 || $sc != sv {print $0}' "$db_dir/$db_name/$table_name" > temp && mv temp "$db_dir/$db_name/$table_name"
    echo "Record deleted successfully."

}

#-----------update-tables-functions--------
update_table() {

   local db_name="$1"
   read -p "please, Enter table name: " table_name

       	if [ ! -f "$db_dir/$db_name/$table_name" ]; then
        echo "Table '$table_name' does not exist."
        return
    fi

    read -p "Enter column name to search: " search_column
    read -p "Enter value to search for: " search_value
    read -p "Enter column name to update: " update_column
    read -p "Enter new value: " new_value

    column_number=$(awk -v col="$search_column" 'BEGIN{FS=","; OFS="|"} NR==1 {for (i=1; i<=NF; i++) if ($i==col) print i}' "$db_dir/$db_name/$table_name")
    update_column_number=$(awk -v col="$update_column" 'BEGIN{FS=","; OFS="|"} NR=1 {for (i=1; i<=NF; i++) if ($i==col) print i}' "$db_dir/$db_name/$table_name")

    if [ -z "$column_number" ] || [ -z "$update_column_number" ]; then
        echo "Invalid column name."
        return
    fi

    awk -v sc="$column_number" -v sv="$search_value" -v uc="$update_column_number" -v nv="$new_value" 'BEGIN{FS="|"; OFS="|"} NR==1 || $sc != sv {print $0} NR>1 && $sc == sv {$uc=nv; print $0}' "$db_dir/$db_name/$table_name" > temp && mv temp "$db_dir/$db_name/$table_name"
    echo "Record updated successfully."
}

