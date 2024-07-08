#!/bin/bash

# Function to sanitize filenames (from the original script)
sanitize() {
  local input="$1"
  input=$(echo "$input" | tr -dc '[:alnum:]-_' | tr ' ' '_')
  echo "${input:0:50}"  # Limit the length of the sanitized name
}

copy_original_files() {
  local sources_dir="sources"
  local output_dir="output/processed"

  # Find all .md files in the sources directory
  find "$sources_dir" -type f -name "*.md" | while read -r file; do
    # Get the base name of the file
    local file_name=$(basename "$file" ".md")
    # Sanitize the file name
    local sanitized_file_name=$(sanitize "$file_name")
    # Determine the target processed directory
    local target_dir="$output_dir/$sanitized_file_name"
    
    # Ensure the target directory exists
    if [ -d "$target_dir" ]; then
      # Copy the original file into the target directory
      cp "$file" "$target_dir/original_$file_name.md"
      echo "Copied $file to $target_dir/original_$file_name.md"
    else
      echo "Processed directory $target_dir does not exist. Skipping."
    fi
  done
}

# Execute the copy function
copy_original_files
