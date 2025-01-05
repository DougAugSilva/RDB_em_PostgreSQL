-- Cria o banco de dados
CREATE DATABASE sql_course;

-- Cria a tabela company_dim com sua chave primária
CREATE TABLE public.company_dim(
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT);

-- Cria a tabela skills_dim com sua chave primária
CREATE TABLE public.skills_dim(
    skill_id INT PRIMARY KEY,
    skills TEXT,
    type TEXT);

-- Cria a tabela job_postings_fact com sua chave primária
CREATE TABLE public.job_postings_fact(
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    FOREIGN KEY (company_id) REFERENCES public.company_dim (company_id));

-- Cria a tabela skills_job_dim table com a composição de uma chave primaria e uma chave estrangeira
CREATE TABLE public.skills_job_dim(
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES public.job_postings_fact (job_id),
    FOREIGN KEY (skill_id) REFERENCES public.skills_dim (skill_id));

-- Atribui cada tabela ao usuário postgres
ALTER TABLE public.company_dim OWNER to postgres;
ALTER TABLE public.skills_dim OWNER to postgres;
ALTER TABLE public.job_postings_fact OWNER to postgres;
ALTER TABLE public.skills_job_dim OWNER to postgres;

-- Determina chaves primárias e secunmdarias
CREATE INDEX idx_company_id ON public.job_postings_fact (company_id);
CREATE INDEX idx_skill_id ON public.skills_job_dim (skill_id);
CREATE INDEX idx_job_id ON public.skills_job_dim (job_id);

-- Verifica criação das tabelas
SELECT * FROM company_dim
SELECT * FROM skills_dim
SELECT * FROM job_postings_fact
SELECT * FROM skills_job_dim

--Adiciona os dados nas tabelas
COPY company_dim
FROM 'D:\1 - CODIGOS\SQL\Resolvendo_4_problemas_com_SQL\baixados_do_drive\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'D:\1 - CODIGOS\SQL\Resolvendo_4_problemas_com_SQL\baixados_do_drive\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'D:\1 - CODIGOS\SQL\Resolvendo_4_problemas_com_SQL\baixados_do_drive\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'D:\1 - CODIGOS\SQL\Resolvendo_4_problemas_com_SQL\baixados_do_drive\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
