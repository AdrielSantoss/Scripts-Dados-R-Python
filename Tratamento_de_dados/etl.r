# Criando um ETL básico, cujo objetivo é ler, transformar os dados CSV e carregar estes dados em formato JSON.
# Todo dado que for NA converter em null
# Os dados devem ser organizados por objetos no JSON, separes por ESTADO
library("jsonlite") 

dadosCsv = read.csv("Churn.csv", sep = ";", na.strings = "")

colnames(dadosCsv) = c("Id", "Score", "Estado", "Genero", "Idade",
"Patrimonio", "Saldo", "Produtos", "TemCartCredito", "Ativo", "Salario", "Saiu")

# REMOVENDO ESTADOS DUPLICADOS
#install.packages('dplyr')
library("dplyr") # dplyer pacote de manipulação de dados para o R

Estados = dadosCsv['Estado'] %>% distinct() #  Pipe operator: %>%
View(Estados) # RS, SC, PR e etc...

# TRANSFORMANDO EM JSON

# colNames = colnames(dadosCsv)
# jsonText = ""

# for (col in colNames) {
#     jsonText = paste(jsonText, '{

#     }')

#     #print(dadosCsv[col])
# }

# print(jsonText)



