import requests
from bs4 import BeautifulSoup

def extract_text(url):
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for HTTP errors

        soup = BeautifulSoup(response.text, 'html.parser')
        text = soup.get_text()

        # Remove unnecessary whitespace
        text = ' '.join(text.split())

        return text
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
        return None

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python extract_text.py <url>")
        sys.exit(1)

    url = sys.argv[1]
    text = extract_text(url)
    if text:
        print(text)