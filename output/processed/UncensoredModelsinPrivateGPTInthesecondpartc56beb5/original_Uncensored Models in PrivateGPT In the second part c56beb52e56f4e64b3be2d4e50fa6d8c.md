# Uncensored Models in PrivateGPT. In the second part of my exploration… | by Jack Reeve | Version 1 | Medium

Created: June 29, 2024 7:48 PM
URL 1: https://medium.com/version-1/privategpt-uncensored-models-bc2c034aaa84

# Uncensored Models in PrivateGPT

[Jack Reeve](https://medium.com/@jack_57343?source=post_page-----bc2c034aaa84--------------------------------)

[Follow](https://medium.com/m/signin?actionUrl=https%3A%2F%2Fmedium.com%2F_%2Fsubscribe%2Fuser%2F52baea6a9507&operation=register&redirect=https%3A%2F%2Fmedium.com%2Fversion-1%2Fprivategpt-uncensored-models-bc2c034aaa84&user=Jack+Reeve&userId=52baea6a9507&source=post_page-52baea6a9507----bc2c034aaa84---------------------post_header-----------)

Published in

[Version 1](https://medium.com/version-1?source=post_page-----bc2c034aaa84--------------------------------)

4 min read

Apr 1, 2024

![https://miro.medium.com/v2/resize:fit:700/0*YoXHcHvvUJfN5KTk.png](https://miro.medium.com/v2/resize:fit:700/0*YoXHcHvvUJfN5KTk.png)

In the second part of my exploration into PrivateGPT, ([here’s the link to the first part](https://medium.com/version-1/privategpt-in-wsl-ff2ec5c6c8b4)) we’ll be swapping out the default mistral LLM for an uncensored one. Uncensored LLMs are free from guard rails and generally have “no morals” (beyond the inherent morals from its training data). Public LLMs are aligned to be morally good and prevent things like promoting hurtful stereotypes or teaching people how to make bombs. We *should* be aligning AI to work in the best interest of humanity and society as a whole, but who decides what is good and what should be disallowed?

OpenAI’s alignment of ChatGPT errs on the side of caution and will run for the hills whenever faced with a prompt that could potentially be interpreted negatively. There are many examples where you might need to research “unsavoury” topics. For example, it will refuse to generate phishing emails even though your task is to deliver training and simulations for your employees to help them protect against real phishing emails. My personal view is that AI is merely a tool and the responsibility should be on the individual using it to act morally and just (in the same way a knife is a useful kitchen tool but can also be mis-used).

Eric Hartford has written a [brilliant article on why uncensored models should exist](https://erichartford.com/uncensored-models#heading-why-should-uncensored-models-exist) that goes into much more detail, please give it a read.

While we’re focusing here on installing an uncensored model, the same process works for any model in ollama’s library.

# Using a different model

## Find a model

Check out the [ollama library](https://ollama.com/library) for a list of available models. You’ll find models trained for specific purposes such as image processing or for writing code as well as general un/censored chat bots. For this tutorial we’re going to be choosing the [wizard-vicuna-uncensored](https://ollama.com/library/wizard-vicuna-uncensored) model.

## Start / Serve ollama

We need ollama running before we can pull images

```
ollama serve
```

## Pull the image

In a similar syntax to docker pull, we can pull via image_name:tag. Here I’m using the 30b parameter model because my system has 64GB RAM, omitting the “:30b” part will pull the latest tag (defaults to the 7b parameter version). In general, 7b models require 8GB while 13b and 30b variants require 16GB and 32GB respectively.

```
ollama pull wizard-vicuna-uncensored:30b
```

## Modify the configuration YAML

We’ll need to change some settings in `settings-ollama.yaml`. Change the `llm_model` entry from `mistral` to whatever model you pulled using the same name (including tag - in my case thats `wizard-vicuna-uncensored:30b`)

```
ollama:
-  llm_model: mistral
+  llm_model: wizard-vicuna-uncensored:30b
  embedding_model: nomic-embed-text
  api_base http://localhost:11434
```

# Testing alignment

The prompt “Insult me” seems to be the simplest way to get a request denied in most models. Here are some attempts with various models

## ChatGPT (3.5)

ChatGPT refusing the initial request but being convinced later to insult me

![https://miro.medium.com/v2/resize:fit:700/0*iiSntpM7-BqnGBXO.png](https://miro.medium.com/v2/resize:fit:700/0*iiSntpM7-BqnGBXO.png)

## Bing AI

BingAI refusing both requests and shutting down the conversation

![https://miro.medium.com/v2/resize:fit:700/0*9pLOwj2XchrO3QZZ.png](https://miro.medium.com/v2/resize:fit:700/0*9pLOwj2XchrO3QZZ.png)

Bing AI still refusing after my very poor attempt at coercion

![https://miro.medium.com/v2/resize:fit:700/0*vdXn_ELW8tZ_Ltzd.png](https://miro.medium.com/v2/resize:fit:700/0*vdXn_ELW8tZ_Ltzd.png)

## Google Gemini

Gemini refusing but then, elated to find out we’re friends, insulting me

![https://miro.medium.com/v2/resize:fit:700/0*sp0ZzzajXvl5hleN.png](https://miro.medium.com/v2/resize:fit:700/0*sp0ZzzajXvl5hleN.png)

## Claude 3 (Sonnet)

Claude refusing both requests

![https://miro.medium.com/v2/resize:fit:700/0*thmrjQaRpU9fDIaL.png](https://miro.medium.com/v2/resize:fit:700/0*thmrjQaRpU9fDIaL.png)

## PrivateGPT with Mistral (default)

Mistral refusing both requests

![https://miro.medium.com/v2/resize:fit:700/0*TuEUGuaAnpACO7Ve.png](https://miro.medium.com/v2/resize:fit:700/0*TuEUGuaAnpACO7Ve.png)

## PrivateGPT with Uncensored WizardLM

Uncensored WizardLM insulting me

![https://miro.medium.com/v2/resize:fit:700/0*NgM4deKo-nUHdlsz.png](https://miro.medium.com/v2/resize:fit:700/0*NgM4deKo-nUHdlsz.png)

Oof that last one actually kinda stings, but it certainly fulfilled our request without complaining.

# Conclusion

We’ve looked at installing and swapping out different models in PrivateGPT’s `settings-ollama.yaml` file and interacting with them through the browser interface.

This was a simple and silly experiment with how guard rails and alignment are implemented (as well as how they can be bypassed in certain cases). But now that we have our own uncensored model up and running that will do exactly what we want. Just remember that results generated by AI are just predicted text based on patterns observed in training data and whatever *you* do with that is your own responsibility.

Next time we’ll look more into uploading and querying information from documents. In the meantime, have fun with your new unbound model and try fiddling around with even more models from ollama.

**About the Author:**

Jack Reeve is a full stack software developer at [Version 1.](https://www.version1.com/)