import sys
import os
import subprocess
from pathlib import Path
import hashlib

# main3

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
    #"cria_relatorio_seguranca_00",
    #"cria_relatorio_seguranca_01",
    #"cria_relatorio_seguranca_02",
    "cria_prosa_sec",
]

# Set the root folder to the script's directory
ROOT_FOLDER = Path(__file__).parent.resolve()
OUTPUT_ROOT_DIR = ROOT_FOLDER / "output"
EXTENSION = ".md"

#FABRIC_MODEL = "claude-3-5-sonnet-20240620"
#FABRIC_MODEL = "mixtral-8x7b-32768"
#FABRIC_MODEL = "gpt-4o"
#FABRIC_MODEL = "claude-3-haiku-20240307"
FABRIC_MODEL = "llama3-70b-8192"

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

def get_directory_names(file_list):
    directory_names = set(Path(file).parent.name for file in file_list)
    return "_".join(directory_names)

def get_unique_filename(path, base_name):
    counter = 1
    unique_name = path / f"{base_name}{EXTENSION}"
    while unique_name.exists():
        unique_name = path / f"{base_name}_{counter}{EXTENSION}"
        counter += 1
    return unique_name

def process_content_for_pattern(content, pattern, model, output_filename_base):
    base_output_filename = f"{pattern}_{model}_{output_filename_base}"
    output_file = get_unique_filename(OUTPUT_ROOT_DIR, base_output_filename)

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
        print("Usage: python main.py <file_or_directory1> <file_or_directory2> ... <file_or_directoryN>")
        sys.exit(1)

    input_paths = sys.argv[1:]
    file_list = []

    for input_path in input_paths:
        path = Path(input_path)
        if path.is_dir():
            file_list.extend(path.glob(f"*{EXTENSION}"))
        elif path.is_file() and path.suffix == EXTENSION:
            file_list.append(path)
    
    if not file_list:
        print("No valid files found.")
        sys.exit(1)

    short_filename = generate_short_filename(file_list)
    directory_names = get_directory_names(file_list)
    concatenated_content = concatenate_files(file_list)

    for pattern in PATTERNS:
        process_content_for_pattern(concatenated_content, pattern, FABRIC_MODEL, f"{directory_names}_{short_filename}")
    
    print("Processing complete.")

if __name__ == "__main__":
    main()
