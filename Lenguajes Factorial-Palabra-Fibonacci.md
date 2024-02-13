- # Python
  * ### Factorial

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

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int/Float  | Dinamico |  Imperativa |def Nombre Funcion(Dato): |
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

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int/Float  | Dinamico |  Imperativa |def Nombre Funcion(Dato): |

  * ### Palabra Palindroma 

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

>[!IMPORTANT]
> Nota: No se declara la cadena de caracteres

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| String  | Dinamico |  Imperativa | def Nombre Funcion(Dato): |

***

- # C
  * ### Factorial


``` C    
#include <stdio.h>

// Función para calcular el factorial
int factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    int numero;
    
    printf("Introduce un número entero para calcular su factorial: ");
    scanf("%d", &numero);
    
    // Verificar si el número es negativo
    if (numero < 0) {
        printf("No se puede calcular el factorial de un número negativo.\n");
    } else {
        int resultado = factorial(numero);
        printf("El factorial de %d es: %d\n", numero, resultado);
    }
    
    return 0;
}
```
>[!IMPORTANT]
> Nota: Se declara el tipo de variable

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int/Char  | Estatico |  Imperativa |Tipo de Dato **Nombre** (Tipo de Dato **Dato**) |
  - ### Fibonacci

``` C
#include <stdio.h>

// Función para calcular el término n de la secuencia de Fibonacci
int fibonacci(int n) {
    if (n <= 0) {
        return -1; // Manejo de errores para entradas no válidas
    } else if (n == 1 || n == 2) {
        return n - 1; // El primer y segundo término de Fibonacci son 0 y 1 respectivamente
    } else {
        int a = 0; // Inicializa el primer término de Fibonacci
        int b = 1; // Inicializa el segundo término de Fibonacci
        int resultado = 0; // Inicializa el resultado
        
        for (int i = 2; i < n; i++) {
            resultado = a + b; // Calcula el término actual sumando los dos términos anteriores
            a = b; // Actualiza el primer término anterior
            b = resultado; // Actualiza el segundo término anterior
        }
        
        return resultado;
    }
}

int main() {
    int n;
    
    printf("Ingrese el valor de n para calcular el término n de Fibonacci: ");
    scanf("%d", &n);
    
    int resultado = fibonacci(n);
    
    if (resultado == -1) {
        printf("Por favor, ingrese un valor de n válido (mayor que 0).\n");
    } else {
        printf("El término %d de la secuencia de Fibonacci es: %d\n", n, resultado);
    }
    
    return 0;
}

```
>[!IMPORTANT]
> Nota: Se usan librerias

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int  | Estatico |  Imperativa |Tipo de Dato **Nombre** (Tipo de Dato **Dato**) |

  * ### Palabra Palindroma 

``` C
#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Función para verificar si una palabra es un palíndromo
int esPalindromo(char palabra[]) {
    int longitud = strlen(palabra);
    int inicio = 0;
    int fin = longitud - 1;

    // Iterar sobre la palabra desde ambos extremos hacia el centro
    while (fin > inicio) {
        // Ignorar los espacios y convertir los caracteres a minúsculas
        while (!isalpha(palabra[inicio])) {
            inicio++;
        }
        while (!isalpha(palabra[fin])) {
            fin--;
        }

        // Si los caracteres en las posiciones inicio y fin son diferentes, no es un palíndromo
        if (tolower(palabra[inicio]) != tolower(palabra[fin])) {
            return 0;
        }

        inicio++;
        fin--;
    }

    // Si llegamos aquí, la palabra es un palíndromo
    return 1;
}

int main() {
    char palabra[100];

    printf("Ingrese una palabra para verificar si es un palindromo: ");
    scanf("%s", palabra);

    if (esPalindromo(palabra)) {
        printf("%s es un palindromo.\n", palabra);
    } else {
        printf("%s no es un palindromo.\n", palabra);
    }

    return 0;
}

```

>[!IMPORTANT]
> Nota: Se declara la cadena de caracteres

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Char  | Estatico |  Imperativa |Tipo de Dato **Nombre** (Tipo de Dato **Dato**) |