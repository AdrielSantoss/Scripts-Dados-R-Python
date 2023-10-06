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
barplot(counts, main = "Estados", xlab = "Estados") # função para criar Gráfico de barras

# 1.2 Gênero (dados categóricos)
countsGenero <- table(dados$Genero)
print(countsGenero) # Criando uma tabela com os generos
barplot(countsGenero, main = "Gêneros", xlab = "Gêneros")

# 1.2 Idade
summary(dados$Idade)
boxplot(dados$Idade)
hist(dados$Idade) # Histograma

# 1.3 Saldo
summary(dados$Saldo)
boxplot(dados$Saldo)
hist(dados$Saldo)

# 1.3 Salário
summary(dados$Saldo)
boxplot(dados$Salario)
boxplot(dados$Salario, outline = F)
