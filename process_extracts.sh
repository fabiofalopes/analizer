#!/bin/bash

# Hardcoded variables
PATTERNS=("extract_ideas" "create_summary" "analyze_claims")
ROOT_FOLDER="/home/kali/projectos/analizer/output"
OUTPUT_DIR="$ROOT_FOLDER/processed"
KNOWLEDGE_DIR="$ROOT_FOLDER/knowledge"
CONCATS_DIR="$KNOWLEDGE_DIR/concats"

# Create necessary directories if they don't exist
mkdir -p "$KNOWLEDGE_DIR"
mkdir -p "$CONCATS_DIR"

# Iterate through each pattern
for PATTERN in "${PATTERNS[@]}"; do
  # Iterate through each article folder
  for article_folder in "$OUTPUT_DIR"/*; do
    if [ -d "$article_folder" ]; then
      # Define the concatenated output file for the current article and pattern
      ARTICLE_NAME=$(basename "$article_folder")
      CONCAT_FILE="$CONCATS_DIR/${ARTICLE_NAME}_${PATTERN}.md"

      # Create or empty the concatenated output file
      : > "$CONCAT_FILE"

      # Concatenate all files matching the pattern in the current folder
      for file in "$article_folder"/*"$PATTERN"*; do
        if [ -f "$file" ]; then
          cat "$file" >> "$CONCAT_FILE"
          echo -e "\n---\n" >> "$CONCAT_FILE"  # Separator between files
        fi
      done
    fi
  done

  # Process each concatenated file with the desired model and save the output
  #for concat_file in "$CONCATS_DIR"/*"${PATTERN}.md"; do
  #  OUTPUT_FILE="$KNOWLEDGE_DIR/academic_reflection_$(basename #"$concat_file" .md).txt"
  #  cat "$concat_file" | fabric -sp "write_academic_reflection" > #"$OUTPUT_FILE"
  #done
#done

