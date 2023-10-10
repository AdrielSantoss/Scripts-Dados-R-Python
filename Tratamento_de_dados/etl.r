# Criando um ETL básico, cujo objetivo é ler, transformar os dados CSV e carregar estes dados em formato JSON.
# Todo dado que for NA converter em null
# Os dados devem ser organizados por objetos no JSON, separes por ESTADO

# PACKAGES
library("jsonlite")  # jsonlite, pacote de manipulação de JSON
library("dplyr") # dplyer pacote de manipulação de dados para o R
library("stringr") # stringr, pacote que adiciona metodos para manipular strings

# LEITURA DE ARQUIVO CSV
dadosCsv = read.csv("Churn.csv", sep = ";", na.strings = "")

colnames(dadosCsv) = c("Id", "Score", "Estado", "Genero", "Idade",
"Patrimonio", "Saldo", "Produtos", "TemCartCredito", "Ativo", "Salario", "Saiu")

# REMOVENDO ESTADOS DUPLICADOS
Estados = dadosCsv['Estado'] %>% distinct() #  Pipe operator: %>%


# CONSTRUINDO STRING JSON
jsonText = '{'
lastEl = Estados$Estado[length(Estados$Estado)]

for (col in Estados$Estado) { #col duplicado aqui
    jsonText = paste(jsonText, str_interp('"${col}": []'))
    
    if(col != lastEl) {
        jsonText = paste(jsonText, ',')
    }
}

jsonText = paste(jsonText, '}')

# CRIANDO ARQUIVO .JSON
write(toJSON(fromJSON(jsonText)), "myJSON.json") 


