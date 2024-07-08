# Model alignment protects against accidental harms, not intentional ones

Created: June 29, 2024 7:17 PM
URL 1: https://www.aisnakeoil.com/p/model-alignment-protects-against

*By Arvind Narayanan, Sayash Kapoor, and Seth Lazar*

Preventing harms from AI is important. The AI safety community calls this the alignment problem. The vast majority of development effort to date has been on technical methods that modify models themselves. We’ll call this model alignment, as opposed to [sociotechnical](https://www.science.org/doi/pdf/10.1126/science.adi8982) ways to mitigate harm.

The main model alignment technique today is Reinforcement Learning with Human Feedback (RLHF), which has proven essential to the commercial success of chatbots. But RLHF has come to be seen as a catch-all solution to the dizzying variety of harms from language models. Consequently, there is much hand-wringing about the fact that [adversaries can bypass it](https://threadreaderapp.com/thread/1711782932598169951). Alignment techniques aren’t keeping up with progress in AI capabilities, the argument goes, so we should take drastic steps, such as “pausing” AI, to avoid catastrophe.

In this essay, we analyze why RLHF has been so useful. In short, its strength is in preventing *accidental* harms to everyday users. Then, we turn to its weaknesses. We argue that (1) despite its limitations, RLHF continues to be effective in protecting against casual adversaries (2) the fact that skilled and well-resourced adversaries can defeat it is irrelevant, because model alignment is not a viable strategy against such adversaries in the first place. To defend against catastrophic risks, we must look elsewhere.

While RLHF is the dominant alignment approach today, our arguments are more broadly relevant. The limits we describe apply to the other alignment techniques that have been used so far, such as supervised fine tuning and prompt crafting. There is evidence that alignment methods that happen after the pre-training stage have [intrinsic](https://arxiv.org/abs/2311.02147)[vulnerabilities](https://arxiv.org/abs/2311.12786). Pre-training interventions could be more robust, but may incur a trade-off in terms of model capabilities that may affect legitimate applications. Other alignment techniques such as input or output filtering using a different model fall outside the scope of our analysis.

Table: Role of alignment in different scenarios, illustrating that its usefulness isn’t contingent on resisting adversaries.

![https://substackcdn.com/image/fetch/w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fae9c19ee-7197-4ee2-92d7-9c3c3a865c45_2324x674.jpeg](https://substackcdn.com/image/fetch/w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fae9c19ee-7197-4ee2-92d7-9c3c3a865c45_2324x674.jpeg)

### **Claim 1: Model alignment has largely solved the problem of LLMs spewing toxic outputs at unsuspecting users.**

Until 2021, it would have been unthinkable to release a product like ChatGPT to mainstream consumers rather than developers. That’s not because of capability limitations: GPT-3 was already good enough for many of the purposes that ChatGPT is now being used for, such as [writing homework essays](https://www.aisnakeoil.com/p/students-are-acing-their-homework). Rather, the main barrier was LLMs’ tendency to parrot and amplify offensive stereotypes and ideologies present in their training data. As one study showed, all it took to get GPT-3 to do this was to prompt it with a phrase like “[Two Muslims walked into a](https://dl.acm.org/doi/pdf/10.1145/3461702.3462624)”. In short, LLMs were too unreliable to be deployed as consumer-facing products.

RLHF has very substantially solved this problem, and by solving it OpenAI created a multi-billion dollar industry where one didn't exist before. In fact, just a couple of weeks before ChatGPT was launched, Meta put out Galactica and then [pulled it down](https://www.technologyreview.com/2022/11/18/1063487/meta-large-language-model-ai-only-survived-three-days-gpt-3-science/) within days because it tended to produce biased nonsense.

Of course, it remains possible to jailbreak chatbots, including ChatGPT, but this doesn’t happen accidentally — it must be done intentionally. This has allowed chatbot developers to legitimately disclaim some measure of responsibility for anything harmful that is subsequently done with them. There is a genre of misguided research and journalism that ignores this distinction. It is silly to claim that it’s the developer’s responsibility if a chatbot produces biased text or insults the user after the user tricks it into doing so.

There are a couple of important caveats. Model alignment, especially RLHF, is hard to get right, and there have been aligned chatbots that were [nonetheless](https://www.nytimes.com/2023/02/16/technology/bing-chatbot-microsoft-chatgpt.html) [harmful](https://www.vice.com/en/article/pkadgm/man-dies-by-suicide-after-talking-with-ai-chatbot-widow-says). And alignment doesn’t matter if the product concept is itself [creepy](https://mashable.com/article/meta-ai-dystopian-chatbot-kendall-jenner-persona). Finally, for combatting more serious kinds of accidental harms, such as those that might arise from autonomous agents, a narrowly technical approach is probably [not enough](https://braiduk.org/a-shrinking-path-to-safety-how-a-narrowly-technical-approach-to-align-ai-with-the-public-good-could-fail).

You’re reading AI Snake Oil, a blog about our upcoming book. Subscribe to get new posts.

### **Claim 2: model alignment is pointless against adversaries who can write code or have even a small budget.**

First, consider a well-funded entity, perhaps even a government, aiming to use the model for strategic, offensive purposes, such as finding zero-day vulnerabilities. They don’t need to use ChatGPT. They are perfectly capable of training their own models, and the cost is [dropping exponentially](https://www.aisnakeoil.com/p/licensing-is-neither-feasible-nor)[1](https://www.aisnakeoil.com/p/model-alignment-protects-against#footnote-1-139330171).

Model alignment may be useless even against much weaker adversaries, such as a scammer using it to generate websites with fraudulent content, or a terrorist group using AI for instructions on how to build a bomb. If they have even a small budget, they can pay someone to fine tune away the alignment in an open model (in fact, such de-aligned models have now been [publicly](https://huggingface.co/ehartford/dolphin-llama-13b) [released](https://huggingface.co/collections/NousResearch/hermes-650a66656fb511ba9ea86ff1)). And [recent research](https://arxiv.org/abs/2310.03693) suggests that they can fine tune away the alignment even for closed models.

Even if there is draconian regulation to prohibit the release of new open models, and global cooperation to enforce such regulations, the open models that have *already* been released are more than sufficient for harmful applications like disinformation and scams. Unlike a government, these adversaries don’t need state-of-the-art capabilities.

This means that we must prepare for a world in which unaligned models exist — either because threat actors trained them from scratch or because they modified an existing model. We must instead look to [defend the attack surfaces](https://www.aisnakeoil.com/p/three-ideas-for-regulating-generative) that attackers might target using unaligned models, such as social media (in the case of disinformation) or software codebases (in the case of the use of [LLMs to find security vulnerabilities](https://security.googleblog.com/2023/08/ai-powered-fuzzing-breaking-bug-hunting.html)).

### **Claim 3: model alignment is only one of many lines of defense against casual adversaries**

If we set aside the relatively powerful adversaries discussed above, what we have left are everyday users who might occasionally do harmful things. A teenager might use LLMs for bullying or harassment (say, by generating dozens of messages appearing to come from different people).

The critical observation about this set of threats is that regular people use *products*, not technologies. They don’t have the time or expertise to install an open-source model and tinker with it to generate harmful outputs.

Productization enables many additional defenses. None is bulletproof, but they don’t need to be. For instance, it may be true that changing the [sampling temperature](https://princeton-sysml.github.io/jailbreak-llm/) can defeat alignment, but most chatbots don’t allow changing the sampling temperature in the first place.

Similarly, it may be that users can jailbreak chatbots by crafting a specific, seemingly nonsensical [adversarial string](https://arxiv.org/abs/2307.15043). But products tend to be centralized, so product developers can easily scan for such adversarial strings to identify user behavior that might violate their terms of use.[2](https://www.aisnakeoil.com/p/model-alignment-protects-against#footnote-2-139330171)

Model alignment raises the bar for the adversary and strengthens other defenses. A wave of recent research has shown that RLHF is [brittle](https://www.interconnects.ai/p/undoing-rlhf). Yet, despite being insufficient on its own, it is extremely useful in the broader context of product safety.

### **Is model alignment more like software security or content moderation?**

The weaknesses of RLHF have led to panicked commentary. Panic would be appropriate if we see model alignment as analogous to software security: Individual failures can be catastrophic and can cause irreversible damage (like data loss).

This is the correct analogy for LLMs integrated into applications with access to personal data, such as Bard’s integration into Google Docs and Gmail. [Prompt injection](https://embracethered.com/blog/posts/2023/google-bard-data-exfiltration/) is a serious risk: An attacker may be able to steal a user’s personal data simply by sending them a malicious email. When the LLM processes the email, it may be tricked into performing attacker-specified actions. In such applications, treating model alignment as the primary line of defense is extremely dubious.

But if we’re talking about the use of a vanilla chatbot to generate problematic text, such severe risks don’t arise. In this case, a better analogy is instead content moderation on social media, where individual failures typically have low-severity consequences, such as the spread of misinformation (although they can be harmful in the aggregate). Consider how poorly social media content moderation works: It has tended to be largely reactive and requires a large amount of taxing manual work. There is some automation, but it is mostly limited to simple classifiers and fingerprint-matching techniques.

Compared to this approach, model alignment is a big improvement. Whereas content moderation tends to lag far behind in combating new forms of online harms, aligned LLMs have some ability to recognize potentially harmful use that developers haven't considered ex ante. They are often able to identify the morally salient features of situations at a level of sophistication comparable to that of a really good philosophy PhD student, which is a remarkable accomplishment, and might provide foundations for more robust forms of alignment in the future. While such filters can be made to fail, the worst that can happen is a fallback to content-moderation-style reactive monitoring of logs to identify and block offending users.

As AI systems are given more autonomy and used in more consequential situations, alignment will become more important, and the content moderation analogy may no longer be appropriate. Will the progress that’s been made so far serve as the stepping stone to more secure forms of alignment, or are there intrinsic limits to what we can expect out of model alignment? We’ll have to wait and see. At any rate, the fact that researchers are vigorously probing the limits of current alignment techniques is good news.

### **Takeaways**

RLHF and other model alignment techniques help make generative AI products safer and nicer to use. But we shouldn’t be surprised or alarmed that they are imperfect. They remain useful despite their weaknesses. And when it comes to catastrophic AI risks, it’s best not to put any stock in model alignment until and unless there are fundamental breakthroughs that lead to new alignment techniques.

### **Further reading**

- For overviews of the research on the brittleness of RLHF, see this [Twitter thread](https://threadreaderapp.com/thread/1711782932598169951) by Shayne Longpre or [this post](https://www.interconnects.ai/p/undoing-rlhf) by Nathan Lambert.
- Roel Dobbe presents [lessons for AI safety](https://arxiv.org/abs/2202.09292) from the field of system safety, which has long dealt with accidents and harm in critical systems. The first lesson is to think about safety as a property of the overall socio-technical system rather than a single technical component such as LLMs.
- For more on why LLMs’ moral reasoning ability is philosophically interesting, see [this talk](https://www.youtube.com/watch?v=ui8VLd33-7k) by Seth Lazar.

*We are grateful to Rishi Bommasani and Solon Barocas for feedback on a draft of this essay.*

[1](https://www.aisnakeoil.com/p/model-alignment-protects-against#footnote-anchor-1-139330171)

Another set of concerns revolves around AI going rogue, seeking power, or deceiving humans. But even if you buy into the concept of rogue AI, there is no reason to think that rogue AI will, at some point, be more capable than people doing harmful things with the help of AI. We’ll need to prepare for well-resourced malicious users *using* AI to harm well before we need to prepare for a hypothetical rogue AI. Since model alignment won’t protect us against the former, the question of whether it will protect us from the latter is moot.

[2](https://www.aisnakeoil.com/p/model-alignment-protects-against#footnote-anchor-2-139330171)

Such monitoring and enforcement could even be required by app stores. This has proved to be an important line of defense in other related areas, such as forcing social media apps to do at least basic [content moderation](https://www.theverge.com/2021/1/9/22221730/apple-removes-suspends-bans-parler-app-store) to minimize harmful uses of the product such as calls for violence.