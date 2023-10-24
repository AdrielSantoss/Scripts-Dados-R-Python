dados_tempo <- read.csv("tempo.csv", sep = ";")
View(dados_tempo)
View(dados_tempo[!complete.cases(dados_tempo), ])

# Aparencia (categóricos, fatorial)
unique(dados_tempo$Aparencia)
table(dados_tempo$Aparencia)
dados_tempo[dados_tempo$Aparencia == "menos", ]["Aparencia"] <- "sol"

# Temperatura (numérico)
summary(dados_tempo$Temperatura)
barplot(dados_tempo$Temperatura)
temperatura_median <- median(dados_tempo$Temperatura)
dados_tempo[dados_tempo$Temperatura > 130 |
              dados_tempo$Temperatura < -130, ] <- temperatura_median

# Umidade
summary(dados_tempo$Umidade)
umidade_median <- median(dados_tempo$Umidade, na.rm = TRUE)
dados_tempo[is.na(dados_tempo$Umidade), ]["Umidade"] <- umidade_median

# Jogar
unique(dados_tempo$Jogar)
table(dados_tempo$Jogar)
dados_tempo[(dados_tempo$Jogar != "nao" & dados_tempo$Jogar != "sim"), ]["Jogar"] <- "sim"
