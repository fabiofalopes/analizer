# Computação Móvel - 2023
## App Estacionamentos, Primeira Parte V1.0

---

## Enunciado do Projeto Prático - Primeira Parte

### Objetivo
Este projeto tem como objetivo o desenvolvimento de uma aplicação móvel multi-plataforma (Android e iOS) usando **Flutter**.

O projeto está dividido em 2 partes:

- **Primeira Parte**: apresentada no presente enunciado, incide na implementação da interface gráfica e navegação.
- **Segunda Parte**: onde deverão “ligar” a aplicação à API da Emel, guardar dados de forma persistente e tirar partido da geo-localização.

As 2 partes são de entrega obrigatória e terão prazos de entrega distintos. O não cumprimento dos prazos de entrega de qualquer uma das partes do projeto levará automaticamente à reprovação dos alunos na avaliação de primeira época da componente prática.

### Tema
Como todos sabemos, a mobilidade é um tema bastante discutido nas grandes cidades. Embora a cidade de Lisboa tenha melhorado consideravelmente neste aspecto através do aluguer de bicicletas, trotinetas, entre outras, ainda existem pessoas que preferem utilizar o carro para se deslocarem dentro da cidade. No entanto, esta opção acarreta um problema frequentemente discutido: o estacionamento. De forma a mitigar esta situação, a aplicação tem como objetivo auxiliar os condutores na procura de estacionamentos disponíveis pela EMEL.

**O nome da aplicação e o esquema de cores ficará completamente a cargo da criatividade dos alunos.**

### Objetivos - Primeira Parte
Para esta entrega deverão apenas desenvolver os ecrãs da aplicação assim como o modelo de navegação, sem esquecer as melhores práticas de UI/UX abordadas nas aulas teóricas.

Todos os ecrãs deverão estar funcionais ainda que com dados fictícios à escolha dos alunos, sugerindo-se algum realismo tendo em consideração o objetivo da aplicação. Deverão organizar o projeto seguindo as boas práticas ensinadas nas aulas. Em particular, os dados (ainda que fictícios) da lógica de negócio (Model) devem estar em classes próprias e independentes da View. Poderão utilizar como base de conhecimento a documentação da API, sendo que apenas na próxima parte do projeto é que irão consumi-la. A comunicação com esta API obriga ao uso da chave abaixo em todos os pedidos.

**Chave da API:** 93600bb4e7fee17750ae478c22182dda

Desta forma, os ecrãs ou funcionalidades que não tenham um comportamento real face ao que se pretende da aplicação não serão avaliados. Da mesma forma que, todos os ecrãs ou funcionalidades que necessitem de dados não façam uso da fonte de dados anteriormente descrita, terão um desconto associado.

---

## Restrições Técnicas - Primeira Parte
Deverão usar Flutter v3.16 ou superior. Tirando isso, não existem restrições técnicas. Deverão implementar um sistema de navegação que permita chegar a todos os ecrãs que darão acesso às funcionalidades solicitadas. Podem usar o que quiserem, side drawer, bottom bar, etc. Fica a critério dos alunos decidirem qual querer usar.

Os ecrãs ou funcionalidades que não estejam acessíveis através desse modelo de navegação serão classificadas como nota 0.

### Descrição do Projeto
O projeto encontra-se descrito em vídeo:

[Link do Vídeo](https://www.youtube.com/watch?v=_p9iWJ8npM)

Poderão ser identificados erros/omissões no vídeo. Devem estar atentos à errata que está publicada no primeiro comentário do vídeo.

Caso tenham dúvidas sobre o conteúdo do vídeo, devem colocá-las sob a forma de comentários no YouTube, indicando o timestamp do vídeo ao qual diz respeito a pergunta.

### Criatividade
Ainda que todos os trabalhos tenham que implementar as funcionalidades básicas da aplicação explicadas no vídeo, a forma como as implementam pode variar muito. Os ecrãs apresentados no vídeo são meramente exemplificativos, pois na navegação podem e devem ser completamente refeitos pelos alunos.

O caso do dashboard é especial, pois os alunos são convidados a pensar neste ecrã de forma criativa, não só na forma, mas também no conteúdo, que deve ser relevante e tirar partido das características da computação móvel.

---

## Formação dos Grupos
Os projetos devem ser realizados em grupos de 2 alunos. Em situações excepcionais poderão ser aceites grupos de um aluno - quem o pretender fazer deve efetuar um pedido (justificado) aos docentes da cadeira através de e-mail. **Alunos que entreguem individualmente sem terem um pedido aceite por um professor terão nota zero.**

**Os elementos do grupo devem pertencer à mesma turma prática.** Isto facilita o acompanhamento do projeto por parte do professor respetivo.

Os elementos do grupo devem ter um nível de conhecimento mais ou menos equivalente. Os grupos de alunos definidos para a primeira parte do projeto devem ser mantidos para a segunda parte do projeto. Não serão permitidas entradas de novos alunos nos grupos entre as duas partes do projeto.

---

## Entrega

### O que entregar
Nesta primeira parte do projeto, os alunos têm de entregar:

- Projeto flutter sem erros de compilação ou execução.
- README.md na raiz do projeto. Nesse documento deverá constar:
  - Os dados dos alunos que constituem o grupo, nome e número;
  - Screenshots dos ecrãs;
  - Identificar as funcionalidades (podem utilizar a grelha de avaliação como auxílio) que conseguiram implementar;
  - A previsão da nota por parte do aluno (autoavaliação).

O projeto deve estar num repositório no GitHub, partilhado com o professor das práticas. Deve igualmente ser entregue um APK da aplicação, através do Moodle.

---

### Como entregar - Moodle
Os alunos terão de entregar via Moodle um APK da aplicação. O nome do ficheiro deverá seguir a seguinte nomenclatura: **numero_de_aluno1-numero_de_aluno2.apk**. Exemplo: **21234567-21765432.apk**. Os alunos que não sigam esta nomenclatura serão penalizados na nota do projeto em 1 valor.

Caso o ficheiro APK esteja corrompido ou não seja instalável, a entrega será considerada inválida, pelo que o aluno terá nota 0 na entrega. Deve, por isso, testar a instalação dos APKs antes da sua entrega.

### Como entregar - Repositório git (github)
A entrega deste projeto deverá ser feita usando um repositório git. Não serão aceites outras formas de entrega do projeto.

O repositório deve ser criado através deste link do GitHub Classroom e deverá seguir a nomenclatura **número_do_aluno_1-número_do_aluno_2**. Exemplo: **21234567-21765432**. Os alunos que não sigam esta nomenclatura serão penalizados na nota do projeto em 1 valor.

Os vários alunos do grupo devem estar associados ao repositório GitHub do grupo e devem usar o mesmo para trabalharem de forma colaborativa.

### Regras dos Commits - Parte 1
Nesta primeira parte do projeto, deverão ser feitos (pelo menos) **dois (2)** **_commits_** **não triviais** (que tenham impacto na funcionalidade do programa), por cada aluno do grupo. Os alunos que não cumpram esta regra **serão penalizados em 3 valores** na nota final desta parte do projeto.

---

## Prazo de Entrega
A entrega deverá ser feita através de um _commit_ no repositório git previamente criado e partilhado com o Professor. Recomenda-se que o repositório git seja criado (e partilhado) o mais rápido possível, de forma a evitar que surjam problemas de configuração no envio.

Para efeitos de avaliação do projeto, será considerado o último _commit_ feito no repositório.

A data limite para fazer o último _commit_ e para entregar o APK no Moodle é o dia **14 de Abril (Domingo)**, **até às 23h59** (hora de Lisboa, Portugal). Recomenda-se que os alunos verifiquem que o _commit_ foi enviado (_pushed_), usando a interface _web_ do GitHub. Não serão considerados _commits_ feitos após essa data e hora.

Não serão consideradas entregas fora de prazo nem serão efetuadas extensões de prazo para as entregas em exceção. Os alunos que não entreguem o projeto (código no GitHub ou APK no Moodle) terão nota 0 no que diz respeito a esta avaliação e por consequência reprovam em época normal (componente prática).

---

## Avaliação
A avaliação do projeto será dividida pelas 2 partes:

- Existirá uma nota em cada parte do projeto.
- Nesta primeira parte aplica-se a nota mínima de oito (8) valores
  - Quem não alcançar essa nota mínima ficará excluído da avaliação prática de primeira época.
- Após a entrega final, será atribuída ao projeto uma nota final quantitativa, que será calculada considerando a seguinte fórmula:
  
  - **Nota Final = 0.3 * Nota Parte 1 + 0.7 * Nota Parte 2**
  
  - Na nota final existe a nota mínima de 9.5 valores.

Segue-se uma tabela com os critérios e cotações que serão levados em consideração na avaliação do projeto. A cotação de cada critério de avaliação é distribuída (não uniformemente) por três partes:

---

### Critérios de Avaliação

- **Cumprimento do requisito**: Verificar se a implementação responde corretamente face ao que foi pedido no enunciado. Exemplo: se o carregar no botão X é suposto que um determinado registo seja eliminado. Se isso não acontecer o requisito não está a ser cumprido.
  
- **Design e usabilidade**: Verificar se a implementação vai ao encontro das boas práticas UI/UX. Por exemplo: [Material Components](https://material.io/components/text-fields) e ter cuidados na adaptação da aplicação a ecrãs de múltiplas dimensões.

- **Qualidade da implementação**: Verificar se a implementação tem qualidade. Por exemplo, se a construção dos widgets foi extraída para métodos ou para widgets próprios.

### Descrição Cotação
- Dashboard: 5
- Apresentação dos parques - Lista: 2
- Apresentação dos parques - Mapa (imagem): 1
- Detalhe do parque: 2
- Detalhe do parque (apresentar incidentes): 2
- Registo de incidentes: 2
- Registo de incidentes (validação do formulário): 2
- Navegação: 1
- Arquitetura da aplicação (separação UI-Lógica de negócio): 3

**Total: 20 valores**

---

## Cópias
Trabalhos que sejam identificados como cópias serão anulados e os alunos que os submeterem terão nota zero (0).

Uma cópia numa das entregas intermédias afastará os alunos (pelo menos) da restante avaliação de primeira época, podendo inclusivamente ter efeitos nas restantes épocas.

**Notem que, em caso de cópia, serão penalizados quer os alunos que copiarem, quer os alunos que deixarem copiar.**

Neste sentido, recomendamos que não partilhem o código do vosso projeto (total ou parcialmente). Se querem ajudar colegas em dificuldade, expliquem-lhes o que têm que fazer, não lhes forneçam o vosso código, pois assim eles não estão a aprender!

A decisão sobre se um trabalho é uma cópia cabe exclusivamente aos docentes da unidade curricular.

---

## Outras Informações Relevantes
- Recomenda-se que eventuais dúvidas sobre o enunciado sejam esclarecidas (o mais depressa possível) no **Discord** de CM2023.
- Existirá uma defesa presencial e individual do projeto. A defesa será feita após a segunda entrega. Durante esta defesa individual, será pedido ao aluno que faça alterações ao código do projeto, de forma a dar resposta a alterações aos requisitos.
- É possível que sejam feitas pequenas alterações a este enunciado, durante o tempo de desenvolvimento do projeto. Por esta razão, os alunos devem estar atentos ao **Moodle de CM**.
- Qualquer situação omissa será resolvida pelos docentes da cadeira.

---

**FIM**