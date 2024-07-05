#!/bin/bash

# Handle SIGPIPE to avoid BrokenPipeError
handle_sigpipe() {
  echo "Caught SIGPIPE, exiting cleanly." >> /tmp/process_and_extract.log
  exit
}

trap handle_sigpipe SIGPIPE

sanitize() {
  local input="$1"
  input=$(echo "$input" | tr -dc '[:alnum:]-_' | tr ' ' '_')
  echo "${input:0:50}"  # Limit the length of the sanitized name
}

process_and_extract() {
  local file="$1"
  local output_dir="$2"

  # Ensure the output directory exists
  mkdir -p "$output_dir"

  local methods=(
    analyze_claims
    analyze_incident
    #analyze_paper
    #analyze_presentation
    analyze_tech_impact
    #create_academic_paper
    create_summary
    create_threat_scenarios
    #explain_docs
    extract_article_wisdom
    extract_extraordinary_claims
    extract_ideas
    extract_insights
    extract_main_idea
    extract_patterns
    extract_wisdom
    summarize
    #write_essay
  )

  # Log file
  local log_file="/tmp/process_and_extract.log"

  # Start processing
  {
    echo "Processing file: $file"

    for method in "${methods[@]}"; do
      output_file="${output_dir}/${method}.txt"
      if output=$(cat "$file" | fabric -p "$method" 2>&1); then
        echo "$output" > "$output_file"
        echo "Saved output of $method to $output_file"
      else
        echo "Error processing file: $file with method: $method. Output: $output"  # Log the error output for debugging
      fi
    done

  } >> "$log_file" 2>&1
}

process_files() {
  local sources_dir="sources"
  local output_dir="output/processed"
  local log_file="/tmp/process_and_extract.log"

  mkdir -p "$output_dir"

  export FABRIC_OUTPUT_PATH="$output_dir"

  find "$sources_dir" -type f -name "*.md" | while read -r file; do
    local file_name=$(basename "$file" ".md")
    local sanitized_file_name=$(sanitize "$file_name")
    local output_subdir="$output_dir/$sanitized_file_name"
    mkdir -p "$output_subdir"
    process_and_extract "$file" "$output_subdir"
  done
}

# Main script execution
process_files
