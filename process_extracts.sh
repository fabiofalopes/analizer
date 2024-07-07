#!/bin/bash

# Hardcoded variables
PATTERNS=(
  "analyze_claims"
  "analyze_incident"
  "analyze_tech_impact"
  "create_summary"
  "create_threat_scenarios"
  "extract_ideas"
  "extract_article_wisdom"
  "extract_extraordinary_claims"
  "extract_insights"
  "extract_main_idea"
  "extract_patterns"
  "extract_wisdom"
  "summarize"
  # "analyze_paper"
  # "analyze_presentation"
  # "create_academic_paper"
  # "explain_docs"
  # "write_essay"
)
ROOT_FOLDER="/home/kali/projectos/analizer/output"
OUTPUT_DIR="$ROOT_FOLDER/processed"
KNOWLEDGE_DIR="$ROOT_FOLDER/knowledge"
CONCATS_DIR="$KNOWLEDGE_DIR/concats"

# Create necessary directories if they don't exist
mkdir -p "$KNOWLEDGE_DIR"
mkdir -p "$CONCATS_DIR"

# Iterate through each pattern
for PATTERN in "${PATTERNS[@]}"; do
  # Define the concatenated output file for the current pattern
  CONCAT_FILE="$CONCATS_DIR/${PATTERN}.md"

  # Create or empty the concatenated output file
  : > "$CONCAT_FILE"

  # Iterate through each article folder
  for article_folder in "$OUTPUT_DIR"/*; do
    if [ -d "$article_folder" ]; then
      # Concatenate all files matching the pattern in the current folder
      for file in "$article_folder"/*"$PATTERN"*; do
        if [ -f "$file" ]; then
          FILENAME=$(basename "$file")
          echo "### $FILENAME" >> "$CONCAT_FILE"
          echo "---" >> "$CONCAT_FILE"
          cat "$file" >> "$CONCAT_FILE"
          echo -e "\n---\n" >> "$CONCAT_FILE"  # Separator between files
        fi
      done
    fi
  done
done
