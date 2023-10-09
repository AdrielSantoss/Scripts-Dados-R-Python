# Estrutura de dados no R

# Vetores
x = c(1, 2, 3, 4, 5) #c: Combine (criando um vetor)
x
x[1] # No R a "indexição" dos vetores é 1, diferente da maioria das linguagens de programação que começa com 0
x[2] = 12L

# Um vetor só pode ter dados do MESMO TIPO
idades = c(1, 2, 3, "transformando vetor em um character") # Um vetor de CARACTERES (um vetor só pode ter dados do mesmo tipo)
adriel[2]
class(adriel[2]) # Character: o número dois, virou um CHARACTER

idades = c(1, 2, 3)
class(idades[2]) # numeric

# Matrizes
# Matrizes são vetores bidimensionais (linhas e colunas, x e y)
# VADeaths: Dataset com indices de mortalidade

colnames(VADeaths)
rownames(VADeaths)
class(VADeaths) # Matriz

VADeaths[,1] # Acessando um dado especifico em uma matriz VADeaths[linha, coluna]
VADeaths[2,1]

VADeaths[c(1, 3, 5), ] # Acessando a linha 1, 3 e 5 (é possivel passar um vetor para especificar as linhas)

# DataFrame
# DataFrame é um tipo de dados que se assemelha muito com uma tabela (na prática é um objeto)

longley
longley[, 1:3] # Acessando as 3 primeiras colunas e todas linhas
longley$Population # Retorna os dados em vetores
longley['Population'] # Retorna os dados em formato de coluna

# Lista
# Lista é um vetor de dados com tipos diferentes
ability.cov # ability possui na primeira posição uma Matriz, na segunda um vetor e na terceira um valor númerio
ability.cov$center # acessando o dado na segunda posiçãos
ability.cov$cov # acessando a matriz
class(ability.cov$cov)
ability.cov$cov[,1:3] # acessando a matriz: todas as linhas, colunas de 1  a 3

# Fatores
# São dados categóricos

state.region
class(state.region)


 

