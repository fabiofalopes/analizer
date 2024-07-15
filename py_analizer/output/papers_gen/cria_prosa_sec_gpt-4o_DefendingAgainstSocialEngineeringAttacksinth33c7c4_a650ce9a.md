A proliferação de Modelos de Linguagem de Grande Escala (LLMs) apresenta desafios significativos na deteção e mitigação de enganos digitais, uma vez que estes modelos podem emular padrões conversacionais humanos e facilitar ataques de engenharia social baseados em chat (CSE). Este estudo investiga as capacidades duais dos LLMs como facilitadores e defensores contra ameaças CSE. Desenvolvemos um novo conjunto de dados, SEConvo, que simula cenários CSE em contextos académicos e de recrutamento, projetado para examinar como os LLMs podem ser explorados nessas situações. As nossas descobertas revelam que, embora os LLMs disponíveis no mercado gerem conteúdo CSE de alta qualidade, as suas capacidades de deteção são subótimas, levando a custos operacionais aumentados para a defesa. Em resposta, propomos o ConvoSentinel, um pipeline de defesa modular que melhora a deteção tanto ao nível da mensagem quanto da conversa, oferecendo maior adaptabilidade e rentabilidade. O módulo de recuperação aumentada no ConvoSentinel identifica intenções maliciosas comparando mensagens com uma base de dados de conversas semelhantes, melhorando a deteção CSE em todas as etapas. O nosso estudo destaca a necessidade de estratégias avançadas para aproveitar os LLMs na cibersegurança.

A rápida evolução dos LLMs trouxe uma era de geração de diálogos semelhantes aos humanos, colocando desafios significativos na deteção e mitigação de enganos digitais. Os LLMs, com a sua capacidade de emular padrões conversacionais humanos, podem ser explorados para fins nefastos, como facilitar ataques CSE baseados em chat. Estas ameaças CSE transcendem os tradicionais emails de phishing e websites, impactando indivíduos e empresas, necessitando de avanços urgentes na cibersegurança. A investigação existente desenvolveu frameworks para entender ataques CSE humano-a-humano e explorou várias técnicas de machine learning e deep learning para detetar e prevenir essas ameaças. Estudos recentes utilizam LLMs para simular outros tipos de ciberataques sofisticados e desenvolver defesas contra eles. No entanto, o uso indevido dos LLMs para gerar e perpetuar ataques CSE permanece amplamente inexplorado, deixando-nos despreparados para enfrentar este risco emergente.

Para preencher esta lacuna, exploramos o papel dual dos LLMs como facilitadores e defensores contra ataques CSE, colocando duas principais questões de investigação: 1) Podem os LLMs ser manipulados para conduzir tentativas CSE? Preparamos o conjunto de dados SEConvo, composto por 1.400 conversas geradas usando GPT-4, para demonstrar LLMs iniciando ataques CSE em cenários do mundo real, como um atacante posando como colaborador académico, recrutador ou jornalista. 2) São os LLMs detectores eficazes de CSE iniciados por LLMs? Avaliamos o desempenho de LLMs representativos, como GPT-4 e Llama2, na deteção de CSE em configurações zero-shot e few-shot.

Os nossos experimentos iniciais indicam que a capacidade dos LLMs de detetar e mitigar tentativas CSE iniciadas por LLMs é limitada e fortemente dependente do número de exemplos few-shot, levando a um overhead operacional significativo para maior precisão. Para resolver isso, introduzimos o ConvoSentinel, um pipeline modular projetado para melhorar a deteção CSE tanto ao nível da mensagem quanto da conversa, oferecendo melhor adaptabilidade e rentabilidade. A nossa abordagem analisa sistematicamente conversas, sinaliza mensagens maliciosas e consolida essas descobertas para avaliar tentativas SE ao nível da conversa. O ConvoSentinel integra um módulo de Geração Aumentada por Recuperação (RAG) que discerne intenções maliciosas comparando mensagens com uma base de dados de interações CSE conhecidas, mantendo custos operacionais mais baixos do que os detectores few-shot LLM e melhorando o desempenho em todas as etapas da conversa.

Para resumir, as nossas contribuições são as seguintes: Introduzimos o SEConvo, um novo conjunto de dados para CSE com simulação single-LLM e interações agente-a-agente simulando ataques e defesas SE em cenários realistas. Apresentamos o ConvoSentinel, um pipeline modular para combater CSE multi-turn. Este pipeline disseca sistematicamente diálogos CSE multi-turn, sinaliza mensagens maliciosas e integra descobertas para detetar tentativas SE ao longo de conversas inteiras. Até onde sabemos, esta é a primeira exploração de ataques CSE iniciados por LLMs e suas contramedidas.

A nossa investigação destaca a necessidade urgente de estratégias avançadas para aproveitar os LLMs na cibersegurança. Embora os LLMs disponíveis no mercado gerem conteúdo CSE de alta qualidade, as suas capacidades de deteção são subótimas, levando a custos operacionais aumentados para a defesa. Em resposta, propomos o ConvoSentinel, um pipeline modular que melhora a deteção tanto ao nível da mensagem quanto da conversa, oferecendo maior adaptabilidade e rentabilidade. O módulo RAG no ConvoSentinel identifica intenções maliciosas comparando mensagens com uma base de dados de conversas semelhantes, melhorando a deteção CSE em todas as etapas.

O nosso estudo sublinha a necessidade de estratégias avançadas para aproveitar os LLMs na cibersegurança. A introdução do SEConvo e do ConvoSentinel representa um passo significativo na defesa contra ataques CSE iniciados por LLMs. No entanto, há limitações que devem ser reconhecidas. O nosso conjunto de dados SEConvo foca-se especificamente em cenários simulados dentro dos contextos de colaboração académica, financiamento académico, jornalismo e recrutamento. Embora esses domínios sejam particularmente vulneráveis a ataques CSE, a generalização das nossas descobertas para outros contextos pode ser limitada. Além disso, o uso dos LLMs para emular conversas entre vítimas e atacantes em cenários CSE pode apresentar problemas como alucinação e bajulação.

Apesar dessas limitações, o nosso estudo fornece uma base sólida para entender e abordar os desafios colocados pelas capacidades duais dos LLMs em contextos CSE. A nossa investigação futura pode explorar configurações híbridas onde o atacante é um agente LLM e o alvo é humano, investigando a deteção de texto AI seguida pelo ConvoSentinel. Outra extensão poderia ser identificar tentativas CSE mais encobertas, onde os atacantes imitam indivíduos conhecidos ou estabelecem confiança antes de recolher informações sensíveis.

Em conclusão, a nossa investigação sublinha a necessidade urgente de estratégias avançadas para aproveitar os LLMs na cibersegurança. A introdução do SEConvo e do ConvoSentinel representa um passo significativo na defesa contra ataques CSE iniciados por LLMs. No entanto, há limitações que devem ser reconhecidas. O nosso conjunto de dados SEConvo foca-se especificamente em cenários simulados dentro dos contextos de colaboração académica, financiamento académico, jornalismo e recrutamento. Embora esses domínios sejam particularmente vulneráveis a ataques CSE, a generalização das nossas descobertas para outros contextos pode ser limitada. Além disso, o uso dos LLMs para emular conversas entre vítimas e atacantes em cenários CSE pode apresentar problemas como alucinação e bajulação.

Apesar dessas limitações, o nosso estudo fornece uma base sólida para entender e abordar os desafios colocados pelas capacidades duais dos LLMs em contextos CSE. A nossa investigação futura pode explorar configurações híbridas onde o atacante é um agente LLM e o alvo é humano, investigando a deteção de texto AI seguida pelo ConvoSentinel. Outra extensão poderia ser identificar tentativas CSE mais encobertas, onde os atacantes imitam indivíduos conhecidos ou estabelecem confiança antes de recolher informações sensíveis.

A nossa pesquisa foi desenvolvida com financiamento da Defense Advanced Research Projects Agency (DARPA) sob os Contratos Nos. HR001120C0123, HR01120C0129 e 47QFLA22F0137. As opiniões expressas são as dos autores e não devem ser interpretadas como representando as opiniões ou políticas oficiais do Departamento de Defesa ou do Governo dos EUA.

Referências:
- Achiam et al., 2023
- Ahammad et al., 2022
- Alotaibi et al., 2020
- Asfour and Murillo, 2023
- Ayoobi et al., 2023
- Basit et al., 2021
- Bhattacharjee et al., 2024
- Chung et al., 2022
- Fang et al., 2024
- Gupta et al., 2016
- Happe and Cito, 2023
- Jang-Jaccard and Nepal, 2014
- Karadsheh et al., 2022
- Koide et al., 2024
- Lansley et al., 2020
- Le et al., 2018
- Mahajan and Siddavatam, 2018
- Manaswini and SRINIVASU, 2021
- Naito et al., 2023
- Pan et al., 2022
- Reimers and Gurevych, 2019
- Salloum et al., 2022
- Schmitt and Flechais, 2023
- Singh et al., 2024
- Sjouwerman, 2023
- Sun et al., 2018
- Tajaddodianfar et al., 2020
- Touvron et al., 2023
- Trad and Chehab, 2024
- Tsinganos et al., 2022
- Tsinganos et al., 2023
- Tsinganos et al., 2024
- Tsinganos and Mavridis, 2021
- Tsinganos et al., 2018
- Wang et al., 2023
- Wang et al., 2021
- Washo, 2021
- Xu et al., 2024
- Yeboah-Boateng and Amanor, 2014
- Yoo and Cho, 2022
- Zheng et al., 2019