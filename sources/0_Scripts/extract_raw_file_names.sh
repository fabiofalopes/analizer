#!/bin/bash

# Check if the directory is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory="$1"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    exit 1
fi

# Create the output file
output_file="raw_filenames.txt"

# Extract filenames without extensions
find "$directory" -type f | while read -r file; do
    filename=$(basename "$file")
    name_without_ext="${filename%.*}"
    echo "$name_without_ext" >> "$output_file"
done

echo "Raw filenames have been extracted to $output_file"
