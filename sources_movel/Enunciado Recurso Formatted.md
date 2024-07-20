# Computação Móvel - 2023

## App Estacionamentos, Recurso V1.0

# App Estacionamentos

## Enunciado do Projeto - Recurso

### Notas prévias
Nesta época de avaliação, vamos continuar a desenvolver a aplicação da avaliação contínua, onde serão adicionados alguns novos requisitos **obrigatórios** para aprovação. Devem, portanto, continuar a trabalhar no repositório da avaliação contínua.

Não é permitida a mudança de grupo ou formação de novos grupos. Caso um dos elementos do grupo tenha desistido ou aprovado, o elemento restante deverá implementar sozinho o projeto em recurso. "- Eu estou sozinho o meu colega desistiu infelizmente..."

Em circunstâncias excepcionais devidamente justificadas, podem ser divididos os grupos da avaliação contínua. Nesse caso, cada um dos elementos do grupo deverá implementar o projeto de recurso sozinho.

### Objectivos
Mantêm-se os mesmos objetivos da avaliação contínua.

### Restrições Técnicas
A aplicação deverá funcionar pelo menos na API 29 (**minSdkVersion** não pode ser maior que 29). De resto, mantêm-se as restrições técnicas da avaliação contínua.

### Descrição do Projeto

Para esta entrega, pretende-se alterar o ecrã do mapa da avaliação anterior (onde estavam representados os parques da EMEL) de forma que este possa apresentar os stands de bicicletas GIRA (que está disponível na mesma API utilizada na época de avaliação anterior).

- Deverá haver uma opção que permitirá apresentar no mapa markers apenas com os parques da EMEL e outro que apresente apenas os stands de bicicletas.
- Ao clicar num marker das bicicletas GIRA, deverá ser apresentado um novo ecrã com as seguintes informações:
  - Número de docas (num_docas);
  - Número de bicicletas (num_bicicletas);
  - Morada (desig_comercial);
  - Última atualização (update_date);
  - Lista de incidentes de estações GIRA (ponto seguinte).
- Deverá ser possível registar incidentes para uma estação GIRA, preenchendo os seguintes dados (todos obrigatórios):
  - Estação GIRA;
  - Descrição, no mínimo 20 caracteres;
  - Tipo de problema:
    - Bicicleta vandalizada;
    - Doca não libertou bicicleta;
    - Outra situação (esta categoria deve ser usada para os problemas que não se enquadrem nos 2 anteriores).

### Criatividade
Mantêm-se as recomendações da avaliação contínua.

### Vídeo
Mantêm-se as regras do enunciado da avaliação contínua.

**Nota**: Quem gravou um vídeo para época normal, deve gravar novo vídeo onde, além dos requisitos que já vinham de época normal, inclui a demonstração dos novos requisitos.

### Entrega

#### O que entregar
O README da avaliação de recurso deverá possuir as mesmas informações da avaliação contínua, mas para agora o recurso (ex: auto-avaliação, screenshots, link para o vídeo, etc).

Caso o README não apresente todas as informações pedidas, poderá ser aplicada uma penalização de até 5 valores.

#### Como entregar - Moodle
Tal como na avaliação anterior, os alunos terão de entregar via Moodle um APK da aplicação. As regras e respetivas penalizações da avaliação contínua.

Notem que o APK entregue deve ser o release e não o debug. Mais informações [aqui](https://melanee-melanee.medium.com/how-can-i-build-an-apk-for-my-flutter-app-and-prepare-it-to-release-9c3fc81885f).

#### Como entregar - Repositório git (github)
Mantêm-se as regras da avaliação contínua.

#### Regra dos Commits
Deverão ser feitos (pelo menos) **quatro (4) _commits_** **não triviais** (que tenham impacto na funcionalidade do programa), por cada aluno do grupo. Os alunos que não cumpram esta regra **serão penalizados em 3 valores** na nota do projeto.

### Prazo de entrega
A entrega deverá ser feita através de um _commit_ no repositório git criado pelo github classroom.

Para efeitos de avaliação do projeto, será considerado o último _commit_ feito no repositório.

A data limite para fazer o último _commit_ e para entregar o APK no Moodle é dia **07 de Julho (Domingo)**, **até às 23h59** (hora de Lisboa, Portugal). Recomenda-se que os alunos verifiquem que o _commit_ foi enviado (_pushed_), usando a interface _web_ do github. Não serão considerados _commits_ feitos após essa data e hora.

Não serão consideradas entregas fora de prazo nem serão efetuadas extensões de prazo para a entrega sem exceção. Os alunos que não entreguem o projeto (código no GitHub e o APK no Moodle) terão nota 0 no que diz respeito a esta avaliação e por consequência reprovam em época normal (componente prática).

### Avaliação
Para aprovação em época de recurso, o projeto tem nota mínima de 9,5 valores.

Segue-se uma tabela com os critérios e cotações que serão levados em consideração na avaliação do projeto. A cotação de cada critério de avaliação é distribuída (não uniformemente) por três partes, tal como já acontecia na parte 1:

- Cumprimento do requisito
- Design e usabilidade
- Qualidade da implementação

#### Descrição Cotação

##### Arquitetura da aplicação (separação UI - Lógica de negócio, injeção de dependências, boas práticas)
1

##### Dashboard
2

##### Apresentação dos parques - Lista (API Emel) [obrigatório]
2

##### Apresentação dos parques - Mapa
- Apresentação do google maps [obrigatório]
0,5
- Markers com os parques (API Emel) [obrigatório]
1

##### Detalhe do parque
- Dados do parque (API Emel) [obrigatório]
1
- Apresentar incidentes vindos da BD [obrigatório]
1

##### Registro de incidentes
- Formulário registra na BD [obrigatório]
1

##### Geolocalização (uso apropriado nos vários ecrãs)
1

##### Funcionamento Offline (funcionalidade avançada)
2

##### Testes unitários/integração
1,5

##### Vídeo [obrigatório]
1

**Total**: 16 valores

#### Descrição - Recurso Cotação

##### Apresentação dos parques GIRA - Mapa
- Apresentação do google maps [obrigatório]
0,5
- Markers com os parques GIRA (API Emel) [obrigatório]
1

##### Detalhe GIRA
- Dados do parque GIRA (API Emel) [obrigatório]
1
- Apresentar incidentes vindos da BD [obrigatório]
0,5

##### Formulário GIRA [obrigatório]
1

**Total**: 20 valores

### Defesa do projeto
Para garantir que os alunos que vão à defesa do projeto têm um conjunto mínimo de funcionalidade implementada para que o projeto possa ser defendido com sucesso, alguns requisitos são de implementação **obrigatória**. Esses requisitos estão indicados na tabela da secção anterior.

- Os alunos que entreguem projetos que não cumpram todos os requisitos obrigatórios (incluindo os da avaliação contínua) serão reprovados em época de recurso.

As defesas realizar-se-ão nos dias 9 e/ou 10 de Julho, de forma presencial. O dia/hora exato será anunciado mais próximo da data. A presença da defesa é obrigatória para todos os alunos - quem não comparecer terá zero na nota final do projeto.

Durante esta defesa individual, será pedido ao aluno que faça alterações ao código para dar resposta a alterações aos requisitos. Da discussão presencial de cada aluno, resultará uma nota de 0 a 100%, que será aplicada à nota do projeto.

**Nota**: Por restrições temporais, não haverá tempo para os professores confirmarem que os projetos cumprem realmente os requisitos obrigatórios antes da data da defesa. Os professores irão usar a informação que colocarem no README e confiar que está correta. Caso posteriormente se venha a detetar que alguma funcionalidade obrigatória não ficou corretamente implementada, a defesa ficará sem efeito e o grupo respetivo terá nota zero.

### Cópias
Mantêm-se as regras da avaliação contínua.

### Outras informações relevantes
Mantêm-se as informações da avaliação contínua.

#### FIM
