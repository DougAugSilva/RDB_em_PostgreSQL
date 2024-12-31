-- Cria o conjunto de dados
CREATE DATABASE dados_vagas_emprego

-- Cria as tabelas
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
