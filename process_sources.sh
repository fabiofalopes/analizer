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
  local model_list=(
    "llama3-70b-8192"
    "mixtral-8x7b-32768"
    "llama3-8b-8192"
    "gemma2-9b-it"
    "gemma-7b-it"
    "claude-3-haiku-20240307" # Paid model, used if others fail
  )

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

  local current_date_time=$(date +'%Y%m%d-%H%M%S')

  # Start processing
  {
    echo "Processing file: $file"

    for method in "${methods[@]}"; do
      local success=0
      for model in "${model_list[@]}"; do
        output_file="${output_dir}/${method}_${current_date_time}_${model}.md"
        if output=$(cat "$file" | fabric --model "$model" -p "$method" 2>&1); then
          if [[ ! "$output" == *"rate_limit_exceeded"* ]]; then
            echo "$output" > "$output_file"
            echo "Saved output of $method using $model to $output_file"
            success=1
            break
          else
            echo "Rate limit error with model $model, trying next model."
          fi
        else
          echo "Error processing file: $file with method: $method using model: $model. Output: $output"  # Log the error output for debugging
        fi
      done
      
      if [ $success -eq 0 ]; then
        local fallback_model="claude-3-haiku-20240307"
        output_file="${output_dir}/${method}_${current_date_time}_${fallback_model}.md"
        output=$(cat "$file" | fabric --model "$fallback_model" -p "$method" 2>&1)
        echo "$output" > "$output_file"
        echo "Fallback to $fallback_model: Saved output of $method using $fallback_model to $output_file"
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
