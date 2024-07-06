#!/bin/bash

# Function to print usage
usage() {
    echo "Usage: $0 <source_directory> <target_directory>"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Get source and target directories from arguments
SOURCE_DIR="$1"
TARGET_DIR="$2"

# Check if source and target directories exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory does not exist: $TARGET_DIR"
    exit 1
fi

# Iterate over files in the source directory
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")

        # Find matching directory in the target directory
        for dir in "$TARGET_DIR"/*/; do
            dir_name=$(basename "$dir")

            # Check if the directory name matches the filename (without extension)
            if [[ "$dir_name" == "${filename%.*}" ]]; then
                # New file name with "original_" prefix
                new_filename="original_$filename"

                # Copy the file to the corresponding folder in the target directory with new name
                cp "$file" "$dir$new_filename"
                echo "Copied $file to $dir$new_filename"
            fi
        done
    fi
done

echo "Operation completed."

