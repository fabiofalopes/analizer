# ChatGPT, the AI Revolution, and the Security, Privacy and Ethical Implications - SecurityWeek

Created: June 29, 2024 7:18 PM
URL 1: https://www.securityweek.com/chatgpt-the-ai-revolution-and-the-security-privacy-and-ethical-implications/

![https://www.securityweek.com/wp-content/uploads/2023/04/ChatGPT_Security-Ethics-AI.jpg](https://www.securityweek.com/wp-content/uploads/2023/04/ChatGPT_Security-Ethics-AI.jpg)

AI risks to humanity

This is the Age of artificial intelligence (AI). We think it is new, but it isn’t. The AI Revolution has been in progress for many years. What *is* new is the public appearance of the large scale generative pre-trained transformer (GPT) known as ChatGPT (an application of Large Language Models – LLMs).

ChatGPT has breached our absolute sensory threshold for AI. Before this point, the evolution of AI was progressing, but largely unnoticed. Now we are suddenly very aware, as if AI happened overnight. But it’s an ongoing evolution – and is one that we cannot stop. The genius is out of the bottle, and we have little understanding of where it will take us.

At a very basic level, these implications can be divided into areas such as social, business, political, economic and more. There are no clear boundaries between them. For example, social and business combine in areas such as the future of employment.

OpenAI, the developer of ChatGPT published its own research in this area: *An Early Look at the Labor Market Impact Potential of Large Language Models*. ([PDF](https://arxiv.org/pdf/2303.10130.pdf)). It concludes, among other things, “around 19% of workers may see at least 50% of their tasks impacted.”

But we must be clear – these wider effects of AI on society and economics are not our concern here. We are limiting ourselves to discussing the cybersecurity, privacy and ethical implications emerging from the GPT and LLM elements of AI.

# GPT

**ChatGPT-3** (more accurately GPT 3.5) was made available for public use in November 2022. It could generate a meaningful response to most questions, based on the vast amounts of data pre-ingested. People immediately tested it – at first for fun, but then to see if it could be used for non-intended purposes (mostly malicious). WithSecure produced a [study](https://www.securityweek.com/malicious-prompt-engineering-with-chatgpt/) on the use of ChatGPT to improve phishing and social engineering, using prompt engineering on the system’s input.

Check Point found evidence that malicious actors were using it to check and improve the code in their malware. But it is important to note that ChatGPT is just one of many new AI systems becoming available, and they are almost always originally intended for legitimate and beneficial purposes. On March 23, Oxford, UK-based Diffblue announced the granting of three US patents for its own generative AI product, Diffblue Cover. Diffblue Cover uses AI to generate software unit tests to improve code.

Misuse of ChatGPT – and potentially other GPTs – is possible because researchers rapidly learned that it was relatively easy to subvert the safety guardrails put in place to prevent misuse – a process unsurprisingly known as jailbreaking.

**GPT-4** was announced on March 14, 2023, on [Twitter](https://twitter.com/sama/status/1635687853324902401), by. OpenAI CEO Sam Altman: “here is GPT-4, our most capable and aligned model yet. it is available today in our API (with a waitlist) and in ChatGPT+… it is still flawed, still limited, and it still seems more impressive on first use than it does after you spend more time with it.”

The official [announcement](https://openai.com/research/gpt-4) says, “GPT-4 is a large multimodal model (accepting image and text inputs, emitting text outputs) that, while less capable than humans in many real-world scenarios, exhibits human-level performance on various professional and academic benchmarks.”

It’s time to take stock, evaluate the expansion of AI technologies, and project where the AI ride is taking us.

“There are three major differences between GPT3 and GPT4,” says Alex Polyakov, co-founder and CEO at Adversa.ai: “longer memory, support for images, and potentially better safety and security. However, the last one is not as amazing as it sounds, as we still see that prompt injection attacks are possible, jailbreaks still exist, and can even be done in multiple new ways – and it can’t keep secrets.”

The multi-modal image intake is interesting, although still in the early stages of development. “Although it cannot output pictures (as do generative AI models such as DALL-E and Stable Diffusion), it can process and respond to the visual inputs it receives,” wrote Scientific American on March 16. It can identify basic context in images. The magazine points out that future mobile apps could interpret surroundings for visually impaired users. It didn’t mention it could similarly be used in invasive surveillance looking for ‘suspicious behavior’. This is the big conundrum for AI: things designed for good can also be used for bad.

Interaction with GPT is measured by and limited to a specified number of ‘tokens’ (cost per token is also the charging method when charges are applied). The number of permissible tokens per transaction has increased in the publicly available version to 8k tokens – and to 32k tokens in an availability-limited version. A token is approximately four characters in English. The maximum token length available applies to both the input prompt and the output response combined: the longer the question, the shorter the possible answer, and vice versa.

So, 8k tokens would be roughly equivalent to 6,000 words, while 32k tokens would be four-times that amount. This vastly improves the ability to accept more complex inputs and produce longer and more detailed outputs. This, in turn, increases the potential for both use and abuse of the system.

Chester Wisniewski, field CTO of applied research at Sophos, says similar to Polyakov. “Quite a lot has changed and improved, but not all is known. At a high level it seems to be smarter, more accurate and more capable of what we might think of as ‘thinking’ than previous versions, all of which should make its responses even more realistic and capable than before. It’s important to remember that while it will lie to you less frequently, it is still a pretty good liar.”

# Security

In an interview with ABC News on March 16, 2023, Altman was asked, “What is the worst possible outcome?” He replied, “There’s a set of very bad outcomes. One thing I’m particularly worried about is that these models could be used for large scale disinformation. I am worried that these systems, now that they’re getting better at writing computer code, could be used for offensive cyberattacks.”

Disinformation comes from the ability to generate compelling but false narratives. On ChatGPT-3, WithSecure demonstrated the ability to generate convincing phishing emails to help spread such disinformation. Accurate code generation is inevitable – bad guys are already using it to debug and improve malware and change the code sufficient to defeat signature detection. In the future, it will be able to generate new malware.

These possibilities – indeed, probabilities – have already been discovered and discussed by researchers. Jailbreaking is the key – tricking the system into ignoring or bypassing the safety guardrails implemented by the developer. It turns out that this is almost as easy with GPT4 as it was with GPT3. Hallucination is a further danger; that is, the output of data as if it is correct when it is false.

For AI, security is a two-way street: It can be used by malicious actors to abuse victims, while its own security can be abused by those same malicious actors. ChatGPT has already suffered at least one breach that is known. During the week beginning March 20, 2023, OpenAI took the system offline to fix a [flaw](https://www.securityweek.com/chatgpt-data-breach-confirmed-as-security-firm-warns-of-vulnerable-component-exploitation/) that led to the exposure of user information. It was later found that OpenAI’s original fix was [itself flawed](https://www.securityweek.com/openai-patches-account-takeover-vulnerabilities-in-chatgpt/), and that ChatGPT APIs were vulnerable to a bypass.

![https://www.securityweek.com/wp-content/uploads/2023/04/Chester_Wisniewski.png](https://www.securityweek.com/wp-content/uploads/2023/04/Chester_Wisniewski.png)

Chester Wisniewski, Field CTO Applied Research at Sophos.

The use of AI to abuse others is theoretically prevented by internal guardrails designed to prevent misuse. These guardrails have so far been found inadequate. The question then becomes whether they will ever be adequate.

Wisniewski thinks not. “Any system to prevent abuse, but seemingly designed to let the system operate autonomously, will most likely always be able to be bypassed.” He hopes it will become harder as OpenAI and other AI researchers learn more about how jailbreaking is performed, “but it will still be possible.”

John Bambenek, principal threat hunter at Netenrich, also has doubts. “The fundamental cybersecurity problem is how to perform automation on untrusted inputs – and we are nowhere on solving that.”

“I doubt it is possible to create a GPT model that can’t be abused,” adds Mike Parkin, senior technical engineer at Vulcan Cyber. “The challenge long term will be keeping threat actors from abusing the commercially available AI engines. Ultimately though, it will be impossible to keep them from creating their own and using them for whatever purposes they decide.”

![https://www.securityweek.com/wp-content/uploads/2023/04/Stephani-Aceves_Tanium-2048x2048.jpeg](https://www.securityweek.com/wp-content/uploads/2023/04/Stephani-Aceves_Tanium-2048x2048.jpeg)

Stephanie Aceves, Sr. Director, Product Management at Tanium

But there are some hopeful thoughts. Stephanie Aceves, senior director of product management at Tanium, accepts the task is like achieving cybersecurity by turning the computer off and locking it in a vault – but the task should not preempt the attempt. “Risk should not be a showstopper,” she said. “Rather it should be an input to the policies, programs, and guardrails we develop.”

Polyakov doesn’t believe that much can be done to prevent the misuse of AI without a legal framework. But he believes that AI developers can do more to protect their own security. “It will be hard work and a continuous cat and mouse game, but it’s certainly possible to make AI much more secure.”

He further believes that making the systems more secure will have the byproduct of making them more difficult to misuse. “What is more important and amazing is that in making AI models more secure, you may make them more robust and accurate as a byproduct.”

He warns that this should be done sooner rather than later. “The earlier companies start initiatives, the better they will protect their systems and have a competitive advantage. Sometimes the goal is not to be 100% secure but to be more secure than your neighbor.” Criminals tend to attack the easiest target.

![https://www.securityweek.com/wp-content/uploads/2023/04/Andy-Patel-WithSecure.jpeg](https://www.securityweek.com/wp-content/uploads/2023/04/Andy-Patel-WithSecure.jpeg)

Andy Patel, senior researcher at WithSecure

But it may already be too late. “It will never be possible to create a large language model that cannot be abused,” suggests Andy Patel, senior researcher at WithSecure. “Prompt injection aside, many underhanded uses of NLG [natural language generator] models rely on generating text designed to persuade or trick people. Prompts designed to create this type of content, by nature, don’t trigger safety filters or the model’s refusal policy.”

He points to developments outside of OpenAI. “Recent ML advances have precipitated models such as Alpaca, a 6B parameter model that works approximately as well as GPT-3, and that can be run on a laptop. Those models are good enough to generate content that could be used for malicious purposes. I would expect bad guys to be more interested in those models than GPT-4 – at least in the near future. Eventually GPT-4-strength models will be available to all in the same way.”

# Privacy and ethics

Privacy is one of the areas considered most at risk from an unfettered use of AI, and an ethical or unethical implementation of the technology will drive the extent of privacy abuses. *SecurityWeek* spoke to Christina Montgomery, chief privacy & trust officer, and AI ethics board chair at IBM. “The technology is clearly moving faster than society’s ability to build reasonable guardrails around it, and there’s still not enough transparency around how other tech companies are protecting the privacy of data that interacts with their systems,” she said.

![https://www.securityweek.com/sites/default/files/features/Christina-Montgomery-IBM.jpeg](https://www.securityweek.com/sites/default/files/features/Christina-Montgomery-IBM.jpeg)

Christina Montgomery, chief privacy & trust officer, and AI ethics board chair at IBM

The solution must come from both government and industry: government in strong regulations, and industry in a clear ethical use of AI. “There is a real need for our government leaders to work with the private sector on effective, risk-based AI regulation – where the tightest regulatory control focuses on the AI applications with the greatest risk of societal harm.” But while AI must be regulated, privacy must also be protected. “We need a consistent, national privacy law in this country,” she added.

She acknowledges that ChatGPT has guardrails in place, but with clear shortcomings. “That makes proper oversight even more important, especially in a consumer context.” At the enterprise level, she believes the solution must lie in greater use of the principles of ethical use. “We’re at an early stage in public exposure to AI – and I firmly believe that every company involved in this work has an obligation to strengthen trust in the technology.”

She notes that IBM has established ethical principles to the development and use of AI, including questioning not whether something can be done, but whether it should be done. “Our focus is on developing technologies, including generative AI tools, with responsibility and ethics at the forefront and then urging other private sector developers to do the same.”

Finally, she adds, “People need to see more companies leading by example, putting ethics, responsibility, and people’s interests first. ChatGPT is a reminder that these technologies are getting more powerful and that the era of move fast and break things must end.”

Absent regulation, however, privacy abuses will likely continue. “The reason big tech companies collect so much data is to have the training data to create tools like GPT4 in the first place,” comments Bambenek. “We are only scratching the surface of the risks this poses, mostly because the primary use case for these companies is advertising. As long as people are willing to tolerate the privacy invasions for cheap/free service, there isn’t much that will slow this down.”

Aceves is more optimistic. “The short answer is yes, something can be done,” she says. “Organizations like The Cyber Collective are leading the way in educating the average person and initiating change in our current policies.”

Steve Wilson, CPO at Contrast Security, tasked ChatGPT to answer some of the questions *SecurityWeek* was asking, as if it were an ethics professor. “While it might not create entirely new ideas, it can produce novel combinations of existing knowledge and concepts,” responded ChatGPT about ChatGPT.

But that ‘existing knowledge may be false and incomplete. “AI models like ChatGPT can indeed learn and propagate inaccuracies or biases present in the training data,” continued the fake professor. The old adage of ‘garbage in, garbage out’ still applies to the new technologies.

“To address this issue, AI developers must continuously improve the training process by curating diverse, high-quality datasets and incorporating methods to mitigate bias.” But this is the conundrum underlying all ethical attempts to remove bias — it is led by people with existing, perhaps unconscious, biases of their own.

On March 31, 2023, the Italian data protection regulator [blocked ChatGPT](https://www.securityweek.com/italy-temporarily-blocks-chatgpt-over-privacy-concerns/) over concern that it is unlawfully processing personal data protected by GDPR. OpenAI has 20 days to respond, but the potential to hallucinate (give out false information) adds a further complication if it spreads false information about European residents. Then comes the issue of the European ‘right to be forgotten’. How does AI forget?

A further complication comes through other software that uses OpenAI’s GPT. Microsoft has [invested billions](https://www.securityweek.com/microsoft-invests-billions-chatgpt-maker-openai/) in OpenAI, and is clearly very close to the company. ChatGPT has been incorporated into Bing and can be used via Skype.

[https://lh3.googleusercontent.com/0EvMlYQ5wcrU2V2XVMKuJGeWyDP85dFcFzWxniYtCGJPfkyjsZrmie9cH9-A6wOaeOo9vvQs2_VWzs-kPCn9c96XgPD9yNA4_5tBR98pDJ1Djmmlx1j-6mh6L_9o3L3kzh_V0N3y5a_Z8VpAEHoXOg](https://lh3.googleusercontent.com/0EvMlYQ5wcrU2V2XVMKuJGeWyDP85dFcFzWxniYtCGJPfkyjsZrmie9cH9-A6wOaeOo9vvQs2_VWzs-kPCn9c96XgPD9yNA4_5tBR98pDJ1Djmmlx1j-6mh6L_9o3L3kzh_V0N3y5a_Z8VpAEHoXOg)

Graphical user interface, text, application, chat or text message Description automatically generated

If it is found that these internet searches gather PII on GDPR-protected citizens from untrusted internet websites, will Italy block Microsoft?

# Should we be concerned?

The Future of Life Institute published an [open letter](https://www.securityweek.com/musk-scientists-call-for-halt-to-ai-race-sparked-by-chatgpt/) on March 29, 2023: “We call on all AI labs to immediately pause for at least 6 months the training of AI systems more powerful than GPT-4.” The letter cites the *Asilomar AI Principles*, a recognized list of AI governance principles – #20 of which states, “Advanced AI could represent a profound change in the history of life on earth, and should be planned for and managed with commensurate care and resources.”

Response from within the security industry to the letter has been varied. Dan Shiebler, head of machine learning at Abnormal Security, commented, “Personally, I don’t think this letter will achieve much. The cat is out of the bag on these models. The limiting factor in generating them is money and time, and both will fall rapidly. We need to prepare businesses to use these models safely and securely, not try to stop the clock on their development.”

Chenxi Wang, founder and general partner at Rain Capital, is in favor of a pause. “A pause in the AI fever is needed, not just from the business standpoint, but also from the point of view of security and privacy. Until we understand how to assess data privacy, model integrity, and the impact of adversarial data, continued development of AI may lead to unintended social, technical, and cyber consequences.”

But in the final analysis, we will not be able to halt the continued evolution of AI. Two of humanity’s greatest drivers, greed and curiosity, will push AI development forward. Our only hope is that we can control it. The genie is out of the bottle, and isn’t offering any wishes.

**Related**: [Cyber Insights 2023 | Artificial Intelligence](https://www.securityweek.com/cyber-insights-2023-artificial-intelligence/)

**Related**: [White House Unveils Artificial Intelligence ‘Bill of Rights’](https://www.securityweek.com/white-house-unveils-artificial-intelligence-bill-rights/)

**Related**: [Bias in Artificial Intelligence: Can AI be Trusted?](https://www.securityweek.com/bias-artificial-intelligence-can-ai-be-trusted/)

**Related**: [The Starter Pistol Has Been Fired for Artificial Intelligence Regulation in Europe](https://www.securityweek.com/starter-pistol-has-been-fired-artificial-intelligence-regulation-europe/)