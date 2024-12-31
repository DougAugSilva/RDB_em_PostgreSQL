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
Os dados estão diostribuidos em quatro tabelas, sendo uma primária com a maioria dos dados 

