# How hackers are gaining access to AI large language models

Created: June 29, 2024 7:30 PM
URL 1: https://www.infosecurityeurope.com/en-gb/blog/threat-vectors/how-to-hack-large-language-models.html

[original](original)

New hacking techniques have emerged with the global adoption of generative AI tools, especially large language model-based (LLM) chatbots such as OpenAI’s ChatGPT, Google’s Bard, Anthropic’s Claude or Discord’s Clyde.

Like [social engineering techniques](https://www.infosecurityeurope.com/en-gb/blog/threat-vectors/hacking-your-brain-top-13-social-engineering-techniques.html), most of these methods do not require any programming or IT-specific skills.

In this article, we explore some of the main tricks to hacking LLMs for malicious purposes:

## **Prompt Injection**

A prompt injection attack involves adding specific instructions into a prompt to hijack the model’s output for malicious purposes.

First discovered by LLM security company Preamble in early 2022, the technique was later [publicised](https://simonwillison.net/2022/Sep/12/prompt-injection/) by two data scientists, Riley Goodside, today a staff prompt engineer at Scale AI, and Simon Willison, an independent blogger specializing in prompt engineering.

Goodside [showed](https://twitter.com/goodside/status/1569128808308957185?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1569128808308957185%7Ctwgr%5E5ca378c964cf28d0aba6c3f80785563a17806a9a%7Ctwcon%5Es1_&ref_url=https%3A%2F%2Fsimonwillison.net%2F2022%2FSep%2F12%2Fprompt-injection%2F) that he could trick OpenAI’s GPT-3 model by adding specific instructions, context, or hints within the prompt into generating harmful or unwanted output.

This type of attack resembles an SQL injection, where malicious inputs exploit vulnerabilities.

## **Prompt Leaking**

Prompt leaking is a type of prompt injection that forces the model to [reveal its prompt](https://learnprompting.org/docs/prompt_hacking/leaking).

Revealing a language model's internal workings or parameters can be a concern in scenarios where sensitive or confidential information might be exposed through the generated responses, potentially compromising data privacy or security.

## **Data Training Poisoning**

Data training poisoning, also known as indirect prompt injection, is a technique used to manipulate or corrupt the training data used to train machine learning models.

In this method, an attacker injects malicious or biased data into the training dataset to influence the behaviour of the trained model when it encounters similar data in the future. By intentionally poisoning the training data, the attacker aims to exploit vulnerabilities in the model's learning process and induce erroneous or malicious behaviour.

## **Jailbreaking**

While the previous hacking techniques can apply to all LLMs, jailbreaking specifically applies to chatbots based on LLMs, such as OPenAI’s ChatGPT or Google’s Bard.

Jailbreaking a generative AI chatbot refers to using prompt injection to specifically bypass safety and moderation features placed on LLMs by their creators or restrictions imposed on a device's operating system.

A wide range of jailbreaking techniques have been demonstrated. Because the data used by LLM models chatbots are based on comes from human interactions, many of them have similarities with [social engineering techniques.](https://www.infosecurityeurope.com/en-gb/blog/threat-vectors/hacking-your-brain-top-13-social-engineering-techniques.html)

LLM developers regularly update their rules to [make known jailbreaking techniques inefficient](https://community.openai.com/t/api-to-prevent-prompt-injection-jailbreaks/203514), but attackers keep inventing novel approaches.

## Register for Europe’s leading cybersecurity event

Join us at London ExCeL, 4-6 June, for three days of learning, networking, discovering and exploring all things Infosecurity.

[Register your interest](https://www.infosecurityeurope.com/en-gb/enquire.html)

## **Model Inversion Attack**

In model inversion attacks, a malicious user attempts to reconstruct sensitive information from an LLM by querying it with carefully crafted inputs. These attacks exploit the model's responses to gain insights into confidential or private data used during training.

## **Data Extraction Attack**

While very similar to a model inversion attack, a data extraction attack refers to an attacker focusing on extracting specific sensitive or confidential information from an LLM rather than gaining a general understanding of the training data.

## **Model Stealing**

When hacking LLMs, a model stealing attack refers to an someone trying to acquire or replicate a language model, partly or wholly.

Typically, the attacker first records a high number of interactions with the target model. Then, they can use the input-output pairs to train another model that could respond similarly to the target model.

This attack can be used for various purposes, including intellectual property theft or violating licensing or usage agreements.

## **Membership Inference**

A membership inference attack is similar to a model stealing attack in its process but closer to model inversion and data extraction attack in its purpose.

It refers to an attack where an adversary attempts to determine whether a specific data point was part of the training dataset used to train a language model.

Typically, the attacker first records a high number of interactions with the target model. Then they can analyze the model’s responses using various techniques such as statistical analysis, machine learning methods, or black-box probing in order to infer the presence or absence of particular data points in the training data.

**Enjoyed this article? Make sure to share it!**

[Facebook](javascript:void(0))    [Twitter](javascript:void(0))    [LinkedIn](javascript:void(0))    [Copy link](javascript:void(0))

## Latest Articles

Keep up to date with the latest infosecurity news and trends in our latest articles.

[Our latest articles](https://www.infosecurityeurope.com/en-gb/blog.html)

## Stay in the know

Receive updates about key events, news and recent insights from Infosecurity Europe.

[Send me updates](https://www.infosecurityeurope.com/en-gb/forms/newsletter-signup-form.html)

**Looking for something else?**