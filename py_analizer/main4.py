import sys
import subprocess
import time
from pathlib import Path
import hashlib
from transformers import AutoTokenizer

# Variáveis Globais
PATTERNS = ["cria_prosa_sec"]
ROOT_FOLDER = Path(__file__).parent.resolve()
OUTPUT_ROOT_DIR = ROOT_FOLDER / "output"
EXTENSION = ".md"
FABRIC_MODEL = "llama3-70b-8192"
TOKENIZER_MODEL = "bert-base-uncased"
TOKENS_PER_MINUTE_LIMIT = 6000
CHUNK_SIZE = 4000  # Ajuste para o tamanho máximo de tokens por parte
MAX_FILENAME_LENGTH = 255  # Comprimento máximo para o nome do arquivo

# Criação de diretórios necessários
OUTPUT_ROOT_DIR.mkdir(parents=True, exist_ok=True)

def concatenate_files(file_list):
    concatenated_content = ""
    for file_path in file_list:
        with open(file_path, 'r', encoding='utf-8') as file:
            concatenated_content += file.read() + "\n"
    return concatenated_content

def generate_short_filename(file_list):
    concatenated_filenames = "_".join(Path(file).stem[:2] for file in file_list)  # Usando apenas 2 caracteres do nome do arquivo
    hash_object = hashlib.md5(concatenated_filenames.encode())
    short_hash = hash_object.hexdigest()[:8]
    return short_hash

def get_directory_names(file_list):
    return "_".join(set(Path(file).parent.name[:2] for file in file_list))  # Usando apenas 2 caracteres do nome do diretório

def get_unique_filename(path, base_name):
    if len(base_name) > MAX_FILENAME_LENGTH - len(str(path)) - len(EXTENSION) - 5:
        print("Filename too long, defaulting to a generic name 'HUGE'")
        base_name = f"HUGE_{hashlib.md5(base_name.encode()).hexdigest()[:8]}"
    
    counter = 1
    unique_name = path / f"{base_name}{EXTENSION}"
    while unique_name.exists():
        unique_name = path / f"{base_name}_{counter}{EXTENSION}"
        counter += 1
    return unique_name

def get_tokenizer(model_name):
    try:
        return AutoTokenizer.from_pretrained(model_name)
    except Exception as e:
        print(f"Failed to load tokenizer: {e}")
        sys.exit(1)

def calculate_pause_duration(num_tokens):
    tokens_per_second = TOKENS_PER_MINUTE_LIMIT / 60.0
    return num_tokens / tokens_per_second

def divide_content(content, encoded_tokens, num_parts):
    tokens_per_part = len(encoded_tokens) // num_parts
    chunks = []
    start = 0
    for i in range(num_parts):
        end_index = start + tokens_per_part
        if i == num_parts - 1:  # last chunk includes remainder
            end_index = len(encoded_tokens)
        chunk_tokens = encoded_tokens[start:end_index]
        chunks.append(content[start:end_index])
        start = end_index
    return chunks

def process_content_for_pattern(content, encoded_tokens, pattern, model, output_filename_base):
    base_output_filename = f"{pattern}_{model}_{output_filename_base}"
    output_file = get_unique_filename(OUTPUT_ROOT_DIR, base_output_filename)

    total_tokens = len(encoded_tokens)
    print(f"Total number of tokens: {total_tokens}")

    num_parts = (total_tokens // CHUNK_SIZE) + (1 if total_tokens % CHUNK_SIZE != 0 else 0)
    chunks = divide_content(content, encoded_tokens, num_parts)

    with open(output_file, 'w', encoding='utf-8') as outfile:
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

            num_tokens = len(chunk.split())
            time.sleep(calculate_pause_duration(num_tokens))

    return True

def find_all_md_files(base_path):
    md_files = list(base_path.rglob(f"**/*{EXTENSION}"))
    print(f"Debug: Encontrou {len(md_files)} arquivos .md em {base_path}: {md_files}")
    return md_files

def main():
    if len(sys.argv) < 2:
        print("Usage: python main3.py <file_or_directory1> <file_or_directory2> ... <file_or_directoryN>")
        sys.exit(1)

    input_paths = sys.argv[1:]
    file_list = []

    for input_path in input_paths:
        input_path = Path(input_path)
        if input_path.is_dir():
            print(f"Debug: Explorando diretório {input_path}")
            md_files = find_all_md_files(input_path)
            file_list.extend(md_files)
        elif input_path.is_file() and input_path.suffix == EXTENSION:
            print(f"Debug: Adicionando arquivo {input_path}")
            file_list.append(input_path)

    print(f"Debug: Arquivos encontrados: {file_list}")

    if not file_list:
        print("No valid files found.")
        sys.exit(1)

    short_filename = generate_short_filename(file_list)
    directory_names = get_directory_names(file_list)
    concatenated_content = concatenate_files(file_list)

    tokenizer = get_tokenizer(TOKENIZER_MODEL)
    encoded_tokens = tokenizer.encode(concatenated_content)

    for pattern in PATTERNS:
        if not process_content_for_pattern(concatenated_content, encoded_tokens, pattern, FABRIC_MODEL, f"{directory_names}_{short_filename}"):
            print(f"Processing failed for pattern: {pattern}")

    print("Processing complete.")

if __name__ == "__main__":
    main()