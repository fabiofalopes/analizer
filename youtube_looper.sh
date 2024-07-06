#!/bin/bash

# Function to sanitize filenames
sanitize() {
    echo "$1" | tr -dc '[:alnum:]-_.' | tr ' ' '_'
}

# Check if the input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file_with_youtube_links>"
    exit 1
fi

input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Create an output directory
output_dir="youtube_transcripts"
mkdir -p "$output_dir"

# Read the file line by line
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
    output_path="$output_dir/$output_filename"

    echo "Processing: $youtube_url"
    
    # Run the yt command and save the output
    if yt --transcript --lang pt "$youtube_url" > "$output_path" 2>/dev/null; then
        echo "Transcript saved to $output_path"
    else
        echo "Error: Failed to retrieve transcript for $youtube_url"
    fi

    echo "------------------------"

done < "$input_file"

echo "Processing complete. Transcripts are saved in the '$output_dir' directory."
