# How Large Language Models Are Transforming Email Security

Created: June 29, 2024 5:23 PM
URL: https://www.vadesecure.com/en/blog/how-large-language-models-improve-email-security

![https://www.vadesecure.com/hubfs/Blog%20images/Cyber-Intelligence.jpg](https://www.vadesecure.com/hubfs/Blog%20images/Cyber-Intelligence.jpg)

With the proliferation of Artificial Intelligence (AI) in the realm of email security, the battle against phishing and spear-phishing attacks requires increasing sophistication from security providers. Leveraging AI technologies has become a cornerstone of defense strategies, enabling rapid analysis of emails to identify potential scams with greater efficiency than ever before. Among the latest advancements reshaping this landscape are Large Language Models (LLMs).

In this post, we delve into the pivotal role of LLMs, shedding light on their significance for phishing detection. We’ll start with the one that’s been prominently featured in the news: ChatGPT.

## But what is it?

The GPT stands for Generative Pre-trained Transformer, and the model itself is available for use beyond just the ChatGPT version that’s made the news. These models are used to fine-tune, prompt, and/or respond to a text generation problem that a Natural Language Processing (NLP) task is trying to solve. NLP is a function that Vade has been using in our algorithms for some time; it combines rule-based modeling of human language with machine learning and statistical models to be able to process and generate speech and text. A Large Language Model is one of the models that can be provided to NLP engines to understand human language.

If you’ve ever used speech-to-text to type a message, you’ve used NLP in a simpler form.

ChatGPT is a more advanced version, which can be given prompts to respond to. By training the NLP on large amounts of text, ChatGPT is better able to solve the tasks you give it with prompts. A casual user may have fun with the model, giving it prompts such as “tell me a funny joke” or “summarize this article for me”.

At Vade, we’re getting more creative.

## Why do we need Large Language Models and Natural Language Processing for phishing detection in the first place?

From an analyst and research perspective, these are fascinating topics for their own sake.

But when we’re talking about email security and phishing detection, is this really where the technology needs to be focused? Arguments could be made to try and trace back the sender of an email, to better detect domain spoofing, or otherwise expend more resources examining the data attached to a given email. Leveraging such technology can be helpful, but on its own, it can often leave gaps or make mistakes. If you’ve ever dealt with free email service providers and their very simple spam or junk filters, you’re probably painfully aware of how limited this sort of basic automated filtering can be.

Plus, phishing scammers are getting increasingly clever, and use a variety of tactics to slip into your inbox. They may use a legitimate email address from a free provider, and simply change the display name. They may [abuse an open redirect](https://www.vadesecure.com/en/blog/open-redirect-attack), hiding their phishing sites behind legitimate URLs with a series of rapid redirections. It could even be a spear-phishing attack that sends a [fake-forwarded email](https://www.vadesecure.com/en/blog/spear-phishing-scams-fake-emails) to an intended victim.

As part of our layered approach to email security, we go beyond the same scanning of risk factors that all email security providers conduct. We’re looking at multiple elements of an email message, including what’s contained (or hidden) in the body of the text.

What we have found to be most effective is to combine technical signals of potential phishing, such as redirects and sends from risky domains, with NLP to evaluate the likelihood a given set of text may be a phishing scam. In its simplest form, it’s scanning for risky words and phrases, such as “Dear sir or madam,” “eBay gift cards,” or “get rich quick.”

Such phrases are assigned values and are plugged in to the phishing algorithm to evaluate the email. Unlike ChatGPT and similar platforms, our algorithm isn’t trying to understand the text. It’s comparing whether the patterns match similar patterns we’ve already identified and trained the algorithm to recognize as phishing.

But what about when there’s no risky links, the sender’s name looks like the CEO’s, the email comes from a legitimate sending domain, and the content of the email is simply “I need this really quick, can you help me?”

## ChatGPT isn’t just used by the “good guys”

A major reason for training email security algorithms with LLMs is not just for catching the “obvious” phishing scams, such as those asking for various gift cards. It’s also to catch when the text in an email is following patterns identified in other malicious emails.

Where we shine is in combining the data from multiple sources to benefit all our partners. Our algorithms are updated in real-time with reports from flagged emails, helping to improve the accuracy of our models with the latest threats and data. In addition to incorporating the emerging and outlier threats identified by user reports, we’re able to train our models on real-time phishing messages observed in the wild.

Additionally, these reports feed a LLM to generate potential phishing messages. Instead of simply asking AI if a message is phishing, we can also ask if it may have been produced by generative AI.

Combined with a multitude of other factors, we’re then able to dial in our algorithm(s) to provide a likelihood of a given email being a spear phishing attempt, a broad phishing attack, graymail, or just run-of-the-mill spam.

## AI-powered vigilance

While cybersecurity professionals trend towards deeply suspicious of emails by nature, most people aren’t wired to immediately be skeptical of an innocuous looking email from what appears to be a colleague. Even the most hardened cybersecurity expert can be fooled if they’re in a hurry, looking from their mobile phone, or just having an off day.

That’s where Vade (now part of Hornetsecurity Group) and our industry-leading phishing filter come in – powered by innovations from LLMs and NLP.

ChatGPT is fun and all, but hackers and cybercriminals are using these platforms too. And they’re using them to craft generic messages at scale that appear so legitimate as to bypass most filters.

When ChatGPT became widely available and started to be [referenced in Scama packs](https://www.vadesecure.com/en/blog/scama), our analysts were already looking at ways to stay ahead of such tactics. Earlier I described using Natural Language Processing to solve tasks – imagine asking AI to tell us the likelihood an email was generated by AI.

We could also query how a message compares to other phishing emails.

Meanwhile, we can factor whether AI’s confidence level changes if we factor in other elements, such as the email address, DMARC protocol adherence, and header data.

The massive upside to Vade’s filter is that unlike humans, it never gets tired, too busy, or distracted.

So… when that email comes in from the CEO asking “can you let me know if you got this?” our filter can flag it as risky, giving you or your users a moment to stop and consider. When it comes to cybersecurity, that moment can make all the difference. It gives you time to check the sending email address or delay responding until you can examine the email more closely.

By leveraging Large Language Models to improve our NLP, we’re better able to detect and flag risky emails in new categories. Topics such as W2 fraud are particularly fraught, where the targets may be particularly vulnerable due to stress, worry, or uncertainty around who may contact them related to their tax documents.

## Add the power of LLM and NLP to your email security

If you’d like to stay ahead of the attackers utilizing ChatGPT and other tools to improve their phishing strategies, Vade’s email security technology combined with Hornetsecurity’s suite of services is the solution. Our industry-leading innovation is now backed by Hornetsecurity’s comprehensive protections designed to secure your business and your clients’.