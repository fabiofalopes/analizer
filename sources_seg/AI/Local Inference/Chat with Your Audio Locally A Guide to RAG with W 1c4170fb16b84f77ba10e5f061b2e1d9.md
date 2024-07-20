# Chat with Your Audio Locally: A Guide to RAG with Whisper, Ollama, and FAISS

Created: January 28, 2024 12:31 AM
URL: https://medium.com/@ingridwickstevens/chat-with-your-audio-locally-a-guide-to-rag-with-whisper-ollama-and-faiss-6656b0b40a68

# Chat with Your Audio Locally: A Guide to RAG with Whisper, Ollama, and FAISS

![Chat%20with%20Your%20Audio%20Locally%20A%20Guide%20to%20RAG%20with%20W%201c4170fb16b84f77ba10e5f061b2e1d9/1V1pp3bCMxu1QMuQHRaUd5Q.jpeg](1V1pp3bCMxu1QMuQHRaUd5Q.jpeg)

[Ingrid Stevens](https://medium.com/@ingridwickstevens?source=post_page-----6656b0b40a68--------------------------------)

·

[Follow](https://medium.com/m/signin?actionUrl=https%3A%2F%2Fmedium.com%2F_%2Fsubscribe%2Fuser%2Fe185e71aeaea&operation=register&redirect=https%3A%2F%2Fmedium.com%2F%40ingridwickstevens%2Fchat-with-your-audio-locally-a-guide-to-rag-with-whisper-ollama-and-faiss-6656b0b40a68&user=Ingrid+Stevens&userId=e185e71aeaea&source=post_page-e185e71aeaea----6656b0b40a68---------------------post_header-----------)

3 min read

·

Nov 19, 2023

- -

Uncovering Local Insights in Audio Files

![Chat%20with%20Your%20Audio%20Locally%20A%20Guide%20to%20RAG%20with%20W%201c4170fb16b84f77ba10e5f061b2e1d9/1x0sjJktVzF6SNsUMq87Upw.png](1x0sjJktVzF6SNsUMq87Upw.png)

## Introduction

In this tutorial, we’ll explore a step-by-step process for implementing a 100% local Retrieval Augmented Generation (RAG) system over audio documents. This involves transcribing audio to text using the [OpenAI Whisper API](https://openai.com/research/whisper) and then utilizing local models for tokenization, embeddings, and query-based generation. The emphasis here is on keeping the entire process local, utilizing local language models (LLMs) and avoiding reliance on external servers. This process is **free, requires no API keys, and is completely locally run**

**Links: [README](https://github.com/ingridstevens/whisper-audio-transcriber/tree/main) , [Notebook on GitHub](https://github.com/ingridstevens/whisper-audio-transcriber/blob/main/rag-over-whisper-audio.ipynb)**

## Prerequisites

Before diving into the code, make sure you have the necessary libraries installed. You can do this by running the following commands:

```
pip install whisper langchain
```

## Step 1: Transcribe the Audio

We begin by transcribing the audio file using the Whisper API. Ensure you have the audio file (e.g., “[BryanThe_Ideal_Republic.ogg](https://commons.wikimedia.org/wiki/File:Bryan_-_The_Ideal_Republic.ogg)”) in the correct path.

```
# Import the necessary libraries
import whisper

# Load the base model from Whisper
model = whisper.load_model("base")

# Add your Audio File
audio = "BryanThe_Ideal_Republic.ogg"

# Transcribe the audio file
result = model.transcribe(audio, fp16=False)
print(result["text"])
```

## Step 2: Tokenize and Embed the Text

Tokenizing and creating embeddings allow us to split the transcription into smaller chunks and find similarities between them. We use LangChain for this purpose, specifically the RecursiveCharacterTextSplitter and Ollama Embeddings.

```
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.vectorstores import FAISS
from langchain.embeddings import OllamaEmbeddings
from langchain.llms import Ollama

# Define the text to split
transcription = result["text"]

# Split the text into chunks
splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=100)
texts = splitter.split_text(transcription)

# Print the texts to get an initial look
print(texts)

# Create embeddings for each chunk
embeddings = OllamaEmbeddings()

# Create the vector store using FAISS
docsearch = FAISS.from_texts(texts, embeddings, metadatas=[{"source": str(i)} for i in range(len(texts))])
```

## Step 3: Set up the Local LLM Model and Prompt

Now, we define the local LLM model (Ollama) and set up the prompt for the RAG system. Note: you need to [download the model you’d like to use with Ollama](https://ollama.ai/).

```
# Set up the LLM (you will need to install llama2 using Ollama)
llm = Ollama(model='llama2')

#import chatprompttemplate
from langchain.prompts import PromptTemplate
from langchain.prompts.chat import (
    ChatPromptTemplate,
    SystemMessagePromptTemplate,
    AIMessagePromptTemplate,
    HumanMessagePromptTemplate,
)

# Create the RAG prompt
rag_prompt = ChatPromptTemplate(
    input_variables=['context', 'question'],
    messages=[
        HumanMessagePromptTemplate(
            prompt=PromptTemplate(
                input_variables=['context', 'question'],
                template="""You answer questions about the contents of a transcribed audio file.
                Use only the provided audio file transcription as context to answer the question.
                Do not use any additional information.
                If you don't know the answer, just say that you don't know. Do not use external knowledge.
                Use three sentences maximum and keep the answer concise.
                Make sure to reference your sources with quotes of the provided context as citations.
                \nQuestion: {question} \nContext: {context} \nAnswer:"""
                )
        )
    ]
)

# load in qa_chain
from langchain.chains.question_answering import load_qa_chain
chain = load_qa_chain(llm, chain_type="stuff", prompt=rag_prompt)
```

## Step 4: Set a Query and Find Similar Documents

Define a query and find documents that are semantically similar to the query in the vector store.

```
# Define a query
query = "What are the self-evident propositions in this speech?"

# Find similar documents to the search query
docs = docsearch.similarity_search(query)
print(docs)
```

## Step 5: Generate a Response Using Chain Completion

Generate a response based on the query and the context of similar documents.

```
# Set a response variable to the output of the chain
response = chain({"input_documents": docs, "question": query}, return_only_outputs=True)

# Display the response
print("Based on the provided context, the self-evident propositions in the speech are:")
print("\n".join(response["output_text"]))
```

# Well done!

Congratulations! You’ve successfully implemented a 100% local RAG system over an audio file using the Whisper API, LangChain, and local LLMs. This approach ensures privacy and independence by keeping the entire process on your local machine. Feel free to experiment with different audio files, tokenizers, embedding models, prompts, and queries to improve your results!

## Going Further

I’ve recently updated my notebook to test out different types of RAG, and you can see my results already in the notebook.

**Links: [README](https://github.com/ingridstevens/whisper-audio-transcriber/tree/main) , [Notebook (with code) on GitHub](https://github.com/ingridstevens/whisper-audio-transcriber/blob/main/rag-over-whisper-audio.ipynb)**