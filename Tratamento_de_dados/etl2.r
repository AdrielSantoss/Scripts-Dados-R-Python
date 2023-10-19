library("jsonlite")  # jsonlite, pacote de manipulação de JSON
library("dplyr") # dplyer pacote de manipulação de dados para o R
library("rlist") # dplyer pacote de manipulação de LISTAS para o R
library("stringr") # stringr, pacote que adiciona metodos para manipular strings

# LEITURA DE ARQUIVO CSV
dados_csv <- read.csv("Churn.csv", sep = ";", na.strings = "")
col_names <- colnames(dados_csv)

# PARAMETRO AGRUPADOR
grouper_param <- "Estado"

if (!(grouper_parameter %in% col_names)) {
  stop(str_interp("O campo ${grouper_parameter} não existe no arquivo CSV")) # problema aqui, nao esta parando o script
}

groupers <- dados_csv[grouper_param] %>% distinct() #  AGRUPADORES
groupers[is.na(groupers)] <- "Not grouped" #  AGRUPADORES NULOS

# MONTANDO LIST DE DATAFRAMES PARA CONVERSÃO JSON
json_content <- list()

for (grouper in groupers[[grouper_param]]) {
  infos <- dados_csv[dados_csv[[grouper_param]] == grouper, ]
  df <- data.frame(matrix(ncol = length(col_names), nrow = 0))
  colnames(df) <- col_names

  for (row in 1:nrow(infos)) {
    for (key in col_names) {
      value <- infos[row, ][key]

      if (!is.null(value) && !is.na(value)) {
        df[row, key] <- value
      }
    }
  }

  json_content <- list.append(json_content, df)
}

names(json_content) <- groupers[[grouper_param]]
write(toJSON(json_content, rownames=FALSE), "myJSON.json")
