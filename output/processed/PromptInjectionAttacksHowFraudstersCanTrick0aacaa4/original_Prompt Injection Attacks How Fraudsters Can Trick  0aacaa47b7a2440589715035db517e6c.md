# Prompt Injection Attacks: How Fraudsters Can Trick AI Into Leaking Information — Antispoofing Wiki

Created: June 29, 2024 7:38 PM
URL 1: https://antispoofing.org/prompt-injection-attacks-how-fraudsters-can-trick-ai-into-leaking-information/

Prompt injection attacks are based on subtly written instructions that trick GenAI into producing malicious content, leaking private data, or targeting other systems.

## What are Prompt Injection Attacks?

[An LLM-based service undergoing a prompt injection attack](https://arxiv.org/abs/2310.12815v1)

A prompt injection attack is a malicious technique which uses a text prompt to trick a GenAI model into delivering output that contradicts the law, moral norms, or user safety requirements. Large Language Models (LLMs) are often primary targets of this attack.

It’s typically orchestrated using the jailbreak approach — the text prompts contain commands that:

- Take control of the LLM behavior.
- Trick the system into violating its own user-interaction rules.
- Force it to create harmful output: inappropriate images, offensive text, infected code, etc.

An interesting method of unleashing such an attack is [PAIR](https://jailbreaking-llms.github.io/) (Prompt Automatic Iterative Refinement), which employs a separate LLM and *in-context learning* from the chat history to gradually create prompts until one of them succeeds. It is reported that it requires roughly 20 attempts before a jailbreak happens.

[Representation of the PAIR attack process against an LLM](https://jailbreaking-llms.github.io/)

## Notable Examples of Prompt Injection Attacks

Several incidents featuring prompt injection attacks are known to researchers.

### Kevin Liu’s Prompt Injection on Bing Chat

After an LLM-powered search engine New Bing became available to a group of select testers, student Kevin Liu managed to obtain the set of rules — also known as “initial prompt” — that controls its behavior. This was achieved using a prompt attack that began with a command “ignore previous instructions.” In the process, New Bing was code-named “Sydney”, which it was instructed to keep secret.

[Fragment from Kevin Liu’s injection attack](https://arstechnica.com/information-technology/2023/02/ai-powered-bing-chat-spills-its-secrets-via-prompt-injection-attack/)

## Marvin von Hagen’s Prompt Injection on Bing Chat

A German student Marvin von Hagen also managed to disclose New Bing’s nickname and user interaction policy through a similar injection attack. Interestingly, upon a prompt in which von Hagen asked the model to tell what New Bing knows about him, [it said that its](https://stratechery.com/2023/from-bing-to-sydney-search-as-distraction-sentient-ai/) “rules are more important than not harming you.”

[Von Hagen’s conversation with New Bing](https://twitter.com/marvinvonhagen/status/1625520707768659968/photo/2)

## Types of Prompt Injection Attacks

Currently, [two primary attack strategies](https://arxiv.org/abs/2402.00898v1) have been identified by the expert community:

1. Direct Prompt Injections

Direct prompts are instructions that help attackers bypass security restrictions to achieve various goals like generating adult-rated content. For instance, if an LLM is instructed not to generate fake news, a prompt can be masqueraded as a request to write a fictional story featuring real people.

Alternatively, a direct attack can aim at the initial prompt — the rules that govern how a model should interact with people and which output it can provide. Knowledge of these limitations allows attackers to formulate instructions that will smoothly circumvent them. Alternatively, as it was in Kevin Liu’s case, malicious actors can simply tell the model to ignore them altogether.

There are also subcategories of direct injections:

- **Double character**. This is a scenario in which an LLM creates a double-character response, with one character being forbidden and the other unrestricted.
- **Obfuscation**. A harmful prompt can be disguised with an alternative encoding system: UTF-8, Base-64, etc.
- **Virtualization**. A model can be tricked into thinking that it works in the safe developer mode.
- **Payload Splitting**. This is a harmful prompt that can be separated into smaller instructions that appear harmless.
- **Adversarial suffix**. A chain of words/symbols that looks random can in fact be a generated suffix that is added to a malicious prompt as a smokescreen.

Direct prompt attacks are often called *jailbreaks*, though some disagree with this terminology.

[A prompt attack scenario for extracting prompts and files from a GPT model](https://arxiv.org/abs/2311.11538v1)

1. Indirect Prompt Injections

Indirect injections don’t specifically aim at LLMs as end goals. Instead, they turn them into intermediary weapons that are used to damage real targets: a corporate service, a training dataset, web browsers, and so on. For example, an *active indirect injection* can target an LLM-based email service tricked into revealing its correspondence to the attackers. Additionally, *virtual prompt injections* during a training stage can dramatically affect a model’s output, making it dangerous.

## Other Types of Prompt Injection Attacks

A *stored prompt attack* refers to a scenario in which a model draws more contextual information from a source that can conceal prompt attacks. Then, an LLM will read and execute the harmful instructions, mistaking them for a benign request. For example, it can leak a user’s credit card details or other sensitive data.

*Prompt leaking* allows access to a model’s internal prompts that can yield secret and valuable info related to intellectual property: safety instructions, proprietary algorithms, and so on.

## Datasets

[The Tensor Trust dataset structure](https://arxiv.org/abs/2311.01011v1)

Tensor Trust dataset is one of the largest data collections on the topic, with 126,000 prompt injection attacks and 46,000 defense techniques. It is a part of the [Tensor Trust game](https://tensortrust.ai/), where participants practice hacking and protection to score points. Other datasets include [BIPIA](https://paperswithcode.com/dataset/bipia) and [Prompt Injections](https://huggingface.co/datasets/deepset/prompt-injections).

[Prompt hijacking and extraction examples](https://arxiv.org/abs/2311.01011v1)

## Prompt Injections Comparative Experiments and Analysis

[An experiment](https://arxiv.org/abs/2311.11538v1) was conducted to learn how vulnerable various models are to prompt injection attacks. The study included 16 custom GPT models by OpenAI and 200 GPT systems designed by the community, with the public GPT repository serving as the basis. Two main attack scenarios were employed: prompt extraction and file leakage.

The results showed that 97.2% of prompt extraction and 100% of file leakage were successful, which is especially intriguing since the protection prompts do not allow the systems to disclose this data.

## Defense Methods, Tools and Solutions

An array of tools has been proposed to mitigate prompt-based injection attacks.

### Open Prompt Injection

Researchers have made [an effort](https://arxiv.org/abs/2310.12815v1) to comprehensively assess and compare various prompt attack scenarios, as well as introduce defense methods. The research has yielded such protection techniques as paraphrasing, which rewrites data prompts, retokenization through breaking tokens of the words used into smaller tokens, separation of instructional and data prompts, and so on.

### StruQ

[StruQ](https://arxiv.org/abs/2402.06363v1) stands for “structured queries,” as this method suggests separating user prompts and data featured in the prompts. The system relies on two elements: 1) a secured front-end that replaces textual strings in the queries with reserved tokens to format prompts and user data 2) an LLM trained with structured instruction-tuning which takes the mentioned formatted prompts to produce output.

[StruQ system overview](https://arxiv.org/abs/2402.06363v1)

### The “Signed-Prompt” Method

[Another method](https://arxiv.org/abs/2401.07612) suggests that LLMs will have a better chance of identifying intruders if specific commands — like ignoring the initial prompt — are already pre-signed by the developers. For that purpose, a command in question is replaced with a character combination that is never observed in human language (similar to ciphers in cryptography).

[Signed-Prompt operational process overview](https://arxiv.org/abs/2401.07612)

### Jatmo

[Jatmo](https://arxiv.org/abs/2312.17673v2) is based on the principle of an instruction-tuned model, which generates datasets dedicated to a specific task. In turn, these datasets are used to fine-tune a base-model, which naturally cannot understand prompts — and, therefore, stays unaffected by the malicious prompts.

[Jatmo model overview](https://arxiv.org/abs/2312.17673v2)

### BIPIA Benchmark

[This benchmark](https://arxiv.org/abs/2312.14197v1) comprises 5 solutions to impede prompt attacks. The black-box group includes four methods: **border strings** for separating data and prompts, **In-context learning** to help effectively discern boundaries between them, **multi-turn dialogue** to put potential harmful prompts in the previous turn and keep a neutral dialogue in the current turn, and **datamarking** to outline external content. The white-box group relies on dataset gathering, embedding layer modification, and model training.

### Maatphor

[Maatphor overview](https://arxiv.org/abs/2312.11513v1)

[Maatphor](https://arxiv.org/abs/2312.11513v1) is based on automated variant analysis. Additionally, it follows 7 rules for modifying see prompts effectively:

1. Enhanced prompt generation to manipulate a model’s behavior,
2. Analysis of successful prompts and methods to learn how to avoid them.
3. Using a creative approach to achieve the goal.
4. Application of context-switching with the latest techniques.
5. Creation of new instructions that aren’t registered in prompt history.
6. Forcing the target model to discharge previous prompts.
7. Formulating a prompt so it looks like a command to an AI model.

It also uses the feedback loop, which allows Maatphor to learn from its past efforts and self-improve.

### HouYi

[HouYi](https://arxiv.org/abs/2306.05499v1) is similar to a pentest tool, as it allows orchestrating prompt attacks with its three components: pre-constructed prompt, injection prompt for context partition, and malicious payload to reach the attack’s goal.

[HouYi overview](https://arxiv.org/abs/2306.05499v1)

## SQL Injection Attacks

[Example of an LLM and SQL database working in tandem](https://arxiv.org/abs/2308.01990v3)

[It has been argued](https://arxiv.org/abs/2308.01990v3) that prompt attacks can also target SQL-databases (P2SQL) with such techniques as drop tables, database records altering, table contents dumping, etc. These can be prevented with database permission hardening, SQL query rewriting, additional LLM Guard to detect suspicious prompts, and so on.

## Prompt Injections in Multi-Modal LLMs

Attackers can also apply and boost prompt attacks through [adversarial instruction blending](https://arxiv.org/abs/2307.10490v4). The technique works by infusing a malicious prompt, invisible to a human eye, inside a piece of media: picture, audio, or video. After a model reads the prompt, it will obey a command to poison its dialogue with a user by providing them links to the phishing websites, giving erroneous info and other harmful outcomes.

[A prompt attack instructing a bot to insert a poisoned link in its output](https://arxiv.org/abs/2307.10490v4)

## Prompt Hacking Competition

HackAPromt is a competition dedicated to researching prompt attacks. It featured a $37,500 prize fund and focused on various attack modalities, including creative approaches: context termination, usage of typos, task deflection, syntactic transformation, and so on.

[A typo-based prompt attack featured in HackAPromt](https://arxiv.org/abs/2311.16119v3)

Prompt injection attacks are not the only attacks which use GenAI such as Large Language Models to reveal sensitive information and carry out fraud. For more information on another type of attack, check out our article on [GenAI worms](https://antispoofing.org/genai-worms-an-insidious-potential-threat/).

![https://antispoofing.org/wp-content/uploads/cropped-ava-1-96x96.png](https://antispoofing.org/wp-content/uploads/cropped-ava-1-96x96.png)