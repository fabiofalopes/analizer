# SUMMARY
A guide to implementing a local Retrieval Augmented Generation (RAG) system over audio files using Whisper, Ollama, and FAISS, created by Ingrid Stevens.

# IDEAS:
* Implementing a 100% local RAG system over audio files using Whisper, Ollama, and FAISS
* Transcribing audio files using the OpenAI Whisper API
* Tokenizing and creating embeddings using LangChain and Ollama Embeddings
* Setting up a local LLM model and prompt for the RAG system
* Defining a query and finding similar documents in the vector store
* Generating a response using chain completion
* Keeping the entire process local for privacy and independence
* Experimenting with different audio files, tokenizers, embedding models, prompts, and queries to improve results

# QUOTES:
* "This process is **free, requires no API keys, and is completely locally run**"
* "You answer questions about the contents of a transcribed audio file. Use only the provided audio file transcription as context to answer the question."
* "Do not use any additional information. If you don't know the answer, just say that you don't know. Do not use external knowledge."

# FACTS:
* The Whisper API is used for transcribing audio files
* LangChain is used for tokenizing and creating embeddings
* Ollama Embeddings are used for creating embeddings
* FAISS is used for creating the vector store
* Ollama is used as the local LLM model
* The entire process can be run locally without relying on external servers

# REFERENCES:
* OpenAI Whisper API
* LangChain
* Ollama Embeddings
* FAISS
* Ollama
* LangChain's RecursiveCharacterTextSplitter
* LangChain's vectorstores
* LangChain's llms
* llama2 model
* chatprompttemplate
* langchain.prompts
* langchain.chains.question_answering
* GitHub repository for the project

# RECOMMENDATIONS:
* Experiment with different audio files, tokenizers, embedding models, prompts, and queries to improve results
* Use the provided notebook on GitHub to test out different types of RAG
* Try out different local LLM models and prompts to see how they affect the results
* Consider using this approach for other types of data, such as text or images
