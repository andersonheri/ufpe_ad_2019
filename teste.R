# Introducao Linguagem R - UFPE - 2019
# Davi Moreira
# Encontro 2/4

# 2 Dados para este encontro 2

# 2.1 Preparando dados ----

library(ffbase) # carregando o pacote 

# definindo diret�rio 
setwd("./dados/dados_encontro_1_ufpe/")

# Os seguintes passos ser�o dados:
# 1. Carregando bases grandes e salvando no formato ffdf
# 2. Filtrando bases para selecionar apenas dados do Estado de Pernambuco

# 1. Carregando bases grandes e salvando no formato ffdf ----

# DOCENTES ----
# carregando base de dados
docentes_ne <- read.csv2.ffdf(file = "DOCENTES_NORDESTE.csv", sep = "|", first.rows=100000)

# definindo diret�rio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# salvando base no formato ffdf
save.ffdf(docentes_ne, dir = "./docentes_ne", overwrite = TRUE) 
rm(list = ls()) # limpando ambiente de trabalho

# MATRICULA ----
# definindo diret�rio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# carregando base de dados
matricula_ne <- read.csv2.ffdf(file = "MATRICULA_NORDESTE.csv", sep = "|", first.rows=100000)

# definindo diret�rio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# salvando base no formato ffdf
save.ffdf(matricula_ne, dir = "./matricula_ne", overwrite = TRUE) 
rm(list = ls()) # limpando ambiente de trabalho

# TURMAS ----
# definindo diret�rio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# carregando base de dados
turmas_ne <- read.csv2.ffdf(file = "TURMAS.csv", sep = "|", first.rows=100000)

# definindo diret�rio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# salvando base no formato ffdf
save.ffdf(turmas_ne, dir = "./turmas_ne", overwrite = TRUE) 
rm(list = ls()) # limpando ambiente de trabalho

# 2. Filtrando bases para selecionar apenas dados do Estado de Pernambuco ----
# MATRICULA ----
# definindo diret�rio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# carregando base de dados 
load.ffdf(dir="./matricula_ne")

# verificando estrutura da base de dados
dim(matricula_ne)

# Selecionando PE
matricula_pe <- subset(matricula_ne, CO_UF == 26) 
dim(matricula_pe)

# transformando em data.frame
matricula_pe <- as.data.frame(matricula_pe) # definindo diretorio

# definindo diret�rio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_2_ufpe/")

# salvando arquivo em formato RData
save(matricula_pe, file = "matricula_pe_censo_escolar_2016.RData")

# DOCENTES ----
# definindo diret�rio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# carregando base de dados 
load.ffdf(dir="./docentes_ne")

# verificando estrutura da base de dados
dim(docentes_ne)

# Selecionando PE
docentes_pe <- subset(docentes_ne, CO_UF == 26) 
dim(docentes_pe)

# transformando em data.frame
docentes_pe <- as.data.frame(docentes_pe)

# definindo diretorio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_2_ufpe/")

# salvando arquivo em formato RData
save(docentes_pe, file = "docentes_pe_censo_escolar_2016.RData")

# TURMAS ----

# carregando base de dados
# definindo diretorio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# carregando base de dados 
load.ffdf(dir="./turmas_ne/")

# Selecionando PE
turmas_pe <- subset(turmas_ne, CO_UF == 26) 
dim(turmas_pe)

# transformando em data.frame
turmas_pe <- as.data.frame(turmas_pe) # definindo diretorio

# definindo diretorio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_2_ufpe/")

# salvando arquivo em formato RData
save(turmas_pe, file = "turmas_pe_censo_escolar_2016.RData")

# ESCOLAS ----
# definindo diretorio
setwd('..')  # move wd para n�vel anterior
setwd("./dados_encontro_1_ufpe/")

# Carregando base de dados
escolas <- read.csv2("ESCOLAS.csv", sep = "|")

# Selecionando PE
escolas_pe <- subset(escolas, CO_UF == 26) 
dim(escolas_pe)

# transformando em data.frame
escolas_pe <- as.data.frame(escolas_pe) # definindo diretorio

# definindo diretorio
setwd('..')
setwd("./dados_encontro_2_ufpe/")

# salvando arquivo em formato RData
save(escolas_pe, file = "escolas_pe_censo_escolar_2016.RData") 
rm(list = ls()) # removendo todos os objetos do ambiente de trabalho

# 2.2 Carregando dados ----

# definindo diret�rio
setwd("./dados_encontro_2_ufpe/")

# carregando dados
load("matricula_pe_censo_escolar_2016.RData")
load("docentes_pe_censo_escolar_2016.RData")
load("turmas_pe_censo_escolar_2016.RData")
load("escolas_pe_censo_escolar_2016.RData")






# 3 Tidyverse tools ----

setwd("C:/Users/Anderson/Desktop/Ad 2/dados_encontro_2_ufpe")

load("matricula_pe_censo_escolar_2016.RData")
load("docentes_pe_censo_escolar_2016.RData")
load("escolas_pe_censo_escolar_2016.RData")
load("turmas_pe_censo_escolar_2016.RData")





install.packages("tidyverse") 
library(tidyverse)

# 3.1 Novo operador:%>% ----

install.packages("magrittr") # instalando o pacote 
library(magrittr) # carregando o pacote

# definindo vetor
x <- c(1, 2, 3, 4)

# As duas linhas abaixo s�o equivalentes.

sqrt(sum(x))  # sem o pipe
x %>% sum %>% sqrt # agora com o pipe.

reg <- airquality %>%
  na.omit %>% 
  lm(Ozone ~ Wind + Temp + Solar.R, data = .) 

summary(reg)

#### Ativdade pr�tica 
# Reescreva as express�es abaixo utilizando o %>%. 
# Use a fun��o magrittr::divide_by() para divis�o caso necess�rio.

x <- seq(0, 100, 5)

# 1.  sqrt(mean(x))
# 2. round(mean(c(1:10)/2), digits = 1)

# Reescreva o codigo abaixo sem utilizar o %>%. 
reg <- airquality %>%
  na.omit %>% 
  lm(Ozone ~ Wind + Temp + Solar.R, data = .) 

# Use summary(reg) para verificar o resultado do modelo

# 3.2 Pacote dplyr ----

# Filter ----
library(tidyverse)
setwd("..")
setwd("./dados_encontro_2_ufpe/")

load("matricula_pe_censo_escolar_2016.RData")

matricula_pe_selecao <- matricula_pe %>% filter(NU_IDADE > 10, TP_SEXO == 2)

dim(matricula_pe_selecao)
head(matricula_pe_selecao)

#### Atividade pr�tica: 
# fa�a o filtro abaixo usando a fun��o subset
matricula_pe_selecao <- matricula_pe %>% filter(NU_IDADE > 10, TP_SEXO == 2)
dim(matricula_pe_selecao)
head(matricula_pe_selecao)

# Selecione outras vari�veis de interesse e repita a opera��o na base de matricula_pe

# Na base turmas_pe, selecione apenas aquelas que t�m disciplinas de l�ngua indigena
# Quantas s�o?
# Quantos munic�pios diferentes?

# Arrange ----

matricula_pe_selecao <- matricula_pe %>% arrange(desc(NU_IDADE))
head(matricula_pe_selecao)
summary(matricula_pe_selecao$NU_IDADE)

matricula_pe_selecao <- matricula_pe %>% 
  filter(NU_IDADE > 10, TP_SEXO == 2) %>%
  arrange(desc(NU_IDADE))

head(matricula_pe_selecao)
summary(matricula_pe_selecao$NU_IDADE)

#### Atividade pr�tica: 
# Fa�a o mesmo filtro na base de matricula, mas ordene pelo n�mero de matr�culas em ordem crescente

# Filtre a base docentes_pe selecionando professores negros (Pretos e Pardos) e ordene a base pela idade
# Quantos s�o? Qual a propor��o no Estado?

# Mutate ----
matricula_pe_selecao <- matricula_pe %>% 
  mutate(FX_IDADE = ifelse(NU_IDADE <= 10, "at� 10", "acima de 10"))
head(matricula_pe_selecao)
summary(factor(matricula_pe_selecao$FX_IDADE))

#### Atividade pr�tica: 
# Com a base de escolas, use o codigo de Recife no IBGE para criar uma vari�vel bin�ria 
# que indique se a escola est� na capital do Estado ou n�o.
# Qual a propor��o de escolas na capital?

### Summarise e Group_by ----
library(tidyverse)
load("matricula_pe_censo_escolar_2016.RData")

matricula_pe_selecao <- matricula_pe %>% group_by(CO_MUNICIPIO_END, TP_SEXO) %>% 
  summarise(n_alunos = n(), media_idade = mean(NU_IDADE)) 

matricula_pe_selecao

#### Atividade pr�tica:
# Com a base de turmas, obtenha nova matriz de dados que apresente a m�dia de matriculas e 
# o n�mero de turmas por municipio

# 3.3 Pacote tidyr ----

### Gather ----
# Transforma a base de dados no formato "wide" ("amplo") para "long" ("longo").

nutri <- tibble(
  dia = as.Date('2016-01-01') + 0:29,
  X = rnorm(30, 0, 1),
  Y = rnorm(30, 0, 2),
  Z = rnorm(30, 0, 4)
)
dim(nutri)

nutri_long <- gather(nutri, item, valor, -dia)
dim(nutri_long)

#### Atividade pr�tica:
# Utilize o codigo abaixo para criar uma base de dados fict�cia que tenha as notas 
# m�dias de 100 alunos de tr�s escolas do Estado de Pernambuco por ano.
library(lubridate)

notas <- tibble(
  ano = year(as.Date('1990-01-01')) + 0:27,
  A = sample.int(10, 28, replace = T),
  B = sample.int(10, 28, replace = T),
  C = sample.int(10, 28, replace = T)
)

# Obtenha as estat�sticas descritivas das notas por escola
# Transforme a base do formato wide para long (notas_long)
# Obtenha as estat�sticas descritivas das notas por ano

### Spread ----

# Transforma a base de dados no formato "long" ("longo") para "wide" ("amplo").
dim(nutri_long)
nutri_wide <- nutri_long %>% spread(item, valor)
dim(nutri_wide)
dim(nutri)

#### Atividade pr�tica:
# Coloque a base da atividade anterior no formato wide

# 3.4 Join ou Merge ----
# Contruindo bases para exemplos ----
library(tidyverse)
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)

y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)

### inner_join() ----

x %>% 
  inner_join(y, by = "key")

### left_join() ----

x %>% 
  left_join(y, by = "key")

### right_join() ----

x %>% 
  right_join(y, by = "key")

### full_join() ----

x %>% 
  full_join(y, by = "key")

#### Atividade pr�tica:
# Com os dados do censo escolar, obtenha o n�mero de docentes e o n�mero de 
# matriculas por munic�pio do Estado de Pernambuco. Com essas duas novas bases,
# crie uma terceira base de dados que tenha quatro colunas: codigo do municipio, 
# n�mero de docentes, n�mero de matr�culas, n�mero de matr�culas por docente.
