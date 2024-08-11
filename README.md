# Bash Shell Script Database Management System (DBMS):

## The Project aim to develop DBMS, that will enable users to store and retrieve the data from Hard-disk.

## The Project Features:
The Application will be CLI Menu based app, that will provide to user this Menu items:
Main Menu:
- Create Database
- List Databases
- Connect To Databases
- Drop Database
- Exit

## Upon user Connect to Specific Database, there will be new Screen with this Menu:
- Create Table 
- List Tables
- Drop Table
- Insert into Table
- Select From Table
- Delete From Table
- Update Table

## Installation
To install the DBMS project on your local machine, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/dbms-project.git](https://github.com/MohamedMaher77/DBMS_project.git
2. Navigate to the project directory:

   ```bash
   cd DBMS-project
4. Run the setup script:

   ```bash
   ./setup.sh
6. Once installed, navigate to the installation directory and run the main script:

   ```bash
   cd ~/DBMS-project
   ./main.sh

   #!/bin/bash

# Setup script for DBMS project

# Define the installation directory
INSTALL_DIR="$HOME/dbms_project"

# Create the installation directory
mkdir -p "$INSTALL_DIR"

# Copy the project files to the installation directory
cp -r * "$INSTALL_DIR"

# Make the main script executable
chmod +x "$INSTALL_DIR/main.sh"

# Provide instructions to the user
echo "DBMS project installed successfully!"
echo "To run the project, navigate to $INSTALL_DIR and execute ./main.sh"






