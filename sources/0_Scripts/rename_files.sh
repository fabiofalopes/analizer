#!/bin/bash

# Check if the directory and input file are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <input_file>"
    exit 1
fi

directory="$1"
input_file="$2"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    exit 1
fi

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' does not exist."
    exit 1
fi

# Create a temporary file for the new names
temp_file=$(mktemp)

# Process each line in the input file
while IFS=',' read -r old_name new_name; do
    # Find the file with the old name
    file=$(find "$directory" -type f -name "${old_name}.*" | head -n 1)
    
    if [ -n "$file" ]; then
        # Get the file extension
        extension="${file##*.}"
        # Add the old and new names to the temp file
        echo "$file|$new_name.$extension" >> "$temp_file"
    fi
done < "$input_file"

# Rename the files
while IFS='|' read -r old_name new_name; do
    mv "$old_name" "$(dirname "$old_name")/$new_name"
    echo "Renamed: $old_name -> $new_name"
done < "$temp_file"

# Clean up
rm "$temp_file"

echo "Renaming process completed."
