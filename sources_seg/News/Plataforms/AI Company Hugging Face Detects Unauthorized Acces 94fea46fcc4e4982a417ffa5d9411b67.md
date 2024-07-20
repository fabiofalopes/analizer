# AI Company Hugging Face Detects Unauthorized Access to Its Spaces Platform

Created: June 29, 2024 7:26 PM
URL 1: https://thehackernews.com/2024/06/ai-company-hugging-face-notifies-users.html

Artificial Intelligence (AI) company Hugging Face on Friday disclosed that it detected unauthorized access to its Spaces platform earlier this week.

"We have suspicions that a subset of Spaces' secrets could have been accessed without authorization," it [said](https://huggingface.co/blog/space-secrets-disclosure) in an advisory.

[Spaces](https://huggingface.co/spaces) offers a way for users to [create, host, and share](https://huggingface.co/docs/hub/en/spaces-overview) AI and machine learning (ML) applications. It also functions as a discovery service to look up AI apps made by other users on the platform.

In response to the security event, Hugging Space said it is taking the step of revoking a number of [HF tokens](https://huggingface.co/docs/hub/en/security-tokens) present in those secrets and that it's notifying users who had their tokens revoked via email.

"We recommend you refresh any key or token and consider switching your HF tokens to fine-grained access tokens which are the new default," it added.

Hugging Face, however, did not disclose how many users are impacted by the incident, which is currently under further investigation. It has also alerted law enforcement agencies and data protection authorities of the breach.

The development comes as the explosive growth of the AI sector has landed AI-as-a-service (AIaaS) providers like Hugging Face in attackers' crosshairs, who could exploit them for malicious purposes.

In early April, cloud security firm Wiz [detailed](https://thehackernews.com/2024/04/ai-as-service-providers-vulnerable-to.html) security issues in Hugging Face that could permit an adversary to gain cross-tenant access and poison AI/ML models by taking over the continuous integration and continuous deployment (CI/CD) pipelines.

Previous research undertaken by HiddenLayer also [unearthed](https://thehackernews.com/2024/02/new-hugging-face-vulnerability-exposes.html) flaws in the Hugging Face Safetensors conversion service that made it possible to hijack the AI models submitted by users and stage supply chain attacks.

"If a malicious actor were to compromise Hugging Face's platform, they could potentially gain access to private AI models, datasets, and critical applications, leading to widespread damage and potential supply chain risk," Wiz researchers noted in April.