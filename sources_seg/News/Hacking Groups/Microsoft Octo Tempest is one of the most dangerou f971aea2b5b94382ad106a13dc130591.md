# Microsoft: Octo Tempest is one of the most dangerous financial hacking groups

Created: June 29, 2024 7:02 PM
URL 1: https://www.bleepingcomputer.com/news/security/microsoft-octo-tempest-is-one-of-the-most-dangerous-financial-hacking-groups/

# **Microsoft: Octo Tempest is one of the most dangerous financial hacking groups**

By [**Ionut Ilascu**](https://www.bleepingcomputer.com/author/ionut-ilascu/)

- October 26, 2023
- 06:55 PM

![https://www.bleepstatic.com/content/hl-images/2023/10/27/oktospider.jpg](https://www.bleepstatic.com/content/hl-images/2023/10/27/oktospider.jpg)

Microsoft has published a detailed profile of a native English-speaking threat actor with advanced social engineering capabilities it tracks as Octo Tempest, that targets companies in data extortion and ransomware attacks.

Octo Tempest’s attacks have steadily evolved since early 2022, expanding their targeting to organizations providing cable telecommunications, email, and tech services, and partnering with the ALPHV/BlackCat ransomware group.

### **From account theft to ransomware**

The threat actor was initially observed selling SIM swaps and stealing accounts of high-profile individuals with cryptocurrency assets.

In late 2022, Octa Tempest moved to phishing, social engineering, resetting passwords en-masse for the customers of breached service providers, and data theft.

Earlier this year, the threat group attacked companies in the gaming, hospitality, retail, manufacturing, technology, and financial sectors, as well as managed service providers (MSPs).

After becoming an ALPHV/BlackCat affiliate, Octa Tempest deployed the ransomware both to steal and to encrypt victim data.

**Octo Tempest threat group's evolution to ransomware***source: Microsoft*

![https://www.bleepstatic.com/images/news/u/1100723/Octo-Tempest-evolution.webp](https://www.bleepstatic.com/images/news/u/1100723/Octo-Tempest-evolution.webp)

The group used its accumulated experience to build more advanced and aggressive attacks and also started to monetize intrusions by extorting victims after stealing data.

Microsoft says that Octo Tempest also used direct physical threats in some cases to obtain logins that would advance their attack.

**Octo Tempest's physical harm threats to obtain account logins***source: Microsoft*

![https://www.bleepstatic.com/images/news/u/1100723/OctoTempest_threats.webp](https://www.bleepstatic.com/images/news/u/1100723/OctoTempest_threats.webp)

In an odd turn of events, Octo Tempest became an affiliate of the ALPHV/BlackCat ransomware-as-a-service (RaaS) operation, Microsoft says, and by June they started deploying both the Windows and Linux ransomware payloads, focusing on VMware ESXi servers lately.

“This is notable in that, historically, Eastern European ransomware groups refused to do business with native English-speaking criminals” - [Microsoft](https://www.microsoft.com/en-us/security/blog/2023/10/25/octo-tempest-crosses-boundaries-to-facilitate-extortion-encryption-and-destruction/)

The more recent attacks from this group target organizations in a variety of sectors, including gaming, natural resources, hospitality, consumer products, retail, managed service providers, manufacturing, law, technology, and financial services.

### **Octo Tempest TTPs**

Microsoft assesses that Octo Tempest is a well-organized group that includes members with extensive technical knowledge and multiple hand-on-keyboard operators.

The hackers often gain initial access through advanced social engineering that targets accounts of technical administrators (e.g. support and help desk staff) with enough permissions to further the attack.

They research the company to identify the targets they can impersonate to the level of mimicking the speech patterns of the individual in phone calls.

By doing so, they trick technical administrators into performing password resets and reset multi-factor authentication (MFA) methods.

Other methods for initial access include:

- tricking the target into installing remote monitoring and management software
- stealing the logins through phishing sites
- buying credentials or session tokens from other cybercriminals
- SMS phishing employees with links to fake login portals that capture the credentials
- SIM-swapping or call forwarding
- Direct threats of violence

Once they get sufficient access, Octo Tempest hackers start the reconnaissance stage of the attack by enumerating hosts and services and collecting information that would permit abusing legitimate channels to progress the intrusion.

“Initial bulk-export of users, groups, and device information is closely followed by enumerating data and resources readily available to the user’s profile within virtual desktop infrastructure or enterprise-hosted resources” - Microsoft

Octo Tempest then proceeds to explore the infrastructure, enumerating access and resources across cloud environments, code repositories, server and backup management systems.

To escalate privileges, the threat actor again turns to social engineering, SIM-swapping, or call forwarding, and initiates a self-service password reset of the target’s account.

During this step, the hackers build trust with the victim by using compromised accounts and demonstrating an understanding of the company’s procedures. If they have a manager’s account, they approve requests for increased permissions themselves.

For as long as they have access, Octo Tempest continues to look for additional credentials to expand their reach. They use tools like Jercretz and TruffleHog to automate the search for plaintext keys, secrets, and passwords across code repositories.

To keep their tracks hidden, the hackers also target the accounts of security personnel, which allows them to disable security products and features.

“Using compromised accounts, the threat actor leverages EDR and device management technologies to allow malicious tooling, deploy RMM software, remove or impair security products, data theft of sensitive files (e.g. files with credentials, signal messaging databases, etc.), and deploy malicious payloads” - Microsoft

According to Microsoft, Octo Tempest tries to hide their presence on the network by suppressing alerts of changes and modifying the mailbox rules to delete emails that could raise the victim’s suspicions of a breach.

The researchers provide the following additional tools and techniques that Octo Tempest uses in their attacks:

- open-source tools: [ScreenConnect](https://screenconnect.connectwise.com/), [FleetDeck](https://fleetdeck.io/), [AnyDesk](https://anydesk.com/), [RustDesk](https://rustdesk.com/), [Splashtop](https://www.splashtop.com/), [Pulseway](https://www.pulseway.com/), [TightVNC](https://www.tightvnc.com/), LummaC2, Level.io, Mesh, [TacticalRMM](https://github.com/amidaware/tacticalrmm), [Tailscale](https://tailscale.com/), [Ngrok](https://ngrok.com/), [WsTunnel](https://github.com/erebe/wstunnel), [Rsocx](https://github.com/b23r0/rsocx), and [Socat](https://linux.die.net/man/1/socat)
- deploying Azure virtual machines to enable remote access via RMM installation or modification to existing resources via Azure serial console
- adding MFA methods to existing users
- using the tunneling tool [Twingate](https://www.twingate.com/), which leverages Azure Container instances as a private connector (without public network exposure)

The hackers also move stolen data to their servers using a unique technique, which involves Azure Data Factory and automated pipelines to blend in with typical big data operations.

To export SharePoint document libraries and transfer the files quicker, the attacker has been often observed to register legitimate Microsoft 365 backup solutions such as Veeam, AFI Backup, and CommVault.

Microsoft notes that detecting or hunting for this threat actor in an environment is not an easy task due to the use of social engineering, living-off-the-land techniques, and the diverse tooling.

However, the researchers provide a set of general guidelines that could help detect malicious activity, which starts with monitoring and reviewing identity-related processes, Azure environments, and endpoints.

Octo Tempest is financially motivated and achieves its goals through stealing cryptocurrency, data theft extortion, or encrypting systems and asking for a ransom.