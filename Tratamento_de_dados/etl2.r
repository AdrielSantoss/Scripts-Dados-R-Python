library("jsonlite")  # jsonlite, pacote de manipulação de JSON
library("dplyr") # dplyer pacote de manipulação de dados para o R
library("stringr") # stringr, pacote que adiciona metodos para manipular strings
library('rlist')

# LEITURA DE ARQUIVO CSV
dados_csv <- read.csv("Churn.csv", sep = ";", na.strings = "")

colnames(dados_csv) <- c("Id", "Score", "Estado", "Genero", "Idade",
                         "Patrimonio", "Saldo", "Produtos", "TemCartCredito",
                         "Ativo", "Salario", "Saiu")

col_names <- colnames(dados_csv) # LENDO OS NOMES DAS COLUNAS


colnames(dados_csv) <- c("Id", "Score", "Estado", "Genero", "Idade",
                         "Patrimonio", "Saldo", "Produtos", "TemCartCredito",
                         "Ativo", "Salario", "Saiu")

col_names <- colnames(dados_csv) # LENDO OS NOMES DAS COLUNAS

df <- data.frame(matrix(ncol = length(col_names), nrow = 0))
colnames(df) <- col_names
# df[2, 'Id'] = 1 ADICIONANDO VALORES NUM DATA FRAME VAZIO COM COLUNAS

Estados <- dados_csv['Estado'] %>% distinct() #  AGRUPADORES
Estados[is.na(Estados)] <- "Not grouped" #  AGRUPADORES NULOS

json_content = list()

for (grouper in Estados$Estado) {
  infos <- dados_csv[dados_csv$Estado == grouper, ]
  df <- data.frame(matrix(ncol = length(col_names), nrow = 0)) # 7 DATA FRAMES
  colnames(df) <- col_names

  for (row in 1:nrow(infos)) {
    for (key in col_names) {
      value <- infos[row, ][key]
      df[row, key] <- value
    }
  }

  json_content = list.append(json_content, df)
}

names(json_content) = Estados$Estado

write(toJSON(json_content), "myJSON.json")
