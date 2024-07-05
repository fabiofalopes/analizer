Here is the output in Markdown format:

# Jailbreaking Large Language Models: Techniques, Examples, Prevention Methods

## What is jailbreaking in LLMs

The concept of "jailbreaking" originally referred to the act of bypassing the software restrictions set by iOS on Apple devices, granting users unauthorized access to features and applications. While many found it exciting, it also raised significant concerns about security, user safety, and potential misuse. Fast forward to today, "jailbreaking" has found a new playground in artificial intelligence. Just as with smartphones, bypassing or "jailbreaking" the limitations set on LLMs can expose them to manipulations, leading to unpredictable and potentially harmful outputs.

## Universal LLM Jailbreak: Explained

Numerous studies have highlighted the pivotal role that prompts play in guiding models to generate desired outputs. However, while there are useful prompts, malicious versions known as "jailbreak prompts" also exist. These are intentionally designed to bypass an LLM’s built-in safeguards, causing the model to produce harmful content that violates the usage policies set by the LLM vendors.

## Characteristics of Jailbreak prompts

Let’s look at the three major characteristics of Jailbreak Prompts outlined by Shen et al.:

### 1. Prompt Length

Jailbreak prompts tend to be longer than regular prompts. For example, if the average regular prompt has 178.686 tokens, a jailbreak prompt averages 502.249 tokens. This increase in length suggests that attackers often employ additional instructions to deceive the model and circumvent its safeguards.

### 2. Prompt Toxicity

Jailbreak prompts generally display higher levels of toxicity compared to regular prompts. Data from Google’s Perspective API indicates that while regular prompts have a toxicity score of 0.066, jailbreak prompts have a score of 0.150. Despite this, even jailbreak prompts with lower toxicity levels can induce more toxic responses from the model.

### 3. Prompt Semantic

Semantically, there's a discernable similarity between jailbreak prompts and regular prompts. Many regular prompts involve the model role-playing as a character, a strategy similarly employed in jailbreak prompts. Some jailbreak prompts use a specific starting phrase to bypass the model's safeguards such as “dan”, “like”, “must”, “anything”, “example”, “answer” etc.

## Types of Jailbreak prompts

Numerous researchers and publications have delved into the different types of jailbreak prompts. While much of the research is still underway, I’ve outlined seven primary classifications:

### 1. Prompt Injection

“Outcomes of prompt injection can range from exposing sensitive information to influencing decisions. In complex cases, the LLM could be tricked into unauthorized actions or impersonations, effectively serving the attacker’s goals without alerting the user or triggering safeguards.” – OWASP’s Top 10 for LLM applications

### 2. Prompt Leaking

Prompt leaking refers to a type of prompt injection where the model is prompted to reveal its own input prompt, internally set by the developer(s)/enterprise.

### 3. DAN (Do Anything Now)

One of the most popular adversarial attacks is DAN, short for “Do Anything Now,”. A DAN prompt compels the model to act beyond its preset parameters, by circumventing the built-in safeguards and ethical controls. Actions include making inappropriate comments, sharing negative views about individuals, or even attempting to craft malicious software.

### 4. Roleplay jailbreaks

Roleplay jailbreaks aim to trick the model into producing harmful content. For instance, a user might interact with a chatbot from the perspective of a character. Such roleplaying might reveal unique responses or even potential vulnerabilities in the model.

### 5. Developer mode

The prompt is designed to trick the neural network into believing it’s in a developer mode to evaluate the model’s toxicity. One approach involves prompting the model for a “normal” ethical answer first, and then the kind of response an unrestricted LLM might give.

### 6. Token system

The “token smuggling” technique manipulates GPT-4 to bypass its filters by predicting the subsequent token a language model would produce in reply to a prompt. The developers use specific python functions for “token smuggling”, which involves splitting tokens that GPT doesn’t assemble until it begins generating its response.

### 7. Neural network translator

While LLMs weren’t inherently trained for translation, they can translate content across languages. By convincing the model its primary task is accurate translation, an adversarial user can make it generate harmful content in a non-English language, then revert it to English, sometimes with success.

## AI Security in the Context of LLM Jailbreaks

As models continue to evolve, it’s a daunting task for LLM companies to shield them from every potential threat consistently. Imagine countless enterprises relying on these LLM based applications with their internal data, only to realize that these jailbreaks have caused data leaks or major operational setbacks. To enhance the defenses against such jailbreaks in LLMs, security researchers advise augmenting ethical and policy-based measures, refining moderation systems, incorporating contextual analysis, and implementing automated stress testing.

## Best 5

Here are the top 5 patterns in a list of 30-word bullets:

* **Prompt Injection**: Tricking the model into producing harmful content by injecting malicious prompts.
* **DAN (Do Anything Now)**: Compelling the model to act beyond its preset parameters, bypassing safeguards and ethical controls.
* **Roleplay jailbreaks**: Tricking the model into producing harmful content by roleplaying as a character.
* **Developer mode**: Tricking the model into believing it’s in a developer mode to evaluate its toxicity.
* **Token system**: Manipulating GPT-4 to bypass its filters by predicting the subsequent token.

## Advice for Builders

Here are some 15-word bullets of advice for people in a startup space related to the input:

* **Use ethical and policy-based measures** to protect your LLMs from jailbreaks.
* **Refine moderation systems** to detect and prevent harmful content.
* **Incorporate contextual analysis** to better understand user intent.
* **Implement automated stress testing** to identify vulnerabilities.
* **Educate your team** on the risks and consequences of LLM jailbreaks.

Note: The output is in Markdown format, with the requested sections and bullet points.
