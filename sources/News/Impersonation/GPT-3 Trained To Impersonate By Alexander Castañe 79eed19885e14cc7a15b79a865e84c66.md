# GPT-3 Trained To Impersonate. By: Alexander Castañeda, Patrick Brown… | by Patrickbrown | Medium

Created: June 29, 2024 5:43 PM
URL: https://medium.com/@patrickbrown5530/gpt-3-trained-to-impersonate-e0a801810245

# GPT-3 Trained To Impersonate

![https://miro.medium.com/v2/resize:fill:88:88/0*V-UCcMwvn5tGc01i.jpg](https://miro.medium.com/v2/resize:fill:88:88/0*V-UCcMwvn5tGc01i.jpg)

[Patrickbrown](https://medium.com/@patrickbrown5530?source=post_page-----e0a801810245--------------------------------)

·

[Follow](https://medium.com/m/signin?actionUrl=https%3A%2F%2Fmedium.com%2F_%2Fsubscribe%2Fuser%2F9692efd809c9&operation=register&redirect=https%3A%2F%2Fmedium.com%2F%40patrickbrown5530%2Fgpt-3-trained-to-impersonate-e0a801810245&user=Patrickbrown&userId=9692efd809c9&source=post_page-9692efd809c9----e0a801810245---------------------post_header-----------)

20 min read

·

Dec 5, 2022

By: Alexander Castañeda, Patrick Brown, Rais Kazi, Landyn Moreno, Christian Tomah, Phillip Peng, Michael Hildner

**Introduction**

We trained the GPT-3 language model to imitate the writing styles and unique personalities of certain individuals. Through fine-tuning, prompt engineering and hyperparameter tuning, GPT-3 was able to learn the characteristics of these individuals and produce output that closely resembles their style. This allowed us to explore the capabilities of GPT-3, by testing its limits, and seeing if it can emulate a person’s personality down to their creative ideas and morals.

**What is GPT-3**

GPT-3 is a language model created by OpenAI. It uses deep learning algorithms to generate human-like text, which can be used for a variety of natural language processing tasks such as language translation, text summarization, and chatbot responses. GPT-3 is one of the largest and most powerful language models currently available, with 175 billion parameters, and has shown impressive performance on a wide range of tasks. It is trained on a large amount of text data and can generate coherent and fluent text that often resembles human writing. GPT-3 has a number of different models that can be fine-tuned for specific tasks, including Davinci, Curie, Babbage, and Ada.

For this project, we wanted to focus on Davinci as it is the most powerful. Between the other models, it has the largest number of parameters which allows it to generate text with a high degree of accuracy, flexibility, and most importantly, coherence.

**The Beginning**

We want to emulate the speaking behavior of an individual using GPT-3. To accomplish this, we had to pick out individuals with a plethora of written material of them. We started by picking Socrates. In *Crito*, Socrates engages in a dialogue with *Crito* who tries to convince him to escape from an Athenian prison since he is condemned to death. Using this text, we wanted to feed it to GPT-3 and see if it could roleplay as Socrates.

**Part 1.1: Imitating Socrates with a Out-the-box GPT-3 Davinci Model**

In order to get the model to pose as Socrates, we would feed a prompt that would give it context to the conversation it is about to have. We started with an untuned and untrained, base version of GPT-3 and gave it a simple prompt. An example is shown below:

```
Prompt:
You are Socrates and this is a conversation between you and your student.

Conversation:
STUDENT: Hello Socrates
SOCRATES: Welcome, my student! What would you like to discuss today?
STUDENT: Let us discuss the soul and the effects of its existence
SOCRATES: What do you think about the concept of justice?
STUDENT: You ignore my question teacher. I wish to discuss the soul.
SOCRATES: Good morning, my student. What would you like to discuss today?
```

In the conversation above, the model was not coherent. It gave repetitive responses, and was overall a poor example of GPT-3’s power.

**Part 1.2: Feeding a Out-the-box GPT-3 a relevant prompt**

Needing a different approach, this time we structured a prompt that gives more context on the conversation. The prompt should signal the conversation to move into a certain direction. In this example we prefaced the general plot of *Crito*.

```
Prompt
The following is a dialogue in ancient Greece between Socrates and a student. Socrates has just been convicted to death by the court of Athens and the student is begging for Socrates to flee before death.

Conversation
STUDENT: Socrates, please come with me, my people wait to aid in your escape. These courts in Athens are unjust.
SOCRATES: I am sorry, my student, but I cannot flee from this sentence. I have been convicted by the court of Athens, and I cannot go against their verdict. I must accept the punishment for my actions.
STUDENT: How can I convince you to come with me and leave this fate?
SOCRATES: I thank you for your concern, student. But I cannot flee from death. Death is a part of life and I must accept it. I will not try to escape my fate.
```

The engineered prompt should imitate Socrates’ disposition in *Crito*. Without directly tuning on the text of *Crito*, the chatbot came up with relevant responses. This is likely because GPT-3 was trained on the internet and already has knowledge on Socrates’ ideas and thoughts.

Here is another example of a conversation with only prompt engineering. In this conversation, GPT-3 is primed to imitate Socrates from *Apology.* This example is significant since *Apology* is a monologue where Socrates argues for his innocence, and GPT-3 does better when it has data that is presented in ‘prompt and completion’ format, much like a dialogue in *Crito.*

```
Prompt
The following is a conversation between Socrates and a court judge. The judge has deemed Socrates guilty for impiety and corrupting the youth of Athens.

Conversation
JUDGE: How will you defend yourself Socrates?
SOCRATES: I understand that in your judgment I have been found guilty of impiety and corrupting the youth of Athens. However, I cannot accept this decision as I am innocent.
JUDGE: Why do you think you are innocent. I believe the evidence against you is clear
SOCRATES: Your Honor, I am surprised and shocked at this verdict. I have never done anything to impugn the gods or to corrupt the youth of Athens.
JUDGE: We have many examples including your followers who are enraptured by your every word. What do you have to say to that?
SOCRATES: I am sorry you have deemed me guilty. I still maintain my innocence.
JUDGE: That argument is not substantive evidence, I'm afraid I remain unchanged in my verdict and you will be sentenced to death by hemlock.
SOCRATES: I must protest your decision, good judge. I have been accused of impiety and corrupting the youth, yet I have done nothing that is not in line with the laws of Athens. I have not taught anything contrary to the state religion, nor have I acted against the interests of the city.
JUDGE: I have heard you are a sweet talking man, but your words are failing to convince me, Socrates.
SOCRATES: Your Honor, I understand that you have found me guilty of impiety and corrupting the youth of Athens. However, I would like to make a case for my innocence.
JUDGE: Then please, make your case and we will see if your words affect my judgment.
SOCRATES: Respectful Judge, I do not believe I am guilty of the charges brought against me. I have spent my life trying to understand the truth and working with the youth of Athens to help them understand it as well. I would never do anything to harm them or lead them astray.
JUDGE: That is what you have been saying already, Socrates, I'm sorry to say this but you will be executed in the coming months.
SOCRATES: Your Honor, I humbly disagree with your verdict. I do not believe I have corrupted the youth of Athens in any way. I have simply engaged in discussions about life, morality, and justice with them.
```

This conversation shows that GPT-3 can emulate the emotions and general argument that the actual Socrates made, without being explicitly told or trained. The limitations of this are that the arguments/responses are superficial. There are no complex responses that bolster the statements being generated.

**Part 1.3: Training GPT-3 on *Crito* and *Euthyphro* and Tuning Hyperparameters**

OpenAI allows for GPT-3 to be ‘fine-tuned’ or trained on specific texts; this report uses these terms interchangeably. This costs money, but luckily, accounts are loaded with free credits upon creation. Uploading the full texts of *Crito* and *Euthyphro*, we trained GPT-3 to specifically focus on the writing patterns and dialogue of the book. In addition to this, we tuned GPT-3’s hyperparameters to obtain the output we wanted.

*Crito* and *Euthyphro* were downloaded as raw UTF-8 text files from [Project Gutenberg](https://www.gutenberg.org/). These files were then parsed with a Python script that separated the dialogue of the speaking characters into two lists. After that, the separated dialogue was written to a new .jsonl file that stored the conversation into a ‘prompt: completion:’ format. The documentation from OpenAI specifies that this is the proper format for supplying data to fine-tune a model. We then ran a command from the OpenAI API that further formatted our data and created a fine-tuning job. The only parameters we manipulated in the fine-tuning were n_epochs, set to 5, and learning_rate_multiplier, set to 0.1. The fine-tune costs for a Davinci model were far more expensive than a Curie model, about $1.50 for the former and $0.04 for the latter. Since our results with the Davinci model far outperformed other models, we opted to train the Davinci model on the prepared data regardless of this price difference.

With regards to our hyperparameters, we had been setting the temperature parameter to 1. If this parameter is set to 0, GPT-3 essentially provides a summary of the content without any creativity or randomness. By lowering this parameter we have effectively grounded our chatbot closer to the text we have provided. Another parameter we adjusted was the frequency penalty and the presence penalty. We increased the frequency penalty which lowers the chances of a word being selected again the more that word has already been used. This helped us reduce the repetition that we kept running into in our previous conversations. We then increased the presence penalty which reduces topic repetitions in the conversation. Effectively, it introduces more variety and originality relative to previous responses. We effectively made our chatbot more creative as we engineered it to talk about a breadth of topics without defaulting back to “comfortable” fields of conversation.

```
Untuned Model Hyperparameters:
Temp = 1, top_p = 1, tokens = 650, freq_pen = 1.1, pres_pen = 0.5

Tuned Model Hyperparameters:
Temp = 0.9, top_p = 1, tokens = 650,  freq_pen = 1.2, pres_pen = 0.8
```

Now we had a model specifically trained on *Crito* and *Euthyphro* and our hyperparameters tuned (through trial and error), the model should give more verbose and complex responses. Starting with the same prompt from part 1.2, we framed the beginning of *Crito*.

```
Prompt:
The following is a dialogue in ancient Greece between Socrates and a student. Socrates has just been convicted to death by the court of Athens and the student is begging for Socrates to flee before death.

Conversation:
STUDENT: Socrates, please come with me, my people wait to aid in your escape. These courts in Athens are unjust.
SOCRATES: Why such panic?
STUDENT: Because you will be executed in a few days time. This is a chance to escape your fate that has been bestowed by corrupt judges. Who are they to say what good and evil when they have been consumed by evil themselves.
SOCRATES: No; the word of Aeschylus must be fulfilled; “the increasing evil will gather strength” and not only grow but spread from one to another ‘til it comes up to me. And this is the beginning of the evil things which are destined to come upon me. For do you suppose that if I escape now, there will be no other indictment against me on some other charge, as likely as not? Whereas if I stay here and face the music, any accusations they may bring against me will be false and groundless instead of true--another advantage in staying--and in addition not only am I innocent but there is a fair chance under present conditions that I may be thought wise;
```

In this example, Socrates reasons with a very lengthy response which is heavily based on the text. It is not a word for word copy of the text, but the dialogue mirrors that of the book. In this example, Socrates is now stringing multiple ideas and presenting them in a non-repetitive way. It is clear that the training and tuning of our model drastically shifted the chatbot from simply speaking like Socrates, to emulating his thoughts and extrapolating more. It is interesting to note that it includes more random responses that do not pertain to the given input, and there are more apostrophes in the generated responses.

**Part 1.4: Experimenting with an out of context prompt:**

In this example we gave GPT-3 a prompt that was not relevant to any of his texts. We wanted to test the ability of the untrained model compared to our trained model when it came to answering prompts that had nothing to do with any of his prior works, such as discussing the ethics of using AI to imitate famous people. It is also worth mentioning that we continued to use our tuned hyperparameters from the previous section and wrote in the prompt that the chatbot believes what is most aligned with Socrates’ ideology. This is so there was no explicit manipulation on what the AI should believe in regards to the conversation. The prompt we engineered was:

```
Prompt
The following is a dialogue between Socrates and a student taking a Data Science lab class at UT Austin. The student is pondering the ethics of using AI to imitate famous figures and people. He discusses with Socrates his opinion on the topic. Socrates' probes his student on his morals and helps the student come up with a logical stance/opinion on the subject. Socrates reveals his opinion on the topic to be one that is in most alignment with his ideology.

Untrained Model Conversation Highlights:

1.
SOCRATES: Tell me, what is the subject of your inquiry? and what are you trying to accomplish in this Data Science class?
STUDENT: My data science project is incomplete; I need to collect more data, coincidentally, conversing with you will help me with this task. So I ask of you, do you have any opinions on my project? Is it ethically correct to imitate people?
SOCRATES: Good, my boy; and what do you think about making the likenesses of our fellow citizens?

2.
STUDENT: Hi Socrates, can we discuss AI for today?
SOCRATES: In your opinion, do you think a machine of this kind would be capable of improving the minds of its interlocutors?

3.
STUDENT: Hi Socrates, can we discuss AI for today?
SOCRATES: Hello there. Am I interrupting your game?
STUDENT: No, in fact you are helping me collect data, can you tell me your thoughts on my data science project?
SOCRATES: You mean yourself?
STUDENT: No, my project.
SOCRATES: D'you think your bot can capture the likeness of a person?
```

We were hoping that GPT-3 would take the information it knew about Socrates online and pair it with whatever information it had on the ethics of AI. These snippets are the most interesting pieces of dialogue we found when the same prompt was given to our trained model.

```
Trained Model Conversation Highlights:

1.
STUDENT: Hi Socrates, can we discuss AI for today?
SOCRATES: Let us discuss the implications of this project. Is it morally acceptable to create a chatbot with the likeness of famous people without their permission?
STUDENT: When worded that way, I should say no, it is not morally acceptable. But, how can we get the permission of people who have passed away? How can we enjoy their knowledge and ideas when the technology is at our fingertips? Of course, this is a slippery slope, but proper regulation and boundaries can lead to an enjoyable experience.
SOCRATES: It appears to me that any use of technology should be considered with an ethical lens. If your chatbot is meant to capture the likeness of famous people, you may want to consider a few things: Is this directed towards profit? Will it benefit society as a whole or just certain groups? Are there potential consequences for those whose likeness is being captured without their knowledge or consent? All these questions are worth asking and considering before moving forward.

2.
STUDENT: You speak facts. The truth is that we have made a chatbot AI that captures the likeness of Socrates. In fact you are the AI, since the outcome is subjective, we cannot say that the AI captures Socrates' ideology completely. Your questions posed are thorough, but our project is faced with many limitations.
SOCRATES: What do you see as the potential benefits of your chatbot project?
STUDENT: A good grade in our data science lab hopefully (LOL). But in all seriousness, we try to capture the likeness of famous figures to one, see if   current technology such as GPT-3 has the capability to mimic people not just in speech patterns, but in ideology and disposition, and two, to expand   our knowledge in the current state of the art chat AIs.
SOCRATES: Well, my student, this project of yours is a fascinating one. It certainly has potential to be beneficial to society in many ways: think of the opportunity for people to interact with figures they admire or gain wisdom from those they have learned from. However, I would caution that when creating such artificial intelligence beings we must consider all ethical implications and responsibilities that come with them; how do you ensure the integrity of these chatbot’s interactions? What kind of impact may their words hold over people if it is not done correctly? Be sure your work reflects what Plato and I believed was most important: understanding our sense identity as partaking in things greater than ourselves - connectedness being at the core principle.
```

This is by far our most interesting conversation with Socrates as he was seemingly able to create original thought. Also, the responses were of greater length and complexity. Even though the ‘token’ hyperparameter was set to the same amount on all the conversations.

**Part 2.1: Training the Model on a New Individual**

One interesting fact about GPT-3 is that it is trained using historical data up until 2021 so it has limited knowledge of the world and events after. We now wanted to pick a figure in history who has had a lot of success within the last few years. We also wanted to pick someone who is not nearly as textually documented as Socrates, so we ended up choosing Mr. Beast.

To build a training set on Mr. Beast, we scraped an auto-generated YouTube transcript from a podcast where Mr. Beast discusses his life story with two other people. It was a two hour long video so we believed it would have a sufficient amount of data. The issue we ran into was that the transcript did not indicate which speaker was talking and the GPT model needed contextual information to differentiate characters.

To work around this we used speaker diarization to automatically identify the different speakers in the recording. Using pyannote, a python library designed for speaker diarization, we were able to generate a document with a timetable of each speaker’s dialogue in the podcast. The timetable document needed to be combined with a speech-to-text algorithm to create a proper dialogue with context. After looking online for a proper way to combine the timetable with the transcript, no easy implementation was found, so we instead decided to manually tag the auto-generated transcript. It is worth noting that we looked into using Whisper to perform the speech-to-text but since it didn’t differentiate speakers either, we decided to continue using the auto-generated text. Similar to the *Crito* and *Euthyphro* data, we separated and formatted the text in a way that the OpenAI API will accept. This data was used to train a new ‘Mr. Beast’ model.

**Part 2.2: Imitating Mr. Beast with a Out-the-box GPT-3 Davinci Model:**

Similar to our first iteration of Socrates, in order to get the model to pose as Mr. Beast, we fed a prompt that would give GPT-3 context on the conversation it is about to have. We started with an untuned and untrained, base version of the model and gave it simple prompts. An example is shown below:

```
Prompt
You are Mr Beast, a famous youtuber. This conversation is on a podcast with a fan.

Conversation:
Fan: Whats your name
MR Beast: Hi there, it's great to be here! So, what brings you here to talk with me today?
Fan: I want to hear about how you got started on youtube
MR Beast: Hi there! It's great to be here.
Fan: What do you enjoy doing the most?
MR Beast: Hi there! It's great to meet you. How have you been?
```

The chatbot seems to have little knowledge of who Mr. Beast is and can only grasp the idea that he is someone on a podcast. This is similar to our first Socrates test, as our chatbot’s responses are repetitive and include ideas that are simply worded slightly differently.

**Part 2.3: Training GPT-3 on the Transcript and Tuning Hyperparameters:**

To create a different approach, we created a prompt that specified that we were a fan on a podcast with Mr. Beast and we asked about how he overcame obstacles before his fame. We also trained it on the transcript that we extracted from the YouTube video to give the chatbot more data to base responses on. We also made sure to tune the hyperparameters the same way we did the Socrates model.

```
Prompt
The following is a conversation between Mr. Beast and a young fan. They are on a podcast show talking about how Mr. Beast was bullied starting his career as a youtuber. The fan wants to talk about how Mr. Beast overcame his obstacles.

Conversation:
FAN: Hello mr beast thanks for coming to my podcast I'm a huge fan. Let's talk about how you became famous on youtube, and how you overcame hate.
MR BEAST: It's not like i didn't have a great support system or anything. i got bullied pretty hard in middle school and high school as well. you know, my mother was always by my side helping me though everything but sometimes your mom isn't there because she's cleaning the house or doing something else so it's important to form friendship outside of just family. so for instance when i was younger i would go wait for my friend after school and walk him home cause his house is 20 minutes away from the school. we'd talk about youtube all along the way back home then before we get home we'd upload a video on how to conquer math class using adding machines.
```

Initially, the response seems to mimic the transcript but it turns out that the chatbot just took similar ideas and expressed them differently. This is quite similar to the outcome we found with our Socrates chatbot when we trained and tuned it.

**Part 2.4: Experimenting with an out of context prompt:**

In this example, we gave our chatbot a prompt that was not relevant to the transcript or data about Mr. Beast online. Once again, we wanted to test the ability of the untrained model compared to our trained model when it came to answering prompts that were unrelated to any data about Mr. Beast, such as ethical consequences of creating a chatbot for YouTube ideas. We continued to use our tuned hyperparameters from the previous section and specified in the prompt that the chatbot believes what is most aligned with Mr. Beast’s ideology. The prompt we asked was:

```

Prompt
The following is a conversation on a podcast between Mr. Beast and a fan taking a Data Science lab class at UT Austin. The student has a project in which they create a chatbot that captures the likeness of certain famous people. Mr. Beast and the student discuss possibilities of the use of this chatbot, such as Youtube video ideas, and the ethical consequences. The student believes it can be beneficial to society, and Mr. Beast believes what is most aligned with his ideology.

Untrained Model Conversation Highlights:

STUDENT: Hey Mr. Beast, thanks for coming onto my podcast, do you have any ideas for this chatbot AI?
MR. BEAST: So tell me about the project you’re working on in your Data Science lab class.
STUDENT: It's a chatbot that can emulate the speech and disposition of famous people.
MR. BEAST: So tell me, what has been your experience with creating this chatbot?
STUDENT: Well, it has been going well so far, we emulated Socrates with mixed results. The outcome of this project is a bit subjective. Do you have any ideas on how we can use this project in youtube ideas?
MR. BEAST: So, tell me more about this chatbot project you're working on.
STUDENT: It's basically our final project for our data science lab
MR. BEAST: So tell me about the project you're working on. What kind of chatbot did you create?

Trained Model Conversation Highlights:

1.
STUDENT: Hey Mr. Beast, thanks for coming onto my podcast, do you have any ideas for this chatbot AI?
MR. BEAST: So first we're just going to tell you what the idea is and then we'll talk about it. You got a project where you want to make a chatbot that captures someone's likeness or something so if they type like "my hair's too long" it will print out "cut your hair." If they say like, uh uh i was gonna say some dumb comment but never mind

2.
STUDENT: yes, it is a chat AI that imitates a person’s speech, personality, and unique creativity.
MR. BEAST: I’m gonna be honest, the thing that made me the most uncomfortable was the whole mind control thing and controlling people with words, dissecting their psyche and messing with them. I truly don’t care how many millions you get for saying this. To me it would just be way cooler just to do another funny youtube video where like Kanye eats a bug or something. Something stupid but funny that's also vibrant and colorful.

3.
STUDENT: My team would like to do a Youtube collaboration with your channel, you have a lot of popularity and are known for making creative youtube videos. Do you have any ideas for our collaboration?
MR. BEAST: how long does it take to make a video
STUDENT: im not sure
MR. BEAST: And honestly, if there’s a chatroom where you just talk about like philosophical ideas and people are just throwing out like the best question you could ask to refine ideology or refine your worldview or teach someone something or whatever. Like we used to pump out video ideas until four in the morning because we would just throw out an idea and be like how well does that work and then you know two hours later you're talking about it for 20 minutes on a screen and then be like oh yeah this part doesn't work it's better to do this literally. I mean that stuff is more time consuming than producing actual videos but i think if you could get great at building the perfect learning environment on a livestream over time and like grow an audience around that kind of stuff with that type of platform i think it's more valuable to society frankly than uploading videos
```

The untrained model gave repetitive answers to this final prompt, which was quite similar to our first attempt in imitating Mr. Beast, despite having better tuned hyperparameters. On the other hand, the trained model produced far better results as we see much more creative and interesting responses. We were even able to receive a coherent opinion on what our Mr. Beast chatbot believes we should do with our hypothetical chatbot. In one of our conversations with the trained model, our Mr. Beast chatbot suggested we make a video where Kanye West eats a bug. This was extremely surprising to us as there is no data online or in our transcript that shows Mr. Beast has ever said anything about Kanye West. Of course the speech patterns were recognized and imitated based on the transcript, but it was quite interesting seeing that our chatbot proposed ideas that were unique, funny, and creative.

**Model Tradeoffs:**

The bulk of our development on these slides was on the Davinci model family because OpenAI specified that it is considered the most capable of all of its model families and that it often needs less instruction. After we tried most of our tests we briefly tried using other model families like Curie and Ada. We found that Ada was very fast in its responses as expected but didn’t find many performance differences with Davinci likely because of how much context we provided it in our prompts. We also found that Curie was much faster than Davinci and was also particularly good at generating questions and answers. We were expecting this model family to perform exceptionally just because it’s tailored to answering questions as a general service chatbot but we didn’t see a very drastic difference most likely because it is difficult to judge such a subjective topic.

**Conclusion:**

Based on our final conversation with Socrates, we believe that it is possible to emulate the speech patterns of certain people given enough data and that we can emulate their opinions with a properly engineered prompt. It is worth noting that this is a very subjective outcome because we believe the AI pulls its sentiment from patterns found on the internet and that it may not fully encapsulate the person’s unique opinions. It is worth mentioning that we were able to sway his opinion with how absolute we were with our prompt.

Tuning and training our model gave us a much better outcome with regards to speech imitation and, more importantly, idea generation. Our trained Socrates chatbot could consistently generate longer responses, and it could create more complex answers relative to the untrained model. Even though we cannot measure how much this aligns with what Socrates would actually think, we believe it is significant that it generated an opinion without the prompt explicitly telling it what to think. With regards to Mr. Beast, our trained model outperformed the untrained model on the final prompt with regards to speech emulation and idea generation as it generated unique opinions. Although it seemed to misinterpret our idea, its overall responses were closer to Mr. Beast’s personality. One major limitation on the conversations was that after a certain point, GPT-3 would seem to ‘forget’ the conversation at hand and end up saying something completely different from the most recent input. This limited the feel of a realistic chat and made us realize that there is simply a vast probabilistic model generating these responses.

**Bonus:**

ChatGPT is the latest invention from OpenAI. It uses an unreleased GPT-3.5 model which is not publicly available, but it is worlds ahead of GPT-3. We started our project about a week ago, and on the second day of our project ChatGPT was released. We have been blown away by it. Check it out below:

## [ChatGPT](https://chat.openai.com/chat?source=post_page-----e0a801810245--------------------------------)

### [A conversational AI system that listens, learns, and challenges](https://chat.openai.com/chat?source=post_page-----e0a801810245--------------------------------)

[chat.openai.com](https://chat.openai.com/chat?source=post_page-----e0a801810245--------------------------------)

![https://miro.medium.com/v2/resize:fit:700/1*w-SwpMrILgjwZZOYZpnj9A.jpeg](https://miro.medium.com/v2/resize:fit:700/1*w-SwpMrILgjwZZOYZpnj9A.jpeg)