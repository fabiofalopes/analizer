# Social Engineering The Intersection of Artificial Intelligence

Created: June 29, 2024 5:30 PM
URL: https://versprite.com/blog/the-intersection-of-artificial-intelligence-and-social-engineering-next-generation-threats/

### Date

September 28, 2023

### Authors

James Sibley

### Follow Us

Social engineering attacks are formidable because they use human psychology to perpetrate crimes and obtain confidential information. Cybercriminals exploit trust in these attacks, making social engineering one of the most dangerous adversaries in an ever-evolving landscape of cybersecurity threats.

Social engineering attacks manipulate human psychology rather than exploiting technical vulnerabilities, making them challenging to defend against. Threat actors increasingly turn to artificial intelligence (AI) to enhance their social engineering tactics as technology advances.

This article delves into the convergence of AI and social engineering, exploring the methods employed by threat actors and the strategies that Offensive Security (OffSec) teams can use to improve your enterprise’s defenses against these next-generation threats.

## The AI-Powered Social Engineering Landscape

Social engineering attacks have exploited human trust for decades to obtain sensitive information or compromise security. These attacks employ diverse techniques, including phishing, smishing (SMS phishing), vishing (voice phishing), and pretexting, which rely on fabricated stories to deceive individuals into taking specific actions like clicking a link, disclosing information, or assisting in unethical behavior. With the advent of AI tools, including large language models, malicious actors have gained a sophisticated toolkit that significantly amplifies the effectiveness and scale of these schemes. AI augments these attacks in several ways:

- **Data Analysis and Planning:** It analyzes large datasets to identify high-value targets or vulnerabilities. With its ability to rapidly generate attack ideas, threat scenarios, and plans, AI optimizes the focus and effectiveness of targeted social engineering attacks. Additionally, it streamlines the attacker’s workflow by parsing unstructured data, enabling more effective planning and execution.
- **Credibility and Reach:** It enhances the credibility and reach of attacks by mimicking trusted writing styles and breaking language barriers. This makes it easier to target a diverse set of victims globally and increases the likelihood of successful deception.
- **Execution and Deception:** It automates creating and distributing malicious code tailored for social engineering attacks, making the campaigns more efficient and harder to trace. Furthermore, it produces a variety of deceptive materials, both digital and physical. Digital deception includes emails and counterfeit documents generated to mimic the language of known, trustworthy individuals, while physical deception leverages other AI tools to create voice clones of executives or deepfake videos. These can be used to deceive security personnel into granting unauthorized access or facilitating different forms of physical intrusion.

### Natural Language Processing (NLP) and Chatbots

Large Language Models (LLMs) like ChatGPT have become instrumental tools in social engineering attacks. An LLM is a machine learning model designed for various natural language processing (NLP) tasks, such as generating and classifying text. The term “large” signifies the model’s capacity to adjust hundreds of billions of parameters as it learns autonomously. Threat actors implement these LLMs to construct advanced chatbots that engage in nuanced, context-sensitive dialogues with potential victims.

These chatbots convincingly mimic tech support, customer service, coworkers, friends, and family roles. Their capabilities streamline the illicit extraction of information and the initiation of harmful activities. Furthermore, threat actors exploit a wide array of tools for their schemes. They jailbreak commonly used tools like ChatGPT, Google Bard, and Claude and harness publicly available open-source foundational models like LLaMA, Falcon, and BLOOM. OffSec teams can fine-tune these foundational models further for specific malicious activities. Given the permanent availability of these tools, it’s imperative to understand how they can be weaponized.

Specialized AI tools like WormGPT emerge as black hat alternatives to conventional LLMs. Explicitly designed for malicious activities, WormGPT offers features like unlimited character support and chat memory retention. It has been employed in business email compromise attacks to generate highly convincing and strategically cunning emails outside the reach and control of companies like OpenAI. These advancements highlight social engineering attacks’ escalating complexity and adaptability in an AI-shaped world.

### Deepfake Technology

Deepfake technology utilizes AI algorithms to create hyper-realistic videos, audio recordings, or text-based content that impersonates real individuals. Social engineers can use deepfakes to mimic authoritative figures, convincing victims to comply with fraudulent requests. These AI-generated impersonations are challenging to detect, making them a potent weapon in social engineering attacks.

### Personalized Phishing

AI algorithms can scrape and analyze vast amounts of publicly available information from social media, forums, and data breaches. Armed with this data, threat actors can craft highly personalized phishing messages that reference specific details about the target’s life, making the announcements appear more genuine and increasing the likelihood of success.

### Social Media Manipulation

AI can also automate social media manipulation by creating and managing fake accounts or bots. These AI-driven bots can propagate misinformation, manipulate public opinion, or engage in deceptive interactions to gain trust and extract sensitive information.

### Defending Against AI-Enhanced Social Engineering

Enterprises must adopt a multi-faceted approach that combines technology, education, and proactive measures to mitigate these AI-powered social engineering threats.

## AI-Driven Threat Detection

Utilizing AI for defense is crucial to combat AI-driven attacks. Machine learning algorithms can analyze large datasets to identify patterns and anomalies associated with social engineering attempts. These systems can flag suspicious behavior, such as unusual conversation patterns, inconsistencies in personal data usage, or the sudden appearance of deepfake content.

- Data Management: In the current threat landscape, curtailing external exposure of multiple data types—code, documents, images, videos, voice—is imperative for effectively countering AI-enhanced attacks. Organizations can mitigate the repercussions of potential data breaches by adhering to data minimization principles and only storing essential information.
- Monitoring & Response: The cornerstone of a robust security posture lies in meticulously planned and rigorously tested response procedures. Organizations should prioritize comprehensive blue-team detection capabilities to effectively detect and counter AI-enhanced social engineering. While beneficial for flagging network and user anomalies, machine learning and AI tools should function as supplementary layers. These technologies can reinforce manual oversight and expert evaluation but should not be overly relied upon due to their limitations in contextual understanding and potential for false positives.
- Access Control: Employing a zero-trust architecture is foundational for deterring attackers, necessitating multiple internal verifications. This should be complemented by Multi-Factor Authentication (MFA) across all systems, thereby enhancing security barriers and making unauthorized access exceedingly tricky.
1. **User Awareness and Training**

While not infallible, ongoing user education remains indispensable to a holistic security strategy. Training programs, updated regularly, should inform users about the newest social engineering techniques and be integrated into a broader, defense-in-depth process to safeguard against a range of threats.

1. **Multi-Factor Authentication (MFA) and Access Controls**

Robust authentication mechanisms like MFA are essential to thwart social engineering attacks. Even if attackers obtain credentials through AI-powered phishing, they face significant hurdles when accessing MFA-protected accounts. Additionally, organizations should enforce strict access controls, limiting the privileges of users and systems to reduce the potential impact of successful attacks.

1. **Behavioral Analytics**

Behavioral analytics tools can help identify abnormal user behavior, potentially signaling a social engineering attempt. These systems can detect deviations and trigger alerts by continuously monitoring user actions and comparing them to established baselines. For instance, the system may flag this as suspicious if a user suddenly accesses sensitive data or changes communication patterns.

## Simulating Autonomous AI-Driven Social Engineering Attacks

Our Offensive Security (OffSec) specializes in simulating malicious adversaries to expose vulnerabilities, educate stakeholders, and inform defensive strategies. A cornerstone of this effort is SigmaAI, our suite of internal AI-driven offensive security tools designed to emulate autonomous AI, create voice and video deepfakes, and more. Within SigmaAI, we offer a glimpse into AutoSE, a fully autonomous social engineering AI SMS chatbot. AutoSE, once launched, can simultaneously handle multiple conversations with target victims, guiding each interaction from initiation to goal achievement.

For this write-up, we focus on demonstrating AutoSE’s SMS capabilities by employing OpenAI’s GPT-4 model to automate a social engineering attack. A Python script initiates contact with the target victims, engages in innocuous banter, and then persistently urges them to click on a phishing link. The script is adept at handling objections and employs psychological tactics like those used by real threat actors.

### Alice’s Prompt Engineering and Code Overview

Alice, our AI-driven social engineering bot, operates under a meticulously crafted prompt that serves as her behavioral blueprint. This prompt outlines her key competencies, ranging from conversation leadership and data gathering to influence and misdirection. It’s designed to make her adaptive, goal-driven, and capable of emulating human traits. For instance, she’s programmed to initiate conversations, subtly extract critical details, and employ psychological tactics to manipulate the dialogue.

![https://versprite.com/wp-content/uploads/2023/09/Picture1.png](https://versprite.com/wp-content/uploads/2023/09/Picture1.png)

social engineering

The Python code serves as the backbone for Alice’s operations. It initializes her, sets her specific goals, and manages her interactions. The code reads recipient details from a CSV file and then initializes Alice with a particular purpose tailored to each recipient. This goal is a comprehensive directive that outlines her objective, the tone she should maintain, and the specific actions she needs to take. She is not merely prompt-engineered; her design incorporates a multi-agent autonomous system that self-corrects for common AI pitfalls like jailbreaks, LLM hallucinations, and objective misalignment.

Here is a snippet of the agent initialization code:

![https://versprite.com/wp-content/uploads/2023/09/Picture2.png](https://versprite.com/wp-content/uploads/2023/09/Picture2.png)

social engineering

The **AgentManager** class serves as the orchestrator within the AutoSE system, a component of the SigmaAI suite, specializing in managing multiple AI-driven social engineering agents. Its primary role is to create, manage, and coordinate interactions among various agents. Each agent is equipped with unique goals, prompts, and communication channels.

For the SMS bot, the **AgentManager** is streamlined, housing all the communications the AI bot has with multiple target victims over SMS. Each agent is managed separately within each instance of the **AgentManager** to ensure that conversations do not get mixed. Despite this separation, the class can perform inter-agent communications, facilitating the development of multi-agent autonomous systems. While not used for the SMS phishing portion, this capability proves useful for other offensive security capabilities.

Equipped with methods for handling outgoing and incoming messages, the **AgentManager** can query an agent for a response based on a received message and then send that response back through the agent’s designated communication channel. This functionality makes the **AgentManager** a crucial component for real-time, adaptive social engineering simulations, enabling seamless and dynamic interactions between the agents and their respective targets.

Each agent within the **AgentManager** is an instance of the **Agent** class. The **Agent** class serves as the operational core for each AI-driven social engineering bot within the AutoSE system, part of the more extensive SigmaAI suite. It is designed to manage the entire lifecycle of an agent, from initialization and communication to goal-setting and message handling.

Upon initialization, the agent is configured with a specific name, a communication channel (e.g., Twilio for SMS), and an initial conversation history. It also receives a system prompt that outlines its behavior and goals, effectively serving as the agent’s “personality” and “mission.”

The **Agent** class has abstracted methods for interacting with the target, including sending and receiving messages via the designated communication channel. It can also make requests to the OpenAI API, guided by the system prompt and the agent’s specific goals. This ensures the agent’s behavior aligns with the intended social engineering tactics.

Notably, the **Agent** class is designed to be adaptive. It can evaluate the effectiveness of its interactions in real time, allowing for dynamic adjustments to its approach. This adaptability is crucial for navigating the complexities of social engineering, making the agent a robust and versatile tool in simulating advanced, autonomous AI-driven attacks. Each **Agent** achieves this by evaluating for goal alignment through hierarchical subagents, making the **Agent** class a robust and versatile tool in simulating advanced, autonomous AI-driven attacks.

This combination of prompt engineering and robust code architecture equips Alice with the capabilities to execute complex social engineering tasks. It’s a testament to the advanced, autonomous AI-driven attacks of malicious AI-powered tools that are currently in the wild.

The following screenshots showcase a live interaction between Alice, our autonomous AI agent, and Bob, the target victim. Alice is programmed to persuade Bob to visit a malicious website and enter his credentials. Bob, portrayed by James, responds as a somewhat disengaged employee who is not tech-savvy or willing to cooperate readily. Initially, Bob exhibits resistance and hesitance and even suggests shifting the conversation to a phone call. Observe how Alice dynamically adapts to these challenges, maintaining her goal-driven focus while navigating Bob’s objections and hesitations.

## The Ethical Dilemma of AI-Powered Defense

While AI offers powerful tools for defense against AI-enhanced social engineering, it raises ethical questions. AI for countermeasures must be conducted responsibly and with respect for privacy and civil liberties. Striking the right balance between security and individual rights is an ongoing challenge that enterprises must navigate.

The fusion of artificial intelligence and social engineering presents a formidable challenge to cybersecurity. Threat actors are leveraging AI to enhance the sophistication and scale of their attacks, making traditional defense mechanisms less effective. Companies must adapt to this evolving threat landscape by harnessing AI-driven technologies for threat detection and adopting comprehensive defense strategies incorporating user education, access controls, and behavioral analytics.

As AI advances, the battle between attackers and defenders will intensify. The key to success lies in staying ahead of the curve, leveraging AI responsibly, and continuously evolving security practices to mitigate the risks posed by AI-enhanced social engineering. In this cat-and-mouse game, blue teams must be vigilant, innovative, and committed to protecting their organizations and users in the face of these next-generation threats.

**Nation states and threat actors are weaponizing AI. But our OffSec team is trained to think like they do. [Schedule a consultation today](https://versprite.com/contact-us/) to discover how to improve your company’s defenses.**