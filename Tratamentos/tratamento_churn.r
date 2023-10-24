dados_csv <- read.csv("Churn.csv", sep = ";", na.strings = "")
colnames(dados_csv) <- c("Id", "Score", "Estado", "Genero", "Idade",
                         "Patrimonio", "Saldo", "Produtos", "TemCartaoCredito", "Ativo", "Salario", "Saiu" )

# 1 - VISUALIZAÇÃO DOS DADOS

summary(dados_csv)
View(dados_csv)
head(dados_csv)

# 1.1 - Dados categóricos
# Estado
counts <- table(dados_csv$Estado)
barplot(counts) # RP e TD estão errados
dados_csv$Estado <- factor(dados_csv$Estado)

# Genero
counts <- table(dados_csv["Genero"])
barplot(counts) # F, Fem e M, estão errados

# 1.2 - Dados numéricos:
# Score
summary(dados_csv$Score)
boxplot(dados_csv$Score)
hist(dados_csv$Score)

# Idade
summary(dados_csv$Idade) # valor minimo (-20) e valor máximo (140), estão errados
boxplot(dados_csv$Idade)
hist(dados_csv$Idade)

# Saldo
summary(dados_csv$Saldo)
boxplot(dados_csv$Saldo)
hist(dados_csv$Saldo) # Saldo 0, está errado

# Salário
summary(dados_csv$Salario) # Salário possui valores NA
boxplot(dados_csv$Salario)
hist(dados_csv$Salario)

# 2 - APLICANDO CORREÇÕES NOS DADOS

# 2.1 - Verificando NA's
# Todas as linhas do Dataframe que possui NA em alguma coluna
View(dados_csv[!complete.cases(dados_csv), ])

# 2.2 - Resolvendo Salários com NA's
summary(dados_csv$Salario)
salario_median <- median(dados_csv$Salario, na.rm = TRUE)
dados_csv[is.na(dados_csv$Salario), ]["Salario"] <- salario_median # Atribuindo mediana para dados NA'S
dados_csv[!complete.cases(dados_csv$Salario), ] # Verificando se existem NA's na coluna salario

# 2.3 - Resolvendo falta de padronização no Genero
unique(dados_csv$Genero)
table(dados_csv$Genero)
dados_csv[is.na(dados_csv$Genero) | dados_csv$Genero == "M", ]["Genero"] <- "Masculino" # Resolvendo NA'S e padronizando para Masculino
dados_csv[dados_csv$Genero == "F" | dados_csv$Genero == "Fem", ]["Genero"] <- "Feminino" # Padronizando para Feminino
dados_csv$Genero <- factor(dados_csv$Genero) # Atribuindo o tipo FATOR para dados categóricos
class(dados_csv$Genero)

# 2.4 - Resolvendo idades erradas
summary(dados_csv$Idade)
View(dados_csv[dados_csv$Idade < 0 | dados_csv$Idade > 110, ])
dados_csv[is.na(dados_csv$Idade), ] # Não idades NA'S
idade_median <- median(dados_csv$Idade)
dados_csv[dados_csv$Idade < 0 | dados_csv$Idade > 110, ] <- idade_median # Idades MENORES que 0 e MAIORES que 110, recebem a mediana
summary(dados_csv$Idade)

# 2.5 - Resolvendo estados fora do dominio
unique(dados_csv$Estado)
dados_csv[!dados_csv$Estado %in% c("RS", "SC", "PR"),]$Estado <- "RS" # Utilizando o operador "IN" do R
dados_csv$Estado <- factor(dados_csv$Estado)

# 3 - RESOLVENDO DADOS DUPLICADOS
# Todo: colocar um looping e filtrar cada elemento duplicado
duplicados <- dados_csv[duplicated(dados_csv$Id), ]
dados_csv <- dados_csv[-c(82),] # Detectamos a linha 81 duplicada e remove