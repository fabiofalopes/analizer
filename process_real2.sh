#!/bin/bash

# Global Variables
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

ROOT_FOLDER="${ROOT_FOLDER:-/home/kali/projectos/sources}"
INPUT_DIR="${INPUT_DIR:-$ROOT_FOLDER/processed}"
OUTPUT_ROOT_DIR="${OUTPUT_ROOT_DIR:-$ROOT_FOLDER/knowledge/essays}"
FABRIC_MODEL="${FABRIC_MODEL:-mixtral-8x7b-32768}"
FABRIC_SP="${FABRIC_SP:-my_write_essay}"
EXTENSION="${EXTENSION:-.out}"

# Create necessary directories if they don't exist
mkdir -p "$OUTPUT_ROOT_DIR"

# Function to process files for a given pattern
process_files_for_pattern() {
  local pattern=$1
  local pattern_output_dir="$OUTPUT_ROOT_DIR/$pattern"

  # Create the output directory if it doesn't exist
  mkdir -p "$pattern_output_dir"

  # Iterate through each news folder
  for news_folder in "$INPUT_DIR"/*; do
    if [ -d "$news_folder" ]; then
      # Process all files matching the pattern in the current folder, excluding 'concat' and 'original' in their names
      for file in "$news_folder"/*"$pattern"*; do
        if [ -f "$file" ] && [[ "$file" != *concat* ]] && [[ "$file" != *original* ]]; then
          local filename=$(basename "$file")
          local output_file="$pattern_output_dir/$filename$EXTENSION"

          # Run fabric command and save the output
          cat "$file" | fabric --model "$FABRIC_MODEL" -sp "$FABRIC_SP" > "$output_file"
        fi
      done
    fi
  done
}

# Iterate through each pattern
for pattern in "${PATTERNS[@]}"; do
  process_files_for_pattern "$pattern"
done

echo "Processing complete."
