# AI researchers claim 93% accuracy in detecting keystrokes over Zoom audio | Ars Technica

Created: June 29, 2024 5:55 PM
URL: https://arstechnica.com/gadgets/2023/08/type-softly-researchers-can-guess-keystrokes-by-sound-with-93-accuracy/

![https://cdn.arstechnica.net/wp-content/uploads/2023/08/GettyImages-1174561644-800x533.jpg](https://cdn.arstechnica.net/wp-content/uploads/2023/08/GettyImages-1174561644-800x533.jpg)

Some people hate to hear other people's keyboards on video calls, but AI-backed side channel attackers? They say crank that gain.

By recording keystrokes and training a deep learning model, three researchers claim to have achieved upwards of 90 percent accuracy in interpreting remote keystrokes, based on the sound profiles of individual keys.

In their paper [*A Practical Deep Learning-Based Acoustic Side Channel Attack on Keyboards*](https://ieeexplore.ieee.org/abstract/document/10190721) ([full PDF](https://arxiv.org/pdf/2308.01074.pdf)), UK researchers Joshua Harrison, Ehsan Toreini, and Marhyam Mehrnezhad claim that the trio of ubiquitous machine learning, microphones, and video calls "present a greater threat to keyboards than ever." Laptops, in particular, are more susceptible to having their keyboard recorded in quieter public areas, like coffee shops, libraries, or offices, the paper notes. And most laptops have uniform, non-modular keyboards, with similar acoustic profiles across models.

Previous attempts at keylogging VoIP calls, without physical access to the subject, achieved [91.7 percent top-5 accuracy over Skype in 2017](https://arxiv.org/pdf/1609.09359.pdf) and [74.3 percent accuracy in VoIP calls in 2018](https://dl.acm.org/doi/10.1145/3176258.3176341). Combining the output of the keystroke interpretations with a "hidden Markov model" (HMM), which guesses at more-likely next-letter outcomes and could correct "hrllo" to "hello," saw one prior side channel study's accuracy jump from 72 to 95 percent—though that was [an attack on dot-matrix printers](https://www.usenix.org/legacy/events/sec10/tech/full_papers/Backes.pdf). The Cornell researchers believe their paper is the first to make use of the recent sea change in neural network technology, including [self-attention layers](https://towardsdatascience.com/illustrated-self-attention-2d627e33b20a), to propagate an audio side channel attack.

- 
    
       Training and validation accuracy for the researchers' study, with phone-recorded data on the left, and Zoom on the right.    IEEE/Durham University  
    
- 
    
       The microfiber towel was to reduce table vibration pickup. It's a bit conspicuous, but it also might not be necessary, given how well the Zoom results turned out.    IEEE/Durham University  
    
- 
    
       The process for turning audio recordings into machine-learning-friendly bits.    IEEE/Durham University  
    
- 
    
       More detail on how audio files were transformed into data ready for analysis.    IEEE/Durham University  
    

[Previous SlideNext Slide](https://arstechnica.com/gadgets/2023/08/type-softly-researchers-can-guess-keystrokes-by-sound-with-93-accuracy/#)

- 
    
    ![https://cdn.arstechnica.net/wp-content/uploads/2023/08/Screenshot-2023-08-07-at-1.15.12-PM-150x150.png](https://cdn.arstechnica.net/wp-content/uploads/2023/08/Screenshot-2023-08-07-at-1.15.12-PM-150x150.png)
    
- 
    
    ![https://cdn.arstechnica.net/wp-content/uploads/2023/08/Screenshot-2023-08-07-at-1.15.33-PM-150x150.png](https://cdn.arstechnica.net/wp-content/uploads/2023/08/Screenshot-2023-08-07-at-1.15.33-PM-150x150.png)
    
- 
    
    ![https://cdn.arstechnica.net/wp-content/uploads/2023/08/Screenshot-2023-08-07-at-1.14.33-PM-150x150.png](https://cdn.arstechnica.net/wp-content/uploads/2023/08/Screenshot-2023-08-07-at-1.14.33-PM-150x150.png)
    
- 
    
    ![https://cdn.arstechnica.net/wp-content/uploads/2023/08/Screenshot-2023-08-07-at-1.15.03-PM-150x150.png](https://cdn.arstechnica.net/wp-content/uploads/2023/08/Screenshot-2023-08-07-at-1.15.03-PM-150x150.png)
    

The researchers used a 2021 MacBook Pro to test their concept, a laptop that "features a keyboard identical in switch design to their models from the last two years and potentially those in the future," typing on 36 keys 25 times each to train their model on the waveforms associated with each key. They used an iPhone 13 mini, 17 cm away, to record the keyboard's audio for their first test. For the second test, they recorded the laptop keys over Zoom, using the MacBook's built-in microphones, with Zoom's noise suppression set to its lowest level. In both tests, they were able to achieve higher than 93 percent accuracy, with the phone-recorded audio edging closer to 95-96 percent.

The researchers noted that the position of a key seemed to play an important role in determining its audio profile. Most false-classifications, they wrote, tended to be only one or two keys away. Because of this, the potential for a second machine-bolstered system to correct the false keys, given a large language corpus and the approximate location of a keystroke, seems strong.

What could be done to mitigate these kinds of attacks? The paper suggests a few defenses:

- Changing your typing style, with touch typing in particular being less accurately recognized
- Using randomized passwords with multiple cases, since these attacks struggle to recognize the "release peak" of a shift key
- Adding randomly generated false keystrokes to the transmitted audio of video calls, though this "may inhibit usability of the software for the receiver."
- Use of biometric tools, like fingerprint or face scanning, rather than typed passwords

Personally, I take this as validation of my impulse to maintain [a collection of mechanical keyboards](https://arstechnica.com/tag/mechanical-keyboards/) with different switch types, but the researchers had no particular say on that strategy.

Sound-based side channel attacks on sensitive computer data are sometimes seen in research, though rarely in disclosed breaches. Scientists have used [computer sounds to read PGP keys](https://arstechnica.com/information-technology/2013/12/new-attack-steals-e-mail-decryption-keys-by-capturing-computer-sounds/), and machine learning and webcam mics to ["see" a remote screen](https://arstechnica.com/information-technology/2018/08/researchers-find-way-to-spy-on-remote-screens-through-the-webcam-mic/). Side channel attacks themselves are a real threat, however. The [2013 "Dropmire" scandal](https://arstechnica.com/information-technology/2013/07/how-the-us-probably-spied-on-european-allies-encrypted-faxes/) that saw the US spying on its European allies was highly likely to have involved some kind of side channel attack, whether through wires, radio frequencies, or sound.