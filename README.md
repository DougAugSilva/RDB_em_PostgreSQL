# Criando um RDB no PostgreSQL e <br/> Analisando Vagas de Emprego
Este projeto é baseado no curso *SQL for Data Analytics* do analista de dados *Luke Barousse*, o projeto consiste me criar um banco de dados relacional (RDB) utilizando *PostgreSQL* integrado com *VsCode*. Serão adicionados ao banco de dados arquivos .csv contendo inforemações sobre anuncios de vagas de emprego na area de dados no ano de 2023. 

## Introdução
### Sobre os Dados
Os dados para o projeto foram retirados de arquivos .csv fornecidos pelo analista de dados *Luke Barousse* em seu curso *SQL for Data Analytics*, os dados originalmente foram coletados no site desenvolvido pelo próprio Luke chamado *Top Skills for Data Nerds*, podendo ser acessado por <https://www.datanerd.tech>. <br/>
Como já citado, os dados incluem iformações sobre anuncio de vagas de empregos na area de dados no ano de 2023, sendo divididos em 4 tabelas contendo informações como *job_location* (localização do trabalho) e *skills* (habilidades), além é claro do slário de cada vaga.

### Objetivos da Análise e Justificando o Uso do SQL
O objetivo desta análise é responder 5 perguntas referentes as vagas de empregos na area de dados, sendo estas:

1. Quais os empregos de analisatas de ddos com os melhores salários?
2. Quais skills (habilidades) são as mais requisitadas nestes trabalhos?
3. Quais as skills (habilidades) com maior demanda para anlisrtas de dados?
4. Quais skills (habilidades) estão associadas com os maiores salários?
5. Quais são as melhores skills (habilidades) parta se aprender?

O uso do SQL se faz necessário por conta da grande quantidade de dados que estamos trabalahando, alem do que, o armazenamento dos dados em um banco de dados relacional facilita o trabalho em conjuntos dos analistas, ddos sua organização e escalabilidade, dexando assim mais fácil análises futuras e possíves atualizações nos dados.

### Ferramentas Utilizadas
- **PostgreSQL:** Utilizado para criar e admninistrar o banco de dados, foi escolhido este por sua populariade e simplicidade.
- **Visua Studio Code:** Utilizado para compilar os códiogos e Querys em SQL
- **SQL:** Utilizado para toda a parte de filtragfem, ordenação e extração dos dados.
- **R:** Utilizado para a geração dos gráficos na análise.
- **Draw.io:** Utilizado para cirar o diagrama do banco de dados relacional.

## Criando o Banco de Dados
Os dados estão diostribuidos em quatro tabelas, sendo a *job_postings_fact* a principal e com amior volume de dados, elá está conectada as tabelas *skills_job_dim* e *company_dim* pelas chaves *job_id* e *company_id*, sendo que *skills_job_dim* também está conecta a tabela *skills_dim* pela chave *skill_id* conforme mostra o diagrama abaixo.

![banco_de_dados_diagrama](imagens/banco_de_dados_diagrama.jpg)

Com isso, vamos primeiro conectar o *VsCode* com o *PostgreSQL*, a primeira vez será necessário criar um usuário e uma senha para o usuario administrador do banco de dados, por breviedade não entrarei em muitos detalhes nesta parte, mas criado o usuario que nesta análise será nomeado *postgres* e feito a conexão do Postgree com o VsCode com as extensões *SQLTools* e *SQLTools Postgre*, podemos abrir uma janela no VsCode para executarmos as querys, o banco de dados é criado pelo comando:
```sql
CREATE DATABASE dados_vagas_emprego
```
Para criarmos a tabelas executamos:
```sql
ALTER TABLE public.company_dim OWNER to postgres;
ALTER TABLE public.skills_dim OWNER to postgres;
ALTER TABLE public.job_postings_fact OWNER to postgres;
ALTER TABLE public.skills_job_dim OWNER to postgres;
```
Agora para facilitar o procesamento das querys, vou definir as chaves primarias e estrangeiras em cada tabela:
```sql
CREATE INDEX idx_company_id ON public.job_postings_fact (company_id);
CREATE INDEX idx_skill_id ON public.skills_job_dim (skill_id);
CREATE INDEX idx_job_id ON public.skills_job_dim (job_id);
```
Feito isso, podemos conferir a criação de tabelas as querys abaixo uma de cada vex:
```sql
SELECT * FROM company_dim
SELECT * FROM skills_dim
SELECT * FROM job_postings_fact
SELECT * FROM skills_job_dim
```
Serão retornadas tabelas vazias, para adicionarmos os dados precisamos dos aquivos .csv que eu inclui na pasta *dados* deste repositório, com isso executamos os comando abaixo para adicionarmos os daods as tabelas criadas:
```sql
COPY company_dim --tabela a ser direcionada
FROM 'local do arquivo em seu computador' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8'); --especifica o formato do arquivo e a formatacao

COPY skills_dim
FROM 'local do arquivo em seu computador'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'local do arquivo em seu computador'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'local do arquivo em seu computador'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
```
No passo anterior pode ocorrer um erro na importação dos dados devido as permição do Postgre para o acesso a certos diretórios em seu computador, é importante verificar estas permições caso esse erro aconteça. <br/>
Agora podemos verificar nocvamente as tabelas, mas incluindo um limite de linhas por conta do volume de dados.
```sql
SELECT * FROM company_dim LIMIT 10
SELECT * FROM skills_dim LIMIT 10
SELECT * FROM job_postings_fact LIMIT 10
SELECT * FROM skills_job_dim LIMIT 10
```
Com isso o banco de dados relacional está criado, e os dados prontos para a análise.

## Análise dos Dados
