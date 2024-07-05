# SUMMARY

* Microsoft Defender Experts uncovered a multi-stage adversary-in-the-middle (AiTM) phishing and business email compromise (BEC) attack against banking and financial services organizations.
* The attack originated from a compromised trusted vendor and transitioned into a series of AiTM attacks and follow-on BEC activity spanning multiple organizations.
* The attack used an AiTM phishing kit developed, maintained, and operated by a threat actor tracked as Storm-1167.

# IDEAS:

* Adversary-in-the-middle (AiTM) phishing attacks are becoming increasingly complex and evolving to evade and even challenge conventional solutions and best practices.
* AiTM attacks use indirect proxy methods to steal session cookies and bypass traditional security controls.
* BEC attacks often involve the use of stolen credentials to sign in to email accounts and send phishing emails to the victim's contacts.
* Microsoft Defender Experts detected suspicious activities related to AiTM phishing attacks and their follow-on activities, such as session cookie theft and attempts to use the stolen cookie to sign into Exchange Online.
* Implementing MFA with conditional access policies can help protect against AiTM phishing attacks.
* Continuous monitoring and hunting for suspicious activities are essential to detecting and mitigating AiTM phishing attacks.

# QUOTES:

* "The attack used an AiTM phishing kit developed, maintained, and operated by a threat actor tracked as Storm-1167."
* "The attackers position themselves between a user and the service to steal credentials and intercept MFA in order to capture the session cookie."
* "The use of indirect proxy in this campaign provided attackers control and flexibility in tailoring the phishing pages to their targets and further their goal of session cookie theft."

# FACTS:

* The attack originated from a compromised trusted vendor.
* The attack used an AiTM phishing kit developed, maintained, and operated by a threat actor tracked as Storm-1167.
* The attack transitioned into a series of AiTM attacks and follow-on BEC activity spanning multiple organizations.
* The attack used indirect proxy methods to steal session cookies and bypass traditional security controls.
* The attack involved the use of stolen credentials to sign in to email accounts and send phishing emails to the victim's contacts.

# REFERENCES:

* Microsoft Defender Experts
* Microsoft 365 Defender
* Microsoft Sentinel
* Azure AD Identity Protection
* Defender for Cloud Apps
* Defender for Office 365
* Microsoft Authenticator
* FIDO2 security keys
* Certificate-based authentication

# RECOMMENDATIONS:

* Implement MFA with conditional access policies.
* Enable continuous access evaluation.
* Invest in advanced anti-phishing solutions.
* Continuously monitor suspicious or anomalous activities.
* Use security defaults as a baseline set of policies to improve identity security posture.
* Enable instant visibility, protection, and governance actions for cloud apps.
* Use connectors for Office 365 and Azure to detect AiTM attacks.
* Use the Microsoft Authenticator, FIDO2 security keys, and certificate-based authentication to enhance identity security.
