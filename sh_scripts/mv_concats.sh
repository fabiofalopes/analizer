#!/bin/bash

BASE_DIR=$1
CONCATS_DIR="concats"

# Create the concats directory if it doesn't exist
mkdir -p "$CONCATS_DIR"

# Loop through all subdirectories in the base directory
for dir in "$BASE_DIR"/*; do
	  if [ -d "$dir" ]; then
		      # Get the name of the subdirectory
		          dirname=$(basename "$dir")
			      # Create a folder with the same name in the concats directory
			          mkdir -p "$CONCATS_DIR/$dirname"
				      # Move the concat_output1.md file to the new folder
				          mv "$dir/concat_output1.md" "$CONCATS_DIR/$dirname"
					    fi
				    done
