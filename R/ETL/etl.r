# PACKAGES
library("jsonlite")  # jsonlite, pacote de manipulação de JSON
library("dplyr") # dplyer pacote de manipulação de dados para o R
library("stringr") # stringr, pacote que adiciona metodos para manipular strings

# LEITURA DE ARQUIVO CSV
dados_csv <- read.csv("clientes.csv", sep = ";", na.strings = "")
col_names <- colnames(dados_csv) # LENDO OS NOMES DAS COLUNAS

# REMOVENDO ESTADOS DUPLICADOS
Estados <- dados_csv['Estado'] %>% distinct()
Estados[is.na(Estados)] <- "Not grouped"

# CONSTRUINDO STRING JSON
json_content <- "{"

last_element <- Estados$Estado[length(Estados$Estado)]

for (grouper in Estados$Estado) {
  json_content <- paste(json_content, str_interp('"${grouper}": ['))
  infos <- dados_csv[dados_csv$Estado == grouper, ]

  for (row in 1:nrow(infos)) {
    json_content <- paste(json_content, "{")

    for (key in col_names) {
      value <- infos[row, ][key]
      json_content <- paste(json_content, str_interp('"${key}": "${value}"'))

      last_key_name <- col_names[length(col_names)]

      if (key != last_key_name) {
        json_content <- paste(json_content, ",")
      }
    }

    json_content <- paste( json_content, "}")

    if (row != nrow(infos)) {
      json_content <- paste(json_content, ",")
    }
  }

  json_content <- paste(json_content, "]")

  if (grouper != last_element) {
    json_content <- paste(json_content, ",")
  }
}

json_content <- paste(json_content, "}")

# CRIANDO ARQUIVO .JSON
write(toJSON(fromJSON(json_content)), "myJSON.json")