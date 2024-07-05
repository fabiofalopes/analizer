# SUMMARY
Researchers Joshua Harrison, Ehsan Toreini, and Marhyam Mehrnezhad claim 93% accuracy in detecting keystrokes over Zoom audio, using a deep learning model to interpret sound profiles of individual keys.

# IDEAS:
* AI-backed side channel attackers can interpret remote keystrokes with high accuracy
* Laptops are more susceptible to having their keyboard recorded in quieter public areas
* Uniform, non-modular keyboards have similar acoustic profiles across models
* Combining keystroke interpretations with a hidden Markov model can correct errors
* Self-attention layers in neural networks can improve audio side channel attacks
* Changing typing style, using randomized passwords, and adding false keystrokes can mitigate attacks
* Biometric tools can be used instead of typed passwords
* Sound-based side channel attacks are a real threat, but rarely seen in disclosed breaches

# QUOTES:
* "present a greater threat to keyboards than ever"
* "crank that gain"
* "the position of a key seemed to play an important role in determining its audio profile"
* "the potential for a second machine-bolstered system to correct the false keys, given a large language corpus and the approximate location of a keystroke, seems strong"

# FACTS:
* Previous attempts at keylogging VoIP calls achieved 91.7% top-5 accuracy over Skype in 2017 and 74.3% accuracy in VoIP calls in 2018
* The researchers' paper is the first to use recent neural network technology, including self-attention layers, to propagate an audio side channel attack
* The researchers used a 2021 MacBook Pro and an iPhone 13 mini to test their concept
* The researchers achieved higher than 93% accuracy in detecting keystrokes over Zoom audio
* Sound-based side channel attacks have been used to read PGP keys and "see" a remote screen
* Side channel attacks themselves are a real threat, as seen in the 2013 "Dropmire" scandal

# REFERENCES:
* A Practical Deep Learning-Based Acoustic Side Channel Attack on Keyboards (paper)
* IEEE/Durham University (images)
* Mechanical keyboards (mentioned as a potential mitigation strategy)
* PGP keys (mentioned as a target of sound-based side channel attacks)
* Webcam mics (mentioned as a tool for "seeing" a remote screen)
* Biometric tools (mentioned as a potential alternative to typed passwords)

# RECOMMENDATIONS:
* Change your typing style to mitigate attacks
* Use randomized passwords with multiple cases to make attacks more difficult
* Add randomly generated false keystrokes to the transmitted audio of video calls
* Use biometric tools instead of typed passwords
* Consider using mechanical keyboards with different switch types as a potential mitigation strategy
