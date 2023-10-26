import pandas as pd
import seaborn as srn
import matplotlib.pyplot as plt # Biblioteca para visualização de dados

dadosCsv = pd.read_csv("Churn.csv", sep=";")
dadosCsv.columns = ["Id", "Score", "Estado", "Genero", "Idade",
                         "Patrimonio", "Saldo", "Produtos", "TemCartaoCredito", "Ativo", "Salario", "Saiu"]

# 1 - VISUALIZAÇÃO DOS DADOS
#print(dados_csv)
#print(dados_csv.shape) # Linhas e colunas

# 1.1 - Dados categóricos
# Estado
estadosAgrupados = dadosCsv.groupby(["Estado"]).size() # RP e TD, errados
#plot = estadosAgrupados.plot.bar() 
#plt.show() # Visualização de Gráfico

# Genero
generosAgrupados = dadosCsv.groupby(["Genero"]).size() # F, Fem e M, errados
#plot = generosAgrupados.plot.bar() 
#plt.show() # Visualização de Gráfico

# 1.2 - Dados numéricos
# Score
scoreSummary = dadosCsv["Score"].describe()
#boxplot = srn.boxplot(scoreSummary)
#histogram = srn.histplot(scoreSummary)
#plt.show()

#idade