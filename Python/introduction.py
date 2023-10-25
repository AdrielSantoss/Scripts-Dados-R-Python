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

# Numpy
a = np.array([1, 12, 23, 27])
print(a.dtype)
