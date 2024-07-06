#!/bin/bash

# Function to display usage information
usage() {
  echo "Usage: $0 [-r] <input_dir>"
  echo "Options:"
  echo "  -r        Recursively search through subdirectories"
  echo "Example:"
  echo "  $0 /dir/target"
  echo "  $0 -r /dir/target"
  exit 1
}

# Check for -r option and set RECURSIVE flag
RECURSIVE=false
if [ "$1" == "-r" ]; then
  RECURSIVE=true
  shift
fi

# Check if input directory is provided
if [ $# -ne 1 ]; then
  usage
fi

INPUT_DIR=$1

# Validate the input directory
if [ ! -d "$INPUT_DIR" ]; then
  echo "Error: $INPUT_DIR is not a directory."
  exit 1
fi

# Get the directory of the input dir
OUTPUT_DIR=$(dirname "$INPUT_DIR")

# Generate a generic output file name with incrementing number
OUTPUT_FILE="concat_output"
INDEX=1
while [ -f "$OUTPUT_DIR/$OUTPUT_FILE$INDEX.md" ]; do
  INDEX=$((INDEX + 1))
done
OUTPUT_FILE="$OUTPUT_DIR/$OUTPUT_FILE$INDEX.md"

# Find and concatenate markdown files
if $RECURSIVE; then
  FILES=$(find "$INPUT_DIR" -type f -name "*.dart")
else
  FILES=$(find "$INPUT_DIR" -maxdepth 1 -type f -name "*.dart")
fi

# Create the output file and initialize it as empty
> "$OUTPUT_FILE"

for file in $FILES; do
  if [ -f "$file" ]; then
    # Get the file name without extension
    FILE_NAME=$(basename "$file" | sed 's/\.[^.]*$//')

    # Calculate the relative path from the lib directory to the current file
    RELATIVE_PATH=$(echo "$file" | sed "s|^${INPUT_DIR}/||" | sed 's|/[^/]*$||')

    # Append the file name, separator, and contents of the file to the output file
    echo "### ${RELATIVE_PATH}/${FILE_NAME}" >> "$OUTPUT_FILE"
    echo "---" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo "---" >> "$OUTPUT_FILE"
  fi
done

echo "Concatenation complete. Output file: $OUTPUT_FILE"
