#!/bin/bash

# Check if both arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Both file path and text string must be specified."
    exit 1
fi

# Assign the arguments to variables
writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"  # Create the necessary directories
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create the directory path $dirpath."
        exit 1
    fi
fi

# Write the content to the file (overwrite if it exists)
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create or write to the file $writefile."
    exit 1
fi

# Success message
echo "File $writefile successfully created/overwritten with the content."
