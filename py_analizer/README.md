# Fabric Processor Script

This script processes markdown files using the `fabric` command with various patterns and models. It concatenates the content of specified files or all files in a given directory and generates output files with unique names.

## Features

- Processes individual markdown files or all markdown files in a specified directory.
- Allows changing the file extension type globally.
- Ensures output filenames are unique to avoid overwriting.
- Supports multiple processing patterns and models.

## Prerequisites

- Python 3.x
- `fabric` command-line tool installed and accessible in your PATH.

## Installation

1. Clone the repository or download the script.
2. Ensure `fabric` is installed and properly configured.

## Usage

Run the script with the paths to the files or directories you want to process.

### Example

To process specific markdown files:

```sh
python main.py /path/to/file1.md /path/to/file2.md
