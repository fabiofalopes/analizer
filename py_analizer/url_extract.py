import os
import re

def extract_urls_from_markdown(base_dir, output_file):
    # Improved regex patterns to match URLs in markdown files
    url_pattern = re.compile(r'URL\s*\d*\s*:\s*(https?://[^\s]+)', re.IGNORECASE)
    
    urls = []

    # Walk through all directories and files from the base directory
    for root, _, files in os.walk(base_dir):
        for file in files:
            if file.endswith('.md'):
                file_path = os.path.join(root, file)
                
                # Debug output: which file is being processed
                print(f'Processing file: {file_path}')
                
                # Open and read each markdown file
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                        
                        # Find all URLs matching the patterns
                        found_urls = url_pattern.findall(content)
                        
                        # Debug output: found URLs in current file
                        if found_urls:
                            print(f'Found URLs in {file_path}: {found_urls}')
                        
                        urls.extend(found_urls)
                except Exception as e:
                    # Debug output: any error while reading a file
                    print(f'Error reading {file_path}: {e}')
    
    # Write all URLs to the output file
    with open(output_file, 'w', encoding='utf-8') as f:
        for url in urls:
            f.write(url + '\n')
            
    print(f'Extracted {len(urls)} URLs and saved to {output_file}')

# Example usage:
# Set your base directory and output file
base_directory = '../sources'
output_file = 'extracted_urls.txt'

extract_urls_from_markdown(base_directory, output_file)
