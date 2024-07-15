#!/bin/bash

# Handle SIGPIPE to avoid BrokenPipeError
handle_sigpipe() {
  echo "Caught SIGPIPE, exiting cleanly." >> /tmp/youtube_process_and_extract.log
  exit
}

trap handle_sigpipe SIGPIPE

# Function to sanitize filenames
sanitize() {
    echo "$1" | tr -dc '[:alnum:]-_.' | tr ' ' '_'
}

process_and_extract() {
  local file="$1"
  local output_dir="$2"
  local model_list=(
    "claude-3-5-sonnet-20240620"
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
    #analyze_presentation
    #analyze_tech_impact
    #capture_thinkers_work
    #create_idea_compass
    create_keynote
    #create_mermaid_visualization
    create_summary
    #create_reading_plan
    extract_wisdom
    provide_guidance
    improve_academic_writing
    extract_patterns
  )

  # Log file
  local log_file="/tmp/youtube_process_and_extract.log"

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
  local input_file="$1" # Take the first argument as the input file
  local sources_dir="youtube_transcripts"
  local log_file="/tmp/youtube_process_and_extract.log"

  # Ensure input file exists
  if [ ! -f "$input_file" ]; then
      echo "Error: Input file '$input_file' not found."
      exit 1
  fi

  # Create the sources directory if it doesn't exist
  mkdir -p "$sources_dir"

  # Process each YouTube link
  while IFS= read -r youtube_url || [[ -n "$youtube_url" ]]; do
      # Remove any leading/trailing whitespace
      youtube_url=$(echo "$youtube_url" | xargs)

      # Skip empty lines
      if [ -z "$youtube_url" ]; then
          continue
      fi

      # Extract video ID from the URL
      video_id=$(echo "$youtube_url" | sed -n 's/.*v=\([^&]*\).*/\1/p')

      if [ -z "$video_id" ]; then
          echo "Warning: Could not extract video ID from $youtube_url. Skipping."
          continue
      fi

      # Create a sanitized output filename
      output_filename=$(sanitize "${video_id}_transcript.txt")
      output_path="$sources_dir/$output_filename"

      echo "Processing: $youtube_url"

      # Run the yt command and save the output
      if yt --transcript --lang pt "$youtube_url" > "$output_path" 2>/dev/null; then
          echo "Transcript saved to $output_path"
          local sanitized_file_name=$(sanitize "$video_id")
          local output_subdir="${sources_dir}/${sanitized_file_name}_processed"
          mkdir -p "$output_subdir"
          process_and_extract "$output_path" "$output_subdir"
      else
          echo "Error: Failed to retrieve transcript for $youtube_url"
      fi

      echo "------------------------"

  done < "$input_file"

  echo "Processing complete. Transcripts and analyses are saved in the 'youtube_transcripts' directory."
}

# Main script execution
process_files "$1" # Pass the first argument to the process_files function
