# SUMMARY
Microsoft reports on Octo Tempest, a dangerous financial hacking group with advanced social engineering capabilities, targeting companies in data extortion and ransomware attacks.

# IDEAS:
* Octo Tempest is a native English-speaking threat actor with advanced social engineering capabilities.
* The group targets companies in data extortion and ransomware attacks.
* Octo Tempest's attacks have evolved since early 2022, expanding to organizations providing cable telecommunications, email, and tech services.
* The group partners with the ALPHV/BlackCat ransomware group.
* Octo Tempest uses direct physical threats to obtain logins that would advance their attack.
* The group became an affiliate of the ALPHV/BlackCat ransomware-as-a-service (RaaS) operation.
* Octo Tempest targets organizations in various sectors, including gaming, natural resources, hospitality, consumer products, retail, managed service providers, manufacturing, law, technology, and financial services.
* The group uses advanced social engineering to trick technical administrators into performing password resets and reset multi-factor authentication (MFA) methods.
* Octo Tempest hackers use tools like Jercretz and TruffleHog to automate the search for plaintext keys, secrets, and passwords across code repositories.
* The group targets the accounts of security personnel to disable security products and features.
* Octo Tempest tries to hide their presence on the network by suppressing alerts of changes and modifying the mailbox rules to delete emails that could raise the victim's suspicions of a breach.

# QUOTES:
* "This is notable in that, historically, Eastern European ransomware groups refused to do business with native English-speaking criminals" - Microsoft
* "Initial bulk-export of users, groups, and device information is closely followed by enumerating data and resources readily available to the user's profile within virtual desktop infrastructure or enterprise-hosted resources" - Microsoft
* "Using compromised accounts, the threat actor leverages EDR and device management technologies to allow malicious tooling, deploy RMM software, remove or impair security products, data theft of sensitive files (e.g. files with credentials, signal messaging databases, etc.), and deploy malicious payloads" - Microsoft

# FACTS:
* Octo Tempest is a well-organized group with members having extensive technical knowledge and multiple hand-on-keyboard operators.
* The group uses social engineering to gain initial access to target companies.
* Octo Tempest hackers research the company to identify targets they can impersonate to the level of mimicking the speech patterns of the individual in phone calls.
* The group uses various methods for initial access, including phishing, SIM-swapping, and buying credentials or session tokens from other cybercriminals.
* Octo Tempest hackers use tools like ScreenConnect, FleetDeck, AnyDesk, RustDesk, Splashtop, Pulseway, TightVNC, LummaC2, Level.io, Mesh, TacticalRMM, Tailscale, Ngrok, WsTunnel, Rsocx, and Socat in their attacks.
* The group deploys Azure virtual machines to enable remote access via RMM installation or modification to existing resources via Azure serial console.
* Octo Tempest hackers add MFA methods to existing users and use the tunneling tool Twingate, which leverages Azure Container instances as a private connector (without public network exposure).
* The group moves stolen data to their servers using a unique technique, which involves Azure Data Factory and automated pipelines to blend in with typical big data operations.

# REFERENCES:
* Microsoft
* Ionut Ilascu
* BleepingComputer
* ALPHV/BlackCat ransomware group
* ScreenConnect
* FleetDeck
* AnyDesk
* RustDesk
* Splashtop
* Pulseway
* TightVNC
* LummaC2
* Level.io
* Mesh
* TacticalRMM
* Tailscale
* Ngrok
* WsTunnel
* Rsocx
* Socat
* Twingate
* Azure Data Factory
* Veeam
* AFI Backup
* CommVault

# RECOMMENDATIONS:
* Monitor and review identity-related processes, Azure environments, and endpoints to detect malicious activity.
* Implement advanced social engineering detection and prevention measures.
* Use multi-factor authentication and password management best practices.
* Regularly review and update security products and features.
* Implement data encryption and backup solutions to protect against data theft and extortion.
* Educate employees on the risks of phishing and social engineering attacks.
