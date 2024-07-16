## Utilização de Modelos de Linguagem de Grande Escala em Ataques de Spear Phishing

### Contexto e Análise

Os modelos de linguagem de grande escala (LLMs), como o GPT-3.5 e GPT-4 da OpenAI, têm demonstrado uma capacidade notável para gerar textos realistas e contextualmente apropriados. Esta habilidade, embora benéfica em muitos contextos, apresenta riscos significativos quando utilizada para fins maliciosos, como ataques de spear phishing. Estes ataques envolvem a manipulação de alvos específicos para que revelem informações sensíveis, utilizando emails que imitam comunicações legítimas.

### Detalhes do Incidente

Em 14 de dezembro de 2023, foi reportado um ataque de spear phishing direcionado a membros do Parlamento Britânico. Este ataque explorou as capacidades dos LLMs para criar emails altamente convincentes a um custo mínimo. A ausência de especificações sobre os atacantes e as vulnerabilidades exatas exploradas sublinha a natureza insidiosa e difícil de rastrear destes ataques.

### Impacto e Causas

A utilização de LLMs para gerar emails de spear phishing pode resultar em perdas financeiras significativas e na exposição de informações sensíveis. A capacidade dos LLMs de produzir conteúdo personalizado e convincente aumenta a probabilidade de sucesso destes ataques. A causa raiz deste problema reside no uso indevido das capacidades avançadas dos LLMs, que foram originalmente desenvolvidas para fins benignos.

### Análise MITRE ATT&CK

Os ataques de spear phishing podem ser categorizados sob as técnicas T1566 (Phishing) e T1071.001 (Application Layer Protocol: Web Protocols) do framework MITRE ATT&CK. Estas técnicas destacam a utilização de protocolos web para conduzir ataques de phishing, aproveitando a confiança dos utilizadores em comunicações aparentemente legítimas.

### Recomendações e Medidas de Remediação

Para mitigar os riscos associados ao uso malicioso dos LLMs, é essencial implementar salvaguardas robustas e esquemas de acesso estruturados. As recomendações incluem:

1. **Controlo Rigoroso de Acesso:** Desenvolver e aplicar controlos de acesso estritos para o uso de LLMs, garantindo que apenas utilizadores autorizados possam aceder a estas ferramentas.
2. **Monitorização Contínua:** Implementar sistemas de monitorização contínua e deteção de anomalias para identificar atividades suspeitas.
3. **Formação Regular:** Conduzir sessões regulares de formação para o pessoal, focando-se no reconhecimento e resposta a tentativas de phishing.
4. **Atualização de Protocolos de Segurança:** Revisar e atualizar os protocolos de segurança para incluir ameaças específicas relacionadas com IA.

### Lições Aprendidas

A natureza dual dos LLMs, capazes tanto de usos benéficos quanto maliciosos, sublinha a necessidade de medidas proativas para prevenir o seu uso indevido em ciberataques. A conscientização sobre os riscos e a implementação de salvaguardas adequadas são cruciais para proteger contra estas ameaças emergentes.

### Tecnologias Utilizadas

Os modelos GPT-3.5 e GPT-4 da OpenAI, juntamente com técnicas avançadas de engenharia de prompts, foram utilizados para demonstrar a eficácia dos LLMs em gerar emails de spear phishing realistas. Estas tecnologias baseiam-se na arquitetura Transformer, que utiliza mecanismos de atenção para compreender as relações entre palavras em grandes conjuntos de dados.

### Impacto Societal

#### Impactos Positivos

- **Conscientização:** Aumenta a conscientização sobre o potencial uso indevido dos LLMs em cibercrime.
- **Desenvolvimento de Medidas:** Incentiva o desenvolvimento de melhores medidas de cibersegurança.

#### Impactos Negativos

- **Escalabilidade dos Ataques:** Demonstra um novo método escalável para cibercriminosos explorarem.
- **Aumento dos Ataques:** Potencial aumento no sucesso dos ataques de spear phishing.

### Considerações Éticas

A severidade do uso indevido dos LLMs é alta, levantando preocupações éticas sobre a acessibilidade pública destas ferramentas poderosas e os riscos associados à superação das salvaguardas embutidas.

### Sustentabilidade

#### Ambiental

Os recursos computacionais elevados necessários para treinar e operar LLMs têm um impacto ambiental significativo.

#### Económico

Embora seja rentável para os cibercriminosos, o custo potencial para as vítimas e infraestruturas de cibersegurança é elevado.

#### Social

O aumento do risco de violações de dados e a perda de confiança nas comunicações digitais são preocupações sociais importantes.

### Conclusão

Os modelos de linguagem de grande escala apresentam riscos significativos quando utilizados para spear phishing, destacando a necessidade urgente de intervenções robustas para prevenir o seu uso indevido. A conscientização sobre estas ameaças e a implementação de medidas proativas são essenciais para mitigar os riscos associados.

### Referências

- OpenAI’s GPT-3.5 and GPT-4 models
- SNAP_R
- Darktrace whitepaper (April 2023)
- ChatGPT
- Anthropic’s Claude model
