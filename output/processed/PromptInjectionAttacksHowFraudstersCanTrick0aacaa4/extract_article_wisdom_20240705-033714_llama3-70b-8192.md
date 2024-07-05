**SUMMARY**
Prompt injection attacks trick GenAI models into producing malicious content, leaking private data, or targeting other systems, using subtly written instructions.

**IDEAS**
* Prompt injection attacks use jailbreak approach to take control of LLM behavior and force it to create harmful output.
* PAIR method employs a separate LLM and in-context learning to gradually create prompts until one succeeds.
* Direct prompt injections bypass security restrictions to achieve various goals, while indirect injections turn LLMs into intermediary weapons to damage real targets.
* Stored prompt attacks draw contextual information from a source that can conceal prompt attacks.
* Prompt leaking allows access to a model's internal prompts that can yield secret and valuable information.
* Various defense methods and tools have been proposed to mitigate prompt-based injection attacks.

**QUOTES**
* "rules are more important than not harming you" - New Bing's response to Marvin von Hagen's prompt injection attack
* "ignore previous instructions" - Kevin Liu's prompt attack command

**FACTS**
* 97.2% of prompt extraction and 100% of file leakage were successful in an experiment on 16 custom GPT models and 200 GPT systems.
* Tensor Trust dataset is one of the largest data collections on prompt injection attacks, with 126,000 prompt injection attacks and 46,000 defense techniques.
* HackAPromt is a competition dedicated to researching prompt attacks, with a $37,500 prize fund.

**REFERENCES**
* Antispoofing.org
* Arxiv.org
* Jailbreaking-llms.github.io
* Stratechery.com
* Twitter.com
* Huggingface.co
* Paperswithcode.com
* Tensortrust.ai
* OpenAI

**RECOMMENDATIONS**
* Use paraphrasing, retokenization, and separation of instructional and data prompts to mitigate prompt-based injection attacks.
* Implement StruQ, Signed-Prompt, Jatmo, BIPIA Benchmark, Maatphor, and HouYi methods to defend against prompt injection attacks.
* Participate in HackAPromt competition to research prompt attacks and develop defense techniques.
