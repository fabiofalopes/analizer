import sys
import os
import subprocess
from pathlib import Path
import hashlib

# Global Variables
PATTERNS = [
    #"analyze_claims",
    #"analyze_incident",
    #"analyze_tech_impact",
    #"create_summary",
    #"create_threat_scenarios",
    #"extract_ideas",
    #"extract_article_wisdom",
    #"extract_extraordinary_claims",
    #"extract_insights",
    #"extract_main_idea",
    #"extract_patterns",
    #"extract_wisdom",
    #"summarize"
    # "analyze_paper",
    # "analyze_presentation",
    #"create_academic_paper",
    # "explain_docs",
    #"write_essay",
    "cria_relatorio_seguranca",
    #cria_relatorio_seguranca_02,
]

# Set the root folder to the script's directory
ROOT_FOLDER = Path(__file__).parent.resolve()
OUTPUT_ROOT_DIR = ROOT_FOLDER / "output"
EXTENSION = ".md"
#FABRIC_MODEL = "claude-3-5-sonnet-20240620"
#FABRIC_MODEL = "mixtral-8x7b-32768"
FABRIC_MODEL = "gpt-4o"

# Create necessary directories if they don't exist
OUTPUT_ROOT_DIR.mkdir(parents=True, exist_ok=True)

def concatenate_files(file_list):
    concatenated_content = ""
    for file_path in file_list:
        with open(file_path, 'r') as file:
            concatenated_content += file.read() + "\n"
    return concatenated_content

def generate_short_filename(file_list):
    concatenated_filenames = "_".join(Path(file).stem[:5] for file in file_list)  # Use first 5 chars of each filename
    hash_object = hashlib.md5(concatenated_filenames.encode())
    short_hash = hash_object.hexdigest()[:8]  # Use only the first 8 characters of the hash
    return short_hash

def process_content_for_pattern(content, pattern, model, output_filename):
    output_file = OUTPUT_ROOT_DIR / f"{pattern}_{model}_{output_filename}{EXTENSION}"

    # Run fabric command and save the output
    with open(output_file, 'w') as outfile:
        process = subprocess.run(
            ['fabric', '--model', model, '-sp', pattern],
            input=content,
            stdout=outfile,
            text=True
        )
        return process.returncode == 0

def main():
    if len(sys.argv) < 2:
        print("Usage: python main.py <doc1.md> <doc2.md> ... <docN.md>")
        sys.exit(1)

    file_list = sys.argv[1:]
    short_filename = generate_short_filename(file_list)
    concatenated_content = concatenate_files(file_list)

    for pattern in PATTERNS:
        process_content_for_pattern(concatenated_content, pattern, FABRIC_MODEL, short_filename)
    
    print("Processing complete.")

if __name__ == "__main__":
    main()

