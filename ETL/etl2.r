library("jsonlite")
library("dplyr")
library("rlist")
library("stringr")

# PARAMETROS DE ENTRADA
csv_name <- "clientes.csv"
json_name <- "clientes.json"
grouper_param <- "Estado"

# LEITURA DE ARQUIVO CSV
dados_csv <- read.csv(str_interp("${csv_name}"), sep = ";", na.strings = "")
col_names <- colnames(dados_csv)

if (!is.na(grouper_param) && !(grouper_parameter %in% col_names)) {
  stop(str_interp("O campo ${grouper_parameter} não existe no arquivo CSV"))
}

groupers <- dados_csv[grouper_param] %>% distinct()
groupers[is.na(groupers)] <- "Not grouped"

# FUNÇÃO DE CRIAÇÃO DA ESTRUTURA DE DADOS PARA CONVERSÃO JSON
create_json_structure <- function(data) {
  json_df <- data.frame(matrix(ncol = length(col_names), nrow = 0))
  colnames(json_df) <- col_names

  for (row in seq_len(1):nrow(data)) {
    for (column in col_names) {
      value <- data[row, ][column]

      if (!is.null(value) && !is.na(value)) {
        json_df[row, column] <- value
      }
    }
  }

  return(json_df)
}

# REALIZANDO CONVERSÃO JSON
json_content <- list()

if (is.na(grouper_param)) {
  json_content <- create_json_structure(dados_csv)
} else {
  for (grouper in groupers[[grouper_param]]) {
    grouped_data <- dados_csv[dados_csv[[grouper_param]] == grouper, ]

    json_content <- list.append(json_content,
                                create_json_structure(grouped_data))
  }
  names(json_content) <- groupers[[grouper_param]]
}

write(toJSON(json_content, rownames = FALSE), str_interp("${json_name}"))