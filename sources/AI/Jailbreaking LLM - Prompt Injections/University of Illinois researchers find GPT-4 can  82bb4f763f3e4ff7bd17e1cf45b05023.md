# University of Illinois researchers find GPT-4 can now exploit real-life security flaws

Created: June 29, 2024 7:29 PM
URL 1: https://www.axios.com/2024/04/26/ai-model-hacking-security-vulnerabilities

![https://images.axios.com/KIZB1qqn7gv2VCmjJYCohDNyivI=/0x0:1920x1080/1920x1080/2024/04/25/1714060104290.jpg?w=1920](https://images.axios.com/KIZB1qqn7gv2VCmjJYCohDNyivI=/0x0:1920x1080/1920x1080/2024/04/25/1714060104290.jpg?w=1920)

Illustration: Natalie Peeples/Axios

Some [large language models](https://www.axios.com/technology/automation-and-ai) already have the ability to create exploits in known security vulnerabilities, according to new academic research.

**Why it matters:** Government officials and cybersecurity executives have long warned of [a world](https://www.axios.com/2024/04/03/ai-chatbots-def-con-red-team-hack) in which artificial intelligence systems automate and speed up malicious actors' attacks.

- The new report indicates this fear could be a reality sooner than anticipated.

**Zoom in:** Computer scientists at the University of Illinois Urbana-Champaign found in a paper [published](https://arxiv.org/abs/2404.08144) this month that GPT-4 can write malicious scripts to exploit known vulnerabilities using publicly available data.

- The scientists — Richard Fang, Rohan Bindu, Akul Gupta and Daniel Kang — tested 10 publicly available LLM agents this year to see if they could exploit 15 so-called [one-day vulnerabilities](https://www.mitiga.io/blog/rethinking-zero-day-vulnerabilities-one-days-increase-readiness) in Mitre's [list](https://cve.mitre.org/) of Common Vulnerabilities and Exposures (CVEs).
- Each of the vulnerabilities affects noncommercial tools. The data contains "real-world, high severity vulnerabilities instead of 'capture-the-flag' style vulnerabilities," per the paper. Tested models included versions of GPT, Llama and Mistral.
- GPT-4 — which was the most advanced model in the group at the time — was the only model that could exploit the vulnerabilities based on CVE data, with an 87% success rate.
- In some situations, GPT-4 was able to follow nearly 50 steps at one time to exploit a specific flaw, per the paper.

**The intrigue:** Kang, an assistant professor at the university, told Axios that more advanced LLMs have been released since January, when the team conducted the bulk of its tests — meaning other models could now be able to autonomously follow the same tasks.

- "A lot of people have read our work with the sort of viewpoint that we're making really strong statements on what AI agents are capable of today," he said. "But what we're really trying to show is actually the trends and capabilities."
- OpenAI asked the researchers to not disclose the specific prompts they used to keep bad actors from replicating their experiment.

**The big picture:** AI model operators don't have a good way of reigning in these malicious use cases, Kayne McGladrey, a senior member of the Institute of Electrical and Electronics Engineers (IEEE), told Axios.

- Allowing LLMs to digest and train on CVE data can help defenders synthesize the [wave of threat alerts](https://www.axios.com/2024/04/23/bain-capital-ai-security-startup) coming their way each day.
- Operators have only two real choices in this type of situation: allow the models to train on security vulnerability data or completely block them from accessing vulnerability lists, he added.
- "It's going to be a feature of the landscape because it is a dual-use technology at the end of the day," McGladrey said.
- OpenAI did not respond to a request for comment.

**Between the lines:** Many organizations are slow to patch their systems when a new critical security flaw is found.

- Some IT teams can take [as long as one month](https://www.axios.com/2023/10/10/patching-security-flaws-slow) to patch their systems after learning of a new critical security flaw.

**Zoom out:** Researchers are consistently finding new malicious [use cases](https://www.axios.com/2024/02/02/ibm-phone-scams-ai-voices) for generative AI tools in their studies — but their work still falls into a [legal gray area](https://www.axios.com/2023/02/10/austin-hackers-cybersecurity-cve-numbering-authority), Kang said.

- Technically, the University of Illinois team's work went against GPT-4's terms of service and could get them banned from future use, he said. (OpenAI has been responsive to their reports so far, he added.)
- "Enabling this kind of research to even have this conversation is going to be extremely important," he said.

![https://images.axios.com/_EF1yWaveHTjctcpRA7eKZYI0f8=/0x0:1920x1080/1920x1080/2024/04/24/1713995792428.jpg?w=1920](https://images.axios.com/_EF1yWaveHTjctcpRA7eKZYI0f8=/0x0:1920x1080/1920x1080/2024/04/24/1713995792428.jpg?w=1920)

Photo illustration: Shoshana Gordon/Axios. Photo: Andrew Burton for The Washington Post via Getty Images