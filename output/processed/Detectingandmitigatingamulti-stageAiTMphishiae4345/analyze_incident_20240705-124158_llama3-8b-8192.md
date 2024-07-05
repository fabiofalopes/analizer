Here is the extracted information in the requested format:

**Attack Date:** Not specified

**Summary:** A multi-stage adversary-in-the-middle (AiTM) phishing and business email compromise (BEC) attack was discovered, which used an indirect proxy method to steal session cookies and compromise identities.

**Key Details:**

* **Attack Type:** AiTM phishing and BEC
* **Vulnerable Component:** Session cookies
* **Attacker Information:**
	+ Name/Organization: Storm-1167
	+ Country of Origin: Not specified
* **Target Information:**
	+ Name: Multiple banking and financial services organizations
	+ Country: Not specified
	+ Size: Large enterprise
	+ Industry: Financial services

**Incident Details:**

* **CVE's:** Not specified
* **Accounts Compromised:** Not specified
* **Business Impact:** Operational disruption
* **Impact Explanation:** The attack allowed the attackers to steal session cookies and compromise identities, enabling them to access cloud applications and perform business email compromise attacks.
* **Root Cause:** Unpatched software

**Analysis & Recommendations:**

* **MITRE ATT&CK Analysis:** T1557, T1111
* **Atomic Red Team Atomics:** Not specified
* **Remediation:**
	+ Recommendation: Implement MFA and conditional access policies
	+ Action Plan: 1. Update software, 2. Train staff
* **Lessons Learned:** Proactively hunting for and quickly responding to threats is essential in securing organization networks, as it provides an added layer to other security remediations and can help address areas of defense evasion.

**Mitigation and Protection Guidance:**

* Implement MFA and conditional access policies
* Use security defaults as a baseline set of policies
* Enable continuous access evaluation
* Invest in advanced anti-phishing solutions
* Continuously monitor suspicious or anomalous activities

**Hunting Queries:**

* Microsoft Sentinel: TI Matching Analytics, Sign-ins From VPS providers
