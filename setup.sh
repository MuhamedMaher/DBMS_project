#!/bin/bash

INSTALL_DIR="$HOME/DBMS-project"

mkdir -p "$INSTALL_DIR"

cp -r * "$INSTALL_DIR"

chmod +x "$INSTALL_DIR/main.sh"

echo "DBMS project installed successfully!"
echo "To run the project, navigate to $INSTALL_DIR and execute ./main.sh"i
