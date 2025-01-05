library(tidyverse)
library(forcats)

dados <- read.csv("/1 - CODIGOS/SQL/Resolvendo_4_problemas_com_SQL/pergunta_1.csv")
view(dados)
colnames(dados)

dados %>%
  mutate(job_title = fct_reorder(job_title, salary_year_avg)) %>%
    ggplot(aes(x = salary_year_avg, y = job_title)) + 
    geom_bar(stat = "identity", fill = "blue") +
    labs(x = "Média Salarial Anual em Dólares", y = "Nome da Vaga",
         title = "Salários por Vaga na Área de Dados",
         caption = "Escala em notação científica" )

dados %>%
  mutate(name = fct_reorder(name, salary_year_avg)) %>%
  ggplot(aes(x = salary_year_avg, y = name)) + 
  geom_bar(stat = "identity", fill = "blue") +
  labs(x = "Média Salarial Anual em Dólares", y = "Nome da Vaga",
       title = "Salários por Empresa na Área de Dados",
       caption = "Escala em notação científica" )
