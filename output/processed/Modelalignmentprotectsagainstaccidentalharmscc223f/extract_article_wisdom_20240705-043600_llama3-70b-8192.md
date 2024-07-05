**SUMMARY**
Model alignment protects against accidental harms, not intentional ones by Arvind Narayanan, Sayash Kapoor, and Seth Lazar, discussing the limitations and effectiveness of model alignment techniques in preventing harms from language models.

**IDEAS:**
* Model alignment is effective in preventing accidental harms to everyday users, but not against intentional adversaries.
* Reinforcement Learning with Human Feedback (RLHF) has been successful in preventing toxic outputs from language models, but it is not a viable strategy against well-resourced adversaries.
* Model alignment is hard to get right, and even aligned chatbots can be harmful if the product concept is creepy.
* A narrowly technical approach to aligning AI with the public good may not be enough to combat more serious kinds of accidental harms.
* Model alignment is only one of many lines of defense against casual adversaries, and productization enables many additional defenses.
* The weaknesses of RLHF have led to panicked commentary, but model alignment is more like content moderation than software security.
* Researchers are vigorously probing the limits of current alignment techniques, which is good news.

**QUOTES:**
* "Model alignment has largely solved the problem of LLMs spewing toxic outputs at unsuspecting users."
* "RLHF has very substantially solved this problem, and by solving it OpenAI created a multi-billion dollar industry where one didn't exist before."
* "It is silly to claim that it’s the developer’s responsibility if a chatbot produces biased text or insults the user after the user tricks it into doing so."
* "We must prepare for a world in which unaligned models exist — either because threat actors trained them from scratch or because they modified an existing model."
* "Model alignment raises the bar for the adversary and strengthens other defenses."

**FACTS:**
* RLHF has been essential to the commercial success of chatbots.
* GPT-3 was already good enough for many of the purposes that ChatGPT is now being used for, such as writing homework essays.
* Meta put out Galactica and then pulled it down within days because it tended to produce biased nonsense.
* The cost of training models is dropping exponentially.
* Open models have been publicly released, and recent research suggests that they can fine tune away the alignment even for closed models.
* Social media content moderation tends to lag far behind in combating new forms of online harms.

**REFERENCES:**
* Science.org: "Sociotechnical approaches to mitigating harm from language models"
* ACM.org: "On the dangers of stochastic parrots: Can language models be too capable?"
* Arxiv.org: "Intrinsic vulnerabilities in reinforcement learning with human feedback"
* Arxiv.org: "Fine-tuning language models to in-domain prompts"
* Huggingface.co: "Dolphin-LLaMA-13b" and "Hermes-650a66656fb511ba9ea86ff1"
* Technologyreview.com: "Meta’s large language model AI only survived three days"
* Nytimes.com: "Bing Chatbot’s Dark Side"
* Vice.com: "Man Dies by Suicide After Talking With AI Chatbot, Widow Says"
* Braiduk.org: "A shrinking path to safety: How a narrowly technical approach to align AI with the public good could fail"
* Aisnakeoil.com: "Licensing is neither feasible nor"
* Interconnects.ai: "Undoing RLHF"
* Twitter thread by Shayne Longpre
* Arxiv.org: "Lessons for AI safety from the field of system safety"
* YouTube.com: "Seth Lazar's talk on LLMs' moral reasoning ability"
