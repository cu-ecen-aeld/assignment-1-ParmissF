#!/bin/bash

# Check if the required arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Both directory path and search string must be specified."
    exit 1
fi

# Assign the arguments to variables
filesdir="$1"
searchstr="$2"

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory."
    exit 1
fi

# Initialize counters for files and matching lines
file_count=0
matching_lines_count=0

# Find all files in the directory (including subdirectories)
for file in $(find "$filesdir" -type f); do
    # Increment file count
    ((file_count++))
    
    # Count the matching lines in the current file
    matching_lines=$(grep -c "$searchstr" "$file")
    
    # Add the number of matching lines to the total
    ((matching_lines_count+=matching_lines))
done

# Print the results
echo "The number of files are $file_count and the number of matching lines are $matching_lines_count"
