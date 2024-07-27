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

# Function to process a single directory
process_directory() {
  local dir=$1

  # Generate a generic output file name with incrementing number
  OUTPUT_FILE="concat_output"
  INDEX=1
  while [ -f "$dir/$OUTPUT_FILE$INDEX.md" ]; do
    INDEX=$((INDEX + 1))
  done
  OUTPUT_FILE="$dir/$OUTPUT_FILE$INDEX.md"

  # Find and concatenate markdown files in the current directory
  FILES=$(find "$dir" -maxdepth 1 -type f -name "*.md")

  # Create the output file and initialize it as empty
  > "$OUTPUT_FILE"

  for file in $FILES; do
    if [ -f "$file" ]; then
      # Get the file name without extension
      FILE_NAME=$(basename "$file" | sed 's/\.[^.]*$//')

      # Append the file name, separator, and contents of the file to the output file
      echo "### $FILE_NAME" >> "$OUTPUT_FILE"
      echo "---" >> "$OUTPUT_FILE"
      cat "$file" >> "$OUTPUT_FILE"
      echo "---" >> "$OUTPUT_FILE"
    fi
  done

  echo "Concatenation complete in $dir. Output file: $OUTPUT_FILE"
}

# Process the directories
if $RECURSIVE; then
  DIRS=$(find "$INPUT_DIR" -type d)
else
  DIRS=$(find "$INPUT_DIR" -maxdepth 1 -type d)
fi

# Iterate over each directory and process it
for dir in $DIRS; do
  process_directory "$dir"
done

