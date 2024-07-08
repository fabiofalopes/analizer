# Secrets Exposed in Hugging Face Hack - SecurityWeek

Created: June 29, 2024 7:27 PM
URL 1: https://www.securityweek.com/secrets-exposed-in-hugging-face-hack/

![https://www.securityweek.com/wp-content/uploads/2024/06/Hugging-Face.jpeg](https://www.securityweek.com/wp-content/uploads/2024/06/Hugging-Face.jpeg)

Hugging Face hack

**AI tool development company Hugging Face informed customers on Friday that it had detected unauthorized access to its Spaces platform.**

Hugging Face Spaces makes it easier for users to create and share machine learning (ML) applications and demos with others.

According to the company, the unauthorized access to the Spaces platform may have exposed “a subset of Spaces’ secrets”.

In response, it has revoked tokens present in the compromised secrets and it has notified impacted users.

“We recommend you refresh any key or token and consider switching your HF tokens to fine-grained access tokens which are the new default,” [Hugging Face said](https://huggingface.co/blog/space-secrets-disclosure) in a blog post.

The company has called in external forensics experts to assist with the investigation, and it has notified law enforcement and data protection authorities.

“Over the past few days, we have made other significant improvements to the security of the Spaces infrastructure, including completely removing org tokens (resulting in increased traceability and audit capabilities), implementing key management service (KMS) for Spaces secrets, robustifying and expanding our system’s ability to identify leaked tokens and proactively invalidate them, and more generally improving our security across the board,” Hugging Face said.

“We also plan on completely deprecating ‘classic’ read and write tokens in the near future, as soon as fine-grained access tokens reach feature parity,” it added.

In late 2023, an AI security startup discovered more than 1,600 [Hugging Face API tokens](https://www.securityweek.com/major-organizations-using-hugging-face-ai-tools-put-at-risk-by-leaked-api-tokens/) exposed in code repositories, providing access to hundreds of organizations’ accounts.

**Related**: [Critical Flaw in AI Python Package Can Lead to System and Data Compromise](https://www.securityweek.com/critical-flaw-in-ai-python-package-can-lead-to-system-and-data-compromise/)

**Related**: [Eight Vulnerabilities Disclosed in the AI Development Supply Chain](https://www.securityweek.com/eight-vulnerabilities-disclosed-in-the-ai-development-supply-chain/)

**Related**: [Critical Vulnerabilities Found in Open Source AI/ML Platforms](https://www.securityweek.com/critical-vulnerabilities-found-in-ai-ml-open-source-platforms/)