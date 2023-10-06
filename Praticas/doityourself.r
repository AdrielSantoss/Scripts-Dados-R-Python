# Crie duas variáveis ANA e PAULO, atribuindo suas idades e fazendo uma comparação lógica de quem é mais velho
ana = 8L
paulo = 12L

print(paste(if(ana > paulo) "Ana é mais velha" else "Paulo é mais velho", "oi")) # PARECIDO COM TERNÁRIO

if (ana > paulo) {
    print("ana é mais velha")
} else {
    print("paulo é mais velho")
}

# Vendo a classe (type) de um objeto Objeto BOD
class(BOD)

# Retorna quais são os números pares de um vetor
vetor = c(1:10) # Criando um vetor de 1 até 10

for (item in vetor) {
   if((item %% 2) == 0) {
    print(paste(item, "é par"))
   }
}

# Retorna quais são os números pares de um vetor
class(women)
View(women)
tail(women) # ultimas 5 linhas do Objeto WOMEN

# Cria um gráfico com Sepal.width e Petal.length do objeto IRIS
novaIris = iris[50:100, c(2, 3)]
plot(novaIris)
View(iris)
nrow(iris) # Numero de linhas


