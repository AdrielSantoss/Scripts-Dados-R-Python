library("optparse")
library("jsonlite")
suppressWarnings(suppressMessages(library("dplyr")))
library("rlist")
library("stringr")

option_list <- list(
  make_option(c("-p", "--pathcsv"), help = "CSV file path"),
  make_option(c("-n", "--jsonname"), default = "converted_data", help = "JSON file name [Default is converted_data.json]"),
  make_option(c("-s", "--sepatorcsv"), default = ";", help = "CSV data separator"),
  make_option(c("-g", "--grouper"), help = "Data grouping column")
)

parser <- OptionParser(option_list=option_list)
args <- parse_args(parser, positional_arguments = 0)
opt <- args$options

# PARAMETROS DE ENTRADA
path_csv <- ifelse(is.null(opt$pathcsv), file.choose(), opt$pathcsv)
json_name <- opt$jsonname
grouper_param <- opt$grouper
separator_csv <- opt$sepatorcsv

# LEITURA DE ARQUIVO CSV
dados_csv <- read.csv(path_csv, sep = separator_csv, na.strings = "")
col_names <- colnames(dados_csv)
row_numbers <- dim(dados_csv)[1]
col_numbers <- dim(dados_csv)[2]

if (!is.null(grouper_param) && !(grouper_param %in% col_names)) {
  stop(str_interp("O campo ${grouper_param} não existe no arquivo CSV"))
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

cat(str_interp("Converting CSV with ${row_numbers} rows and ${col_numbers} columns...\n"))

if (is.null(grouper_param)) {
  json_content <- create_json_structure(dados_csv)
} else {
  for (grouper in groupers[[grouper_param]]) {
    grouped_data <- dados_csv[dados_csv[[grouper_param]] == grouper, ]

    json_content <- list.append(json_content,
                                create_json_structure(grouped_data))
  }
  names(json_content) <- groupers[[grouper_param]]
}

write(toJSON(json_content, rownames = FALSE), str_interp("${json_name}.json"))
cat("Conversion completed successfully")