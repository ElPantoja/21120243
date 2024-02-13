# Python

- ### Factorial

``` python

def factorial(n):
    if n == 0:
        return 1
    else:
        result = 1
        for i in range(1, n + 1):
            result *= i
        return result

# Ejemplo de uso
numero = 5
print("El factorial de", numero, "es:", factorial(numero))

```
>[!IMPORTANT]
> Nota: No se declara el tipo de variable

- ### Fibonacci

``` python
def fibonacci(n):
    if n <= 0:
        return "Por favor, introduce un número entero positivo."
    elif n == 1:
        return 0
    elif n == 2:
        return 1
    else:
        fib = [0, 1]
        for i in range(2, n):
            fib.append(fib[-1] + fib[-2])
        return fib[-1]

# Ejemplo de uso
numero = 10
print("El término", numero, "de la secuencia de Fibonacci es:", fibonacci(numero))
```
>[!IMPORTANT]
> Nota: No se usan librerias

- ### Palabra Palindroma 

``` python
def es_palindromo(palabra):
    # Convertir la palabra a minúsculas y eliminar los espacios en blanco
    palabra = palabra.lower().replace(" ", "")
    # Verificar si la palabra es igual a su versión invertida
    return palabra == palabra[::-1]

# Ejemplo de uso
palabra = "reconocer"
if es_palindromo(palabra):
    print(f'La palabra "{palabra}" es un palíndromo.')
else:
    print(f'La palabra "{palabra}" no es un palíndromo.')
```


- #### Python


| Tipo De Dato           | Tipado                 | Paradigma               |
| ---------------------- | ---------------------- | ----------------------  |
| Dinamico               | Fuertemente Tipado     | Orientada a Objetos     |
