#!/bin/bash

# Function to loop through .md files and print their paths
count_through_files() {
  local sources_dir="sources"

  find "$sources_dir" -type f -name "*.md" -printf "Found file: %p\n" | while IFS= read -r file; do
    :
  done
  local file_count=$(find "$sources_dir" -type f -name "*.md" | wc -l)
  echo "Total files found: $file_count"
}

# Function to loop through .md files and print their paths
loop_through_files() {
  local sources_dir="sources"

  find "$sources_dir" -type f -name "*.md" | while read -r file; do
    echo "Found file: $file"
  done
}

# Start the looping test
loop_through_files
count_through_files

