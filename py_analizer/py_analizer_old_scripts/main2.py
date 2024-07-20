import sys
import os
import subprocess
import time
from pathlib import Path
import hashlib
from transformers import AutoTokenizer

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

# Limites de taxa do modelo (ajuste conforme necessário)
TOKENS_PER_MINUTE_LIMIT = 6000

# Cria diretórios necessários se eles não existirem
OUTPUT_ROOT_DIR.mkdir(parents=True, exist_ok=True)

def concatenate_files(file_list):
    concatenated_content = ""
    for file_path in file_list:
        with open(file_path, 'r') as file:
            concatenated_content += file.read() + "\n"
    return concatenated_content

def generate_short_filename(file_list):
    concatenated_filenames = "_".join(Path(file).stem[:5] for file in file_list)
    hash_object = hashlib.md5(concatenated_filenames.encode())
    short_hash = hash_object.hexdigest()[:8]
    return short_hash

def get_directory_names(file_list):
    return "_".join(set(Path(file).parent.name for file in file_list))

def get_unique_filename(path, base_name):
    counter = 1
    unique_name = path / f"{base_name}{EXTENSION}"
    while unique_name.exists():
        unique_name = path / f"{base_name}_{counter}{EXTENSION}"
        counter += 1
    return unique_name

def tokenize_and_chunk(content, tokenizer, chunk_size):
    tokens = tokenizer.encode(content)
    return [tokenizer.decode(tokens[i:i + chunk_size], skip_special_tokens=True) for i in range(0, len(tokens), chunk_size)]

def get_tokenizer(model_name):
    try:
        return AutoTokenizer.from_pretrained(model_name)
    except Exception as e:
        print(f"Failed to load tokenizer: {e}")
        sys.exit(1)

def calculate_pause_duration(num_tokens):
    tokens_per_second = TOKENS_PER_MINUTE_LIMIT / 60.0
    return num_tokens / tokens_per_second

def process_content_for_pattern(content, pattern, model, output_filename_base, tokenize=False):
    base_output_filename = f"{pattern}_{model}_{output_filename_base}"
    output_file = get_unique_filename(OUTPUT_ROOT_DIR, base_output_filename)

    tokenizer = get_tokenizer(model) if tokenize else None
    chunk_size = 5500
    chunks = tokenize_and_chunk(content, tokenizer, chunk_size) if tokenize else [content[i:i + chunk_size] for i in range(0, len(content), chunk_size)]

    with open(output_file, 'w') as outfile:
        for i, chunk in enumerate(chunks):
            print(f"Processing chunk {i + 1}/{len(chunks)}")
            while True:
                process = subprocess.run(
                    ['fabric', '--model', model, '-sp', pattern],
                    input=chunk,
                    stdout=subprocess.PIPE,
                    text=True
                )
                if process.returncode == 0:
                    outfile.write(process.stdout + "\n")
                    break
                else:
                    print(f"Error: {process.stdout}; retrying after delay...")
                    time.sleep(10)

            num_tokens = len(tokenizer.encode(chunk)) if tokenizer else len(chunk.split())
            time.sleep(calculate_pause_duration(num_tokens))

    return True

def main():
    if len(sys.argv) < 2:
        print("Usage: python main2.py [-t] <file_or_directory1> <file_or_directory2> ... <file_or_directoryN>")
        sys.exit(1)

    tokenize = '-t' in sys.argv
    input_paths = sys.argv[2:] if tokenize else sys.argv[1:]

    file_list = [
        path for input_path in input_paths for path in (Path(input_path).glob(f"*{EXTENSION}") if Path(input_path).is_dir() else [Path(input_path)]) 
        if path.suffix == EXTENSION
    ]

    if not file_list:
        print("No valid files found.")
        sys.exit(1)

    short_filename = generate_short_filename(file_list)
    directory_names = get_directory_names(file_list)
    concatenated_content = concatenate_files(file_list)

    for pattern in PATTERNS:
        if not process_content_for_pattern(concatenated_content, pattern, FABRIC_MODEL, f"{directory_names}_{short_filename}", tokenize=tokenize):
            print(f"Processing failed for pattern: {pattern}")

    print("Processing complete.")

if __name__ == "__main__":
    main()