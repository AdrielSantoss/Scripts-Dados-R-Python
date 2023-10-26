import pandas as pd
import numpy as np

x = 1  # Inteiro
y = 3.13  # Float
z = "Python"  # String
w = True  # Boolean
y = False  # Boolean

print(type(y))  # Verificando o tipo de uma variável

# Condicionais
if 1 > 2:
    print("errado")
elif (3 == 3):
    print("certo")
else:
    print("errado")

# Looping
count = 1
for n in range(0, 10):
    print(count)
    count += 1

# Criadno listas
lst = [1, 2, 3, 4, 5, 6, 7, 8]  # por padrão é listas

# Dicionários
Precos = {"lapis": 5.5, "borracha": 7.0, "caneta": 6.5}

# Sets, conjuntos não ordenados e não repetidos de elementos
animais = {'gato', 'cachorro'}

# Functions
def imprime(n=1):  # Função com parametros com valroes Default
    print("esta é uma função")
    return n * n

imprime(3)

# Exemplos com Numpy

# Cria uma matriz, unidimensional
import numpy as np
mt = np.array([12, 34, 76])
print(mt)
print(type(mt))

# Cria o array com um tipo especifico
# Cria array com float de 64 bits
import numpy as np
mtfloat = np.array([1, 2, 3.4], dtype=np.float64)
print(mtfloat)
mtnew = mtfloat.astype(np.int32) # Alterando tipos de arrays
print(mtnew)

# Cria uma matriz bidimensional
import numpy as np
mt7 = np.array([[1,2,3], [4,5,6], [7, 8, 9]])
print(mt7)

# Cria não inicializados, array com valores zerados (0)
import numpy as np
vazio = np.empty([3,2], dtype=int) # Array 3 linhas e 2 colunas
print(vazio)

# Cria uma matriz 4x3 com valores zeros
import numpy as np
zeros = np.zeros([4,3], dtype=int)
print(zeros)

# Cria uma matriz 5x7 com valores igual a um
import numpy as np
ones = np.ones([5,7], dtype=int)
print(ones)

# Cria uma matriz quandrada com diagonal principal com valores 1 e outros valores zero
import numpy as np
diagonal = np.eye(5) # 5 linhas e 5 colunas
print(diagonal)

# Valores aleatórios entre zero e um
import numpy as np
ale = np.random.random((1))
print(ale)
