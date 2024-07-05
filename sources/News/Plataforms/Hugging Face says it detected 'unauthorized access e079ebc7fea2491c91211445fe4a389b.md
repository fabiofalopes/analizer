# Hugging Face says it detected 'unauthorized access' to its AI model hosting platform | TechCrunch

Created: June 29, 2024 7:26 PM
URL 1: https://techcrunch.com/2024/05/31/hugging-face-says-it-detected-unauthorized-access-to-its-ai-model-hosting-platform/?guccounter=1

[AI](https://techcrunch.com/category/artificial-intelligence/)

![https://techcrunch.com/wp-content/uploads/2023/08/11f5fd43-3e13-4313-a003-9d36a81e3fde.png](https://techcrunch.com/wp-content/uploads/2023/08/11f5fd43-3e13-4313-a003-9d36a81e3fde.png)

Image Credits: Hugging Face

Late Friday afternoon, a time window companies usually reserve for unflattering disclosures, AI startup Hugging Face said that its security team earlier this week detected “unauthorized access” to Spaces, Hugging Face’s platform for creating, sharing and hosting AI models and resources.

In a [blog post](https://huggingface.co/blog/space-secrets-disclosure), Hugging Face said that the intrusion related to Spaces secrets, or the private pieces of information that act as keys to unlock protected resources like accounts, tools and dev environments, and that it has “suspicions” some secrets could’ve been accessed by a third party without authorization.

As a precaution, Hugging Face has revoked a number of tokens in those secrets. (Tokens are used to verify identities.) Hugging Face says that users whose tokens have been revoked have already received an email notice and is recommending that all users “refresh any key or token” and consider switching to fine-grained access tokens, which Hugging Face claims are more secure.

It wasn’t immediately clear how many users or apps were impacted by the potential breach.

“We are working with outside cyber security forensic specialists, to investigate the issue as well as review our security policies and procedures. We have also reported this incident to law enforcement agencies and Data [sic] protection authorities,” Hugging Face wrote in the post. “We deeply regret the disruption this incident may have caused and understand the inconvenience it may have posed to you. We pledge to use this as an opportunity to strengthen the security of our entire infrastructure.”

In an emailed statement, a Hugging Face spokesperson told TechCrunch:

“We’ve been seeing the number of cyberattacks increase significantly in the past few months, probably because our usage has been growing significantly and AI is becoming more mainstream. It’s technically difficult to know how many spaces secrets have been compromised.”

The possible hack of Spaces comes as Hugging Face, which is among the largest platforms for collaborative AI and data science projects with over one million models, data sets and AI-powered apps, faces increasing scrutiny over its security practices.

In April, researchers at cloud security firm Wiz found a [vulnerability](https://www.darkreading.com/cloud-security/critical-bugs-hugging-face-ai-platform-pickle) — since fixed — that would allow attackers to execute arbitrary code during a Hugging Face-hosted app’s build time that’d let them examine network connections from their machines. Earlier in the year, security firm JFrog [uncovered](https://arstechnica.com/security/2024/03/hugging-face-the-github-of-ai-hosted-code-that-backdoored-user-devices/) evidence that code uploaded to Hugging Face covertly installed backdoors and other types of malware on end-user machines. And security startup HiddenLayer identified ways Hugging Face’s ostensibly safer serialization format, Safetensors, could be [abused](https://go.skimresources.com/?id=100098X1555750&isjs=1&jv=15.7.0&sref=https%3A%2F%2Farstechnica.com%2Fsecurity%2F2024%2F03%2Fhugging-face-the-github-of-ai-hosted-code-that-backdoored-user-devices%2F&url=https%3A%2F%2Fhiddenlayer.com%2Fresearch%2Fsilent-sabotage%2F&xs=1&xtz=240&xuuid=874ee97460f59add3a198f578a496a33&abp=1&xjsf=other_click__contextmenu%20%5B2%5D) to create sabotaged AI models.

Hugging Face [recently said](https://huggingface.co/blog/hugging-face-wiz-security-blog) that it would partner with Wiz to use the company’s vulnerability scanning and cloud environment configuration tools “with the goal of improving security across our platform and the AI/ML ecosystem at large.”

### More TechCrunch