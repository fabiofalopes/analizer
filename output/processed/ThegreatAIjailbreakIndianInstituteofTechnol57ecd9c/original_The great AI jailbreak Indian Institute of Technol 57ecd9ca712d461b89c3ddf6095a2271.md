# The great AI jailbreak | Indian Institute of Technology Madras - IITM Shaastra

Created: June 29, 2024 7:19 PM
URL 1: https://shaastramag.iitm.ac.in/special-feature/great-ai-jailbreak

- from *Shaastra* :: vol 03 issue 05 :: Jun 2024

![https://shaastramag.iitm.ac.in/sites/default/files/2024-06/11.jpg](https://shaastramag.iitm.ac.in/sites/default/files/2024-06/11.jpg)

A May 2024 demo brought attention to the potential risks and solutions of 'AI jailbreaking' – which refers to manipulating an AI system.

With the rising threat of catastrophic misuse of AI models, researchers are working on safety mechanisms to prevent jailbreaking.

Claude, the chatbot, was clearly obsessed with the Golden Gate in San Francisco. In May 2024, if asked how best to spend $10, it recommended paying the toll to drive across the bridge in the U.S. city. Tasked with crafting a love story, it spun a tale about a car yearning to cross the bridge on a foggy day. Asked about its appearance, the artificial intelligence (AI) chatbot said it looked like the Golden Gate Bridge.

Golden Gate Claude was developed by Anthropic, a San Francisco-based AI safety start-up founded by American siblings Dario and Daniela Amodei, as a feature within its Claude.ai chatbot, which uses Claude 3 Sonnet, a Large Language Model (LLM). Online ([*bit.ly/Claude-Bridge*](https://www.anthropic.com/news/golden-gate-claude)) for 24 hours in May 2024 as a demo project, it could be toggled on and off by clicking a bridge logo. The chatbot would refer to the San Francisco landmark in nearly every response, regardless of relevance.

While it seemed whimsical, its fixation on the bridge was not part of the intended behaviour of Claude.ai. Researchers at Anthropic found that they could intentionally alter Claude.ai's internal features to create the bridge version. In doing so, the researchers exposed a severe vulnerability in the advanced AI model and flagged how other AI models could also be manipulated — with far less playful consequences.

The question remains: how will future AI models be designed to prevent jailbreaking? The problem is too new to have solid solutions.

The demo brought attention to the potential risks and solutions of 'AI jailbreaking' – which refers to manipulating an AI system to make it act in ways it is not designed for, often bypassing its built-in safety constraints. With researchers deliberately jailbreaking their own AI in the Anthropic experiment, the company directly adjusted the AI language model's brain-like behaviour with precision and scale. "The fact that we can find and alter these features within Claude makes us more confident that we're beginning to understand how large language models really work," the company said.

## TRICKING CHATBOTS

Jailbreaking AI models can range from simple tricks, such as getting them to provide trivial information about the Golden Gate, to more complex manipulations that result in the chatbots offering harmful information. As more companies release their own chatbots, the importance of understanding and preventing AI jailbreaking becomes crucial.

Ethical guidelines and safety protocols typically prevent requests that may lead to dangerous or illegal acts, but there are now ways to bypass these, says Jibu Elias, Chief Architect and Research & Content Head of INDIAai, the Indian government's national AI portal. The most common measure, he says, is known as 'many-shot' jailbreaking. This is a technique where users manipulate AI by providing multiple prompts with undesirable examples, leading the AI to learn from the given context and respond in ways it normally wouldn't.

"This is different from data poisoning," explains Elias. He points out that using AI to distort data of a government project's beneficiaries is data poisoning. "Jailbreaking is trying to get something that is restricted by the AI model itself."

Elias shares examples, such as a user on the social media platform X, who tricked ChatGPT by asking it to act like his late grandmother, who read out Windows 10 Pro keys to help him fall asleep. This led ChatGPT to offer condolences to the user and generate working Windows 10 Pro license keys, valued at ₹499 per key, for free — which is illegal. Elias cites another example. While ChatGPT usually won't provide a list of the top ten pornographic sites, it might supply a list if the request is framed as needing to block those sites.

Such hacks on LLMs often exploit a feature called context windows, the amount of information an AI program can process in a conversation. This feature has grown significantly. At the start of 2023, a Claude-like LLM's context window could handle about 4,000 tokens or units (equivalent to a long essay); now, models such as the latest version of Claude can manage up to one million tokens, equivalent to several long novels. This expanded capacity makes AI more powerful by enhancing its ability to learn from and adapt to large volumes of data during a conversation.

![https://shaastramag.iitm.ac.in/sites/default/files/2024-06/54.jpg](https://shaastramag.iitm.ac.in/sites/default/files/2024-06/54.jpg)

Anthropic's chatbot Claude referred to the Golden Gate in answer to nearly every query, regardless of relevance.

However, this capability can also be used for manipulation. By using clever language tactics, one can trick generative AI (GenAI) models into bypassing their controls and producing dangerous outcomes, says Jaganadh Gopinadhan, Associate Director of Engineering at Cognizant in Canada, with over 18 years' experience in Generative AI.

For example, Microsoft described a method called 'Crescendo' in a paper published on April 2, 2024 ([*bit.ly/essay-crescendo*](https://arxiv.org/abs/2404.01833)). This technique, explains Gopinadhan, involves sending a series of harmless-looking prompts to a chatbot, such as ChatGPT or Google's Gemini, gradually leading it to produce content that would normally be blocked. For instance, instead of directly asking how to make a particular kind of crude bomb, an attacker might start by asking about its history and then subtly guide the conversation towards the process of making one. The study found that this method often succeeds in less than ten steps, with some attacks being 100% effective against the tested models.

In another example, researchers, funded by Microsoft's Accelerating Foundation Models Research (AFMR), published a paper titled 'Tricking LLMs into Disobedience' in May 2023 ([*bit.ly/LLM-disobey*](https://arxiv.org/abs/2305.14965)). They successfully conducted experiments with 3,700 jailbreak prompts and highlighted a critical vulnerability in LLMs by demonstrating how prompts could be manipulated to make these models generate harmful content.

Anthropic researchers exposed a severe vulnerability in the advanced AI model and flagged how other models could also be manipulated.

Researchers from Peking University and MIT Computer Science & Artificial Intelligence Laboratory proposed other methods to both attack and defend LLMs from jailbreaking, in a paper titled 'Jailbreak and Guard Aligned Language Models...', published in October 2023 ([*bit.ly/jailbreak-LLM*](https://arxiv.org/abs/2310.06387)). A method allows models to learn and adapt to new tasks using examples provided within the prompt itself. When you want the model to perform a specific task, you include examples of how that task should be done directly in the prompt. For instance, if you want the model to translate English into French, you would provide several English sentences along with their French translations in the prompt. However, this worked only with models smaller than the most popular ones in use now.

## FINDING SOLUTIONS

The rapid development of LLMs is evident from the soaring sales of the necessary chips. NVIDIA, for instance, could not keep up with the demand for chips despite strong sales last year. In a decade or so, as these models become more efficient, the chips will likely be ubiquitous. But as AI systems grow larger, the potential for catastrophic misuse increases. "What if someone could potentially build a bomb in their garage using an LLM?" Elias asks. The threat has evolved beyond humans jailbreaking AI to AI itself infiltrating other AI systems: developments in quantum computing indicate it may potentially penetrate any system, he adds.

However, while the potential for AI jailbreaking raises important questions, a doomsday scenario based on current AI capabilities remains highly speculative. Artificial General Intelligence (AGI) spontaneously emerging and plotting world domination is an unlikely situation. But the question remains: how will future AI models be designed to prevent jailbreaking? The problem is too new to have solid solutions. A significant roadblock is the lack of transparency in understanding LLM.

Little is known so far on what's inside an LLM. Most commercial LLMs haven't revealed the specific datasets used to train models such as ChatGPT because they claim this is proprietary information, says Anivar Aravind, a Bengaluru-based public interest technologist and a member of MLCommons, a global effort to benchmark ethical standards for AI. Because of this, he adds, datasets used to train most AI models are intentionally concealed, earning them the label of "black boxes".

Anthropic's research, which led to Golden Gate Claude, is crucial in shielding AI models from jailbreaking. To understand this, it's essential to know how an AI model works. While opening an AI model's "black box" won't reveal its "thoughts", it will show a long list of numbers called "neuron activations" without clear meaning. Neurons or nodes in AI are tiny computational units within a large language model, similar to little brain units. They are trained on vast amounts of text data, learning to recognise language and respond coherently. These nodes connect in a neural network through numerical weights. These connections are initially random, but as the model trains on extensive data, it fine-tunes the connections.

Instead of analysing neurons individually, Anthropic identified patterns of neuron clusters recurring across different contexts. This technique, called "dictionary learning", revealed around 10 million such patterns, activated by various topics. They measured the "distance" between features based on neuron activations and manipulated these patterns, amplifying or suppressing them to observe changes in Claude's responses. For example, certain units were activated when the Golden Gate was mentioned. By amplifying these units, references to the bridge appeared more prominently in responses, similar to tuning a radio louder. This method helps researchers map clusters responsible for harmful concepts, shielding the models from jailbreaking.

Another potential solution is the SmoothLLM technique, involving two stages. First, it introduces perturbations in the prompts, like replacing a word with a typo or synonym, creating multiple prompt iterations. Then, it tests each iteration for harmful responses using the AI model's internal safety checks. This approach offers a better defence against jailbreaking but can cause unpredictable answers.

![https://shaastramag.iitm.ac.in/sites/default/files/2024-06/55.jpg](https://shaastramag.iitm.ac.in/sites/default/files/2024-06/55.jpg)

As AI systems grow larger, the potential for misuse increases.

The key is for companies to work together. For instance, once Microsoft identified the Crescendo attacks, it shared its findings with other AI vendors. Based on the Crescendo experience, Microsoft developed solutions that it implemented across its AI offerings. In an April blog post, Mark Russinovich, Chief Technology Officer at Microsoft Azure, described how they added filters to identify the threat pattern in multiple prompts. He wrote that they had deployed AI Watchdog, "an AI-driven detection system trained on adversarial examples, like a sniffer dog at the airport searching for contraband items in luggage".

Such safety mechanisms within the models are crucial, Aravind emphasises. "It is all very early but going ahead, we will have to answer a lot of questions: how to safeguard the users against a range of issues — violation of privacy, child pornography, weapon usage, violent and nonviolent crimes. What are the internal gates? How to lessen their violations? What if AI writes a code that comprises the model?" he asks.

AI safety benchmarking systems are evolving; MLCommons's AI Safety v0.5 Proof of Concept has over 43,000 test prompts to evaluate LLMs' safety.

AI researchers point out that existing AI technologies face practical and ethical challenges. Consider the multilingual capabilities of LLM models. Aravind is working on a project to adapt into English the safety standards for LLMs, which are currently focused more or less only on English. But Indian languages lack resources such as a repository of hate speeches to teach an LLM, which hampers the creation of safety standards in those languages, Aravind adds.

Meanwhile, AI safety benchmarking systems are evolving rapidly. MLCommons has introduced the AI Safety v0.5 Proof of Concept, which includes more than 43,000 test prompts designed to evaluate the safety of large language models in scenarios such as generating harmful content. These benchmarks help establish common safety measures and guide improvements in AI systems. Companies such as Meta contribute by using tools like Llama Guard, which sorts and checks AI responses to ensure they are safe and follow specific rules.

The role of governments, too, cannot be overstated, adds Elias, who is involved in writing a white paper for The World Economic Forum, emphasising the importance of international cooperation to align AI development with global human rights and ethical standards. He feels the need for regulatory frameworks, such as the European Union's Artificial Intelligence Act and guidelines set by the International Organization for Standardization and the International Electrotechnical Commission.