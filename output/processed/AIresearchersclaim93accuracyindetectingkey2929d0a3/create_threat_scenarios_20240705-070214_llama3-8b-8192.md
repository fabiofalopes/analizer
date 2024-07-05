Based on the article, I will create a threat model for the situation. Here is the output:

**THREAT SCENARIOS**

* An attacker records the audio of a person typing on their laptop over Zoom and uses a deep learning model to guess the keystrokes with 93% accuracy.
* An attacker uses a phone to record the audio of a person typing on their laptop and uses a deep learning model to guess the keystrokes with 95-96% accuracy.
* An attacker uses a combination of audio recordings and a hidden Markov model to correct the keystroke interpretations and achieve 95% accuracy.

**THREAT MODEL ANALYSIS**

* The researchers used a 2021 MacBook Pro to test their concept, typing on 36 keys 25 times each to train their model on the waveforms associated with each key.
* The researchers used an iPhone 13 mini, 17 cm away, to record the keyboard's audio for their first test.
* The researchers recorded the laptop keys over Zoom, using the MacBook's built-in microphones, with Zoom's noise suppression set to its lowest level.
* The position of a key seemed to play an important role in determining its audio profile.
* Most false-classifications tended to be only one or two keys away.

**RECOMMENDED CONTROLS**

* Change your typing style, with touch typing in particular being less accurately recognized.
* Use randomized passwords with multiple cases, since these attacks struggle to recognize the "release peak" of a shift key.
* Add randomly generated false keystrokes to the transmitted audio of video calls, though this "may inhibit usability of the software for the receiver."
* Use biometric tools, like fingerprint or face scanning, rather than typed passwords.

**NARRATIVE ANALYSIS**

The researchers' study highlights the potential for an attacker to record the audio of a person typing on their laptop over Zoom and use a deep learning model to guess the keystrokes with high accuracy. This raises concerns about the security of video conferencing and the potential for side-channel attacks. The study suggests that changing typing styles, using randomized passwords, and adding false keystrokes to the transmitted audio could help mitigate these attacks. Additionally, using biometric tools could provide an alternative to typed passwords.

**CONCLUSION**

The study demonstrates the potential for an attacker to record the audio of a person typing on their laptop over Zoom and use a deep learning model to guess the keystrokes with high accuracy. This highlights the need for individuals to take steps to protect their sensitive information, such as changing typing styles, using randomized passwords, and adding false keystrokes to the transmitted audio.
