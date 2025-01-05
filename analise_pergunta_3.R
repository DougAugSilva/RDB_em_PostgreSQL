library(tidyverse)
library(forcats)

dados <- read.csv("/1 - CODIGOS/SQL/Resolvendo_4_problemas_com_SQL/pergunta_3.csv")
view(dados)
colnames(dados)

contagem = dados %>%
  count(skills)

contagem %>%
  mutate(skills = fct_reorder(skills, n)) %>%
  ggplot(aes(x = n, y = skills)) + 
  geom_bar(stat = "identity" , fill = "blue") +
  labs(x = "Frequência", y = "Ferramenta",
       title = "Frequência das Ferramentas Presentas nas Vagas com Maiores Salários",
       subtitle = "Dados do ano de 2023")
