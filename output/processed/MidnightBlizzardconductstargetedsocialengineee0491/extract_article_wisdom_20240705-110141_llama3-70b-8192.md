**SUMMARY**
Microsoft Threat Intelligence has identified targeted social engineering attacks using credential theft phishing lures sent as Microsoft Teams chats by the threat actor Midnight Blizzard (previously tracked as NOBELIUM).

**IDEAS**
* Midnight Blizzard uses compromised Microsoft 365 tenants to create new domains that appear as technical support entities.
* The threat actor sends lures that attempt to steal credentials from a targeted organization by engaging a user and eliciting approval of multifactor authentication (MFA) prompts.
* The attack has affected fewer than 40 unique global organizations, primarily in government, non-government organizations (NGOs), IT services, technology, discrete manufacturing, and media sectors.
* Midnight Blizzard is a Russia-based threat actor attributed by the US and UK governments as the Foreign Intelligence Service of the Russian Federation, also known as the SVR.
* The threat actor is known to primarily target governments, diplomatic entities, non-government organizations (NGOs), and IT service providers primarily in the US and Europe.
* Midnight Blizzard utilizes diverse initial access methods, including stolen credentials, supply chain attacks, exploitation of on-premises environments, and exploitation of service providers’ trust chain.

**QUOTES**
* "We encourage organizations to reinforce security best practices to all users and reinforce that any authentication requests not initiated by the user should be treated as malicious."
* "Midnight Blizzard is consistent and persistent in their operational targeting, and their objectives rarely change."

**FACTS**
* Midnight Blizzard has been active since at least early 2018.
* The threat actor is known to use token theft techniques for initial access into targeted environments.
* Microsoft has mitigated the actor from using the compromised domains.
* The attack pattern observed in malicious activity since at least late May 2023 has been identified as a subset of broader credential attack campaigns attributed to Midnight Blizzard.

**REFERENCES**
* Microsoft Threat Intelligence
* Microsoft Defender Threat Intelligence
* Microsoft Purview
* Microsoft Sentinel
* Azure Active Directory
* Microsoft Entra ID
* Active Directory Federation Service (AD FS)
* FOGGYWEB and MAGICWEB malware
* Phishing-resistant authentication methods
* Conditional Access authentication strength
* Security best practices for Microsoft Teams
* Security guide for Microsoft Teams
* Microsoft 365 auditing
* Microsoft’s recommended security baselines
* Attack simulation training
* Social engineering
* Phishing attacks
* Conditional Access App Control in Microsoft Defender for Cloud Apps

**RECOMMENDATIONS**
* Pilot and start deploying phishing-resistant authentication methods for users.
* Implement Conditional Access authentication strength to require phishing-resistant authentication for employees and external users for critical apps.
* Apply security best practices for Microsoft Teams.
* Keep Microsoft 365 auditing enabled.
* Allow only known devices that adhere to Microsoft’s recommended security baselines.
* Educate users about social engineering and credential phishing attacks.
* Implement Conditional Access App Control in Microsoft Defender for Cloud Apps for users connecting from unmanaged devices.
