# LENDO DADOS DE UM CSV
dados <- read.csv("Churn.csv", sep = ";", na.strings = "", stringsAsFactor = T)
print(dados) # EXIBINDO OS DADOS DO ARQUIVO .CSV
View(dados)  # Usando função de visualização de dados.
head(dados) # CABEÇALHO DOS DADOS (exibe apenas os 6 primeiros registros por default)
summary(dados) # RESUMO DOS DADOS

# Atribuindo nome correto para as colunas
colnames(dados) <- c("Id", "Score", "Estado", "Genero", "Idade",
"Patrimonio", "Saldo", "Produtos", "TemCartCredito", "Ativo", "Salario", "Saiu")
head(dados) # Nesses dados, existem dois tipo de dados categórios (estado e genero)


# Etapa 1: Análise exploratória

# 1.1 Estado (dados categóricos)
counts <- table(dados$Estado)
print(counts) # Criando uma tabela com os estados
barplot(counts, main = "Estados", xlab = "Estados")

# 1.2 Gênero (dados categóricos)
countsGenero <- table(dados$Genero)
print(countsGenero) # Criando uma tabela com os generos
barplot(countsGenero, main = "Gêneros", xlab = "Gêneros")

