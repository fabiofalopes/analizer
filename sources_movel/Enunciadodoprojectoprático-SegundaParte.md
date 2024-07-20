# Computação Móvel - 2023
## App Estacionamentos, Segunda Parte V1.0

# App Estacionamentos

## Enunciado do projeto prático - Segunda Parte

### Notas Prévias

Nesta segunda parte do projeto, vamos continuar a desenvolver a aplicação que iniciamos na primeira parte para dar resposta a novos requisitos. Devem, portanto, continuar a trabalhar no repositório que criaram para a parte 1 (i.e., não devem criar um novo repositório para a parte 2).

Não é permitida a mudança de grupo ou formação de novos grupos na parte 2. Caso um dos elementos do grupo tenha desistido, o elemento restante deverá implementar sozinho a parte 2.

Em circunstâncias excepcionais devidamente justificadas, podem ser divididos os grupos da parte 1. Nesse caso, cada um dos elementos do grupo deverá implementar a parte 2 sozinho.

Os grupos que não tenham entregue ou não tenham atingido a nota mínima de 8 valores na parte 1 do projeto, não poderão entregar a parte 2 - terão que entregar o projeto em época de recurso. No entanto, podem e devem ir desenvolvendo a parte 2 durante o período de avaliação contínua pois poderão não ter tempo para o fazer durante a época de recurso.

### Objectivo

Este projeto tem como objetivo o desenvolvimento de uma aplicação móvel multi-plataforma (Android e iOS) usando **Flutter**.

O projeto está dividido em 2 partes:

- Primeira Parte - apresentada no presente enunciado, incide na implementação da interface gráfica e navegação;
- Segunda Parte - onde deverão "ligar" a aplicação à API da Emel, guardar dados de forma persistente e tirar partido da geolocalização.

As 2 partes são de entrega obrigatória e terão prazos de entrega distintos. O não cumprimento dos prazos de entrega de qualquer uma das partes do projeto levará automaticamente à reprovação dos alunos na avaliação de primeira época da componente prática.

### Objectivos - Segunda Parte

Enquanto que na entrega anterior houve uma maior preocupação com o design dos ecrãs e usabilidade, nesta fase o foco passará a estar noutros temas como o acesso a web services usando a API da Emel (link e access token indicados no enunciado da parte 1), a persistência dos dados e a geolocalização. Os alunos são igualmente convidados a criar testes unitários e de integração, para garantir a qualidade da solução apresentada.

### Restrições Técnicas - Segunda Parte

Mantêm-se as restrições técnicas da primeira parte, às quais se acrescentam:

- Devem obrigatoriamente usar "injeção de dependências" através da biblioteca Provider, conforme explicado nos vídeos disponibilizados no Moodle.
- Caso decidam implementar persistência local dos dados, deverão usar a biblioteca Sqflite.

A não utilização de injeção de dependências ou a utilização de outras bibliotecas para estes 2 cenários implicam não ter as respetivas funcionalidades.

### Descrição do Projeto

O projeto encontra-se descrito em vídeo:

[Descrição do Projeto](https://www.youtube.com/watch?v=6wyb0fmpLF)

Podem ser identificados erros/omissões no vídeo. Devem estar atentos à errata que está publicada no primeiro comentário do vídeo.

Caso tenham dúvidas sobre o conteúdo do vídeo, devem colocá-las sob a forma de comentários no YouTube, indicando o timestamp do vídeo ao qual diz respeito a pergunta.

### Criatividade

Mantêm-se as recomendações dadas na parte 1.

Para os alunos que foram anotados com "Recomenda-se melhorar o dashboard", sugerimos que o façam na parte 2 (de outra forma, poderão ter uma forte penalização neste item na parte 2). Devem ter atenção se os dados que estão a usar estão disponíveis na API da EMEL e caso necessário podem refazê-lo por completo.

### Vídeo

Os grupos deverão entregar, além do repositório e do APK, um vídeo que demonstre o funcionamento da aplicação.

- O vídeo deve mostrar quais as funcionalidades que foram implementadas e de que forma. A aplicação usada no vídeo deve ser a mesma que estará no APK entregue via Moodle.
- O vídeo deve ser narrado (de preferência por ambos os elementos do grupo), explicando não só os ecrãs que vão sendo apresentados como as opções que tomaram, devidamente justificadas. Ou seja, além de responderem à questão “o que”, devem também responder “porquê”.
- O vídeo deve apresentar todas as funcionalidades implementadas. Funcionalidades não apresentadas serão consideradas não implementadas e terão cotação zero.
- O dashboard deve ser particularmente bem explicado.
- O vídeo não pode exceder 4 minutos de duração.
- O vídeo deve ser carregado para o YouTube e configurado como “unlisted” de forma a não aparecer nos resultados de pesquisa. O título do vídeo deve incluir o número dos alunos (ex: “comp-movel-grupo-21xx&21xxx”).
- O URL do vídeo deve estar no ficheiro README.md.
- Os alunos que não entregarem o vídeo (porque não gravaram ou porque se esqueceram de colocar o URL) terão uma penalização de 5 valores.

## Interação com ChatGPT - Requisito Bónus

Tal como já tem vindo a ser referido nas aulas, a utilização do ChatGPT como auxiliar de programação não só não é proibida como é até incentivada. Notem a utilização do termo “auxiliar de programação” e não “substituto de programação”. Acreditamos que, na vossa vida profissional, será valorizado o facto de saberem usar o ChatGPT (e outras ferramentas semelhantes que entre tantos surgirão) pois aumentará a vossa produtividade e faz-vos concentrar na parte criativa do processo de programação. No entanto, devem sempre exercitar o vosso espírito crítico na interação com o mesmo. Usem-no para obter várias soluções alternativas para os problemas mas a decisão final caberá a vocês e a responsabilidade também será vossa. Nesse sentido, decidimos acrescentar um pequeno exercício opcional, mas que se o realizarem poderão ganhar 0,5 valores adicionais na nota final do projeto.

Alguns requisitos do projeto implicam utilizar bibliotecas/técnicas de programação não explicadas nos vídeos fornecidos como material de apoio.

O que pretendemos é que recorram ao ChatGPT para pedir ajuda para implementar um desses requisitos, mas usando uma metodologia de prompting em que pedem várias soluções alternativas e depois decidem (ou não) por uma delas.

Fica aqui um exemplo dessa metodologia:

```plaintext
Humano: implementa uma função em Java para determinar o maior número num array de inteiros.
--------------------------
ChatGPT: Claro! Aqui está uma possível implementação em Java para encontrar o maior número em um array de inteiros:

```java
public static int encontraMaior(int[] numeros) {
    int maior = numeros[0]; // começa com o primeiro número do array
    for(int i = 1; i < numeros.length; i++) {
        if (numeros[i] > maior) {
            maior = numeros[i]; // atualiza o maior número
        }
    }
    return maior;
}
```

Esta função recebe um array de inteiros numeros e retorna o maior número encontrado. A função começa definindo o primeiro número do array como o maior. Em seguida, percorre o restante do array, (...)
--------------------------
Humano: Implementa uma versão alternativa dessa função que não inicialize a variável "maior" com o primeiro número do array.
--------------------------
ChatGPT: Claro! Aqui está uma possível implementação alternativa em Java para encontrar o maior número em um array de inteiros sem inicializar a variável maior com o primeiro número do array:

```java
public static int encontraMaior(int[] numeros) {
    int maior = Integer.MIN_VALUE; // começa com o menor valor possível para um inteiro
    for (int i = 0; i < numeros.length; i++) {
        if (numeros[i] > maior) {
            maior = numeros[i]; // atualiza o maior número
        }
    }
    return maior;
}
```

Esta função começa definindo a variável maior como o menor valor possível para um inteiro usando a constante Integer.MIN_VALUE. Em seguida, percorre o array, (...)
--------------------------
CONCLUSÃO DO GRUPO: Escolhemos a primeira opção pois evita uma comparação extra no início do ciclo (o ciclo pode começar na posição 1 em vez da posição 0).

Para terem 0,5 valores de bónus, deverão registar num ficheiro chatgpt.txt, localizado na raiz do projeto (ao lado do README.md), a interação que tiveram com o ChatGPT (pedindo 2 ou mais alternativas) assim como uma análise crítica das soluções fornecidas pelo ChatGPT (no exemplo acima, corresponde à CONCLUSÃO DO GRUPO).

## Entrega

### O que entregar

Nesta segunda parte do projeto, os alunos têm de entregar:

- Projeto Flutter sem erros de compilação ou execução.
- README.md na raiz do projeto. Nesse documento deverá constar:
  - Os dados dos alunos que constituem o grupo, nome e número;
  - Screenshots dos ecrãs;
  - Identificar as funcionalidades (podem utilizar a grelha de avaliação como auxílio) que conseguiram implementar - da parte 1 e parte 2;
  - A previsão da nota por parte do aluno (autoavaliação) - da parte 1 e parte 2;
  - Descrição textual da arquitetura da aplicação, com destaque para as boas práticas que utilizaram na mesma (isto pode influenciar a nota do item “Arquitetura da aplicação”).
  - Link para o vídeo de apresentação do trabalho, publicado no YouTube como unlisted.
  - Indicar e descrever (nome da classe, métodos e atributos) das classes de lógica de negócio. Ex: Classe Pessoa:
    - Atributos:
      - nome - String
      - dataDeNascimento - Date
    - Métodos:
      - bool eMaiorDeIdade()

- Fontes de informação (blogs, youtube, stackoverflow, ChatGPT, entre outros) sobre pedaços de código utilizados que não foram abordados nas aulas nem nos vídeos fornecidos.
- Ficheiro chatgpt.txt (opcional) - ver secção “Interação com ChatGPT”.

Caso o README não apresente todas as informações pedidas, poderá ser aplicada uma penalização de até 5 valores.

### Como entregar - Moodle

Tal como na parte 1, os alunos terão de entregar via Moodle um APK da aplicação. As regras e respectivas penalizações são as mesmas da parte 1.

Notem que o APK entregue deve ser o release e não o debug. Mais informações aqui: [Como criar um APK para aplicações Flutter](https://melanee-melanee.medium.com/how-can-i-build-an-apk-for-my-flutter-app-and-prepare-it-to-release-9c3fc81885f).

### Como entregar - Repositório git (github)

Mantêm-se as regras da parte 1.

## Regras dos Commits - Parte 2

Nesta segunda parte do projeto, deverão ser feitos (pelo menos) **quatro (4)** **_commits_** **não triviais** (que tenham impacto na funcionalidade do programa), por cada aluno do grupo. Os alunos que não cumpram esta regra **serão penalizados em 3 valores** na nota final desta parte do projeto.

## Prazo de entrega

A entrega deverá ser feita através de um _commit_ no repositório git criado pelo GitHub Classroom.

Para efeitos de avaliação do projeto, será considerado o último _commit_ feito no repositório.

A data limite para fazer o último _commit_ e para entregar o APK no Moodle é dia **10 de Junho (Segunda-feira)**, **até às 23h59** (hora de Lisboa, Portugal). Recomenda-se que os alunos verifiquem que o _commit_ foi enviado (_pushed_), usando a interface _web_ do GitHub. Não serão considerados _commits_ feitos após essa data e hora.

Não serão consideradas entregas fora de prazo nem serão efetuadas extensões de prazo para as entregas, sem exceção. Os alunos que não entreguem o projeto (código no GitHub ou APK no Moodle) terão nota 0 no que diz respeito a esta avaliação e por consequência reprovam em época normal (componente prática).

## Avaliação

A avaliação do projeto será dividida pelas 2 partes:

- Existirá uma nota em cada parte do projeto.
- Nesta segunda parte aplica-se a nota mínima de oito (8) valores.
  - Quem não alcançar essa nota mínima ficará excluído da avaliação prática de primeira época.

Após a entrega final, será atribuída ao projeto uma nota final quantitativa, que será calculada considerando a seguinte fórmula:

```
Nota Final = 0.3 * Nota Parte 1 + 0.7 * Nota Parte 2
```

Na nota final existe a nota mínima de 9,5 valores.

Segue-se uma tabela com os critérios e cotação que serão levados em consideração na avaliação do projeto. A cotação de cada critério de avaliação é distribuída (não uniformemente) por três partes, tal como já acontecia na parte 1:

- Cumprimento dos requisitos
- Design e usabilidade
- Qualidade da implementação

### Descrição Cotação

| Critério | Cotação |
|----------|---------|
| Arquitetura da aplicação (separação UI - Lógica de negócio, injeção de dependências, boas práticas) | 1 |
| Dashboard | 3 |
| Apresentação dos parques - Lista (API Emel) [obrigatório] | 2 |
| Apresentação dos parques - Mapa | 0 |
| - Apresentação do google maps [obrigatório] | 1 |
| - Markers como parques (API Emel) [obrigatório] | 1 |
| Detalhe do parque | 1 |
| - Dados do parque (API Emel) [obrigatório] | 1 |
| - Apresentar incidentes vindos da BD [obrigatório] | 1 |
| Registo de incidentes | 1 |
| - Formulário regista na BD [obrigatório] | 1 |
| Geolocalização (uso apropriado nos vários ecrãs) | 1 |
| Funcionamento Offline (funcionalidade avançada) | 2 |
| Testes unitários/integração | 1 |
| Vídeo [obrigatório] | 1 |
| Ficheiro chatgpt.txt (ver secção Requisito Bónus - Interação com chatgpt) | 0 |
| **Total** | **20** valores |

## Defesa do projeto

Para garantir que os alunos que vão à defesa do projeto têm um conjunto mínimo de funcionalidades implementada para que o projeto possa ser defendido com sucesso, alguns requisitos são de implementação **obrigatória**. Esses requisitos estão indicados na tabela da secção anterior.

- Os alunos que entreguem projetos que não cumpram todos os requisitos obrigatórios serão reprovados em primeira época.

As defesas realizar-se-ão nos dias 12 a 14 de Junho, de forma presencial. O dia/hora exato será anunciado mais próximo da data. A presença na defesa é obrigatória para todos os alunos - quem não comparecer terá zero na nota final do projeto.

Durante esta defesa individual, será pedido ao aluno que faça alterações ao código para dar resposta a alterações aos requisitos. Da discussão presencial de cada aluno resultará uma nota de 0 a 100%, que será aplicada à nota do projeto.

**Nota:** Por restrições temporais, não haverá tempo para os professores confirmarem que os projetos cumprem realmente os requisitos obrigatórios antes da data da defesa. Os professores irão usar a informação que colocarem no README e confiar que está correta. Caso posteriormente se venha a detectar que alguma funcionalidade obrigatória não ficou corretamente implementada, a defesa ficará sem efeito e o grupo respectivo terá nota zero.

## Cópias

Mantêm-se as regras indicadas na parte 1.

## Outras informações relevantes

Mantêm-se as informações indicadas na parte 1.

#### FIM
