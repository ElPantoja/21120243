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

***

- # Java
  * ### Factorial


``` java   
public class Factorial {
    public static void main(String[] args) {
        int numero = 5; // Cambia este valor por el número del cual deseas calcular el factorial
        long resultado = calcularFactorial(numero);
        System.out.println("El factorial de " + numero + " es: " + resultado);
    }

    public static long calcularFactorial(int n) {
        if (n == 0) {
            return 1;
        } else {
            return n * calcularFactorial(n - 1);
        }
    }
}

```
>[!IMPORTANT]
> Nota: Se declara el tipo de variable

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int  | Estatico |  Orientado a Objetos | public class **Nombre** {} |
  - ### Fibonacci

``` java

public class Fibonacci {
    public static void main(String[] args) {
        int n = 10; // Cambia este valor por el término de Fibonacci que deseas calcular
        long resultado = fibonacci(n);
        System.out.println("El término " + n + " de la secuencia de Fibonacci es: " + resultado);
    }

    public static long fibonacci(int n) {
        if (n <= 1) {
            return n;
        } else {
            return fibonacci(n - 1) + fibonacci(n - 2);
        }
    }
}


```

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int  | Estatico |  Orientado a Objetos | public class **Nombre** {} | 

  * ### Palabra Palindroma 

``` java
import java.util.Scanner;

public class Palindromo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese una palabra: ");
        String palabra = scanner.nextLine();

        if (esPalindromo(palabra)) {
            System.out.println(palabra + " es un palíndromo.");
        } else {
            System.out.println(palabra + " no es un palíndromo.");
        }
    }

    public static boolean esPalindromo(String palabra) {
        // Eliminar los espacios en blanco y convertir la palabra a minúsculas
        palabra = palabra.replaceAll("\\s+", "").toLowerCase();
        
        int longitud = palabra.length();
        
        // Verificar si la palabra es un palíndromo
        for (int i = 0; i < longitud / 2; i++) {
            if (palabra.charAt(i) != palabra.charAt(longitud - i - 1)) {
                return false;
            }
        }
        return true;
    }
}


```

>[!IMPORTANT]
> Nota: Se declara la cadena de caracteres

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| String  | Estatico |  Orientado a Objetos | public class **Nombre** {} |


- # Perl
  * ### Factorial


``` perl
sub factorial {
    my $n = shift;
    if ($n == 0) {
        return 1;
    } else {
        return $n * factorial($n - 1);
    }
}

my $numero = 5; # Cambia este valor al número del cual quieres calcular el factorial
my $resultado = factorial($numero);
print "El factorial de $numero es: $resultado\n";



```

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int  | Dinamico |  Imperativa | **factorial** $n y el numero $numero |
  
  - ### Fibonacci

``` perl
sub fibonacci {
    my $n = shift;
    my ($a, $b) = (0, 1);

    for (my $i = 0; $i < $n; $i++) {
        print "$a "; # Imprime el término actual de la secuencia Fibonacci
        my $temp = $a + $b;
        $a = $b;
        $b = $temp;
    }
}

my $limite = 10; # Cambia este valor para especificar cuántos términos de Fibonacci deseas calcular
print "Secuencia de Fibonacci de los primeros $limite términos:\n";
fibonacci($limite);

```

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int  | Dinamico |  Imperativa | **fibonacci** $n y el Limite $limite | 

  * ### Palabra Palindroma 

``` perl
sub es_palindroma {
    my $palabra = shift;
    my $reversa = reverse $palabra;
    return lc($palabra) eq lc($reversa); # Compara la palabra original con su reverso, ignorando mayúsculas y minúsculas
}

my $entrada = "reconocer"; # Cambia esta palabra para verificar si es palíndroma
if (es_palindroma($entrada)) {
    print "$entrada es una palabra palíndroma.\n";
} else {
    print "$entrada no es una palabra palíndroma.\n";
}

```


| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| String  | Dinamico |  Imperativa | **es_palindroma** $n y palabra inversa $reversa  | 



- # GO
  * ### Factorial


``` go
package main

import "fmt"

func factorial(n int) int {
    if n == 0 {
        return 1
    }
    return n * factorial(n-1)
}

func main() {
    numero := 5 // Cambia este valor al número del cual quieres calcular el factorial
    resultado := factorial(numero)
    fmt.Printf("El factorial de %d es: %d\n", numero, resultado)
}

```

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int  | Estatico |  Imperativa | func **main**() { } |
  
  - ### Fibonacci

``` go
package main

import "fmt"

func fibonacci(n int) {
    a, b := 0, 1
    for i := 0; i < n; i++ {
        fmt.Printf("%d ", a) // Imprime el término actual de la secuencia Fibonacci
        a, b = b, a+b
    }
    fmt.Println() // Imprime una nueva línea al final
}

func main() {
    limite := 10 // Cambia este valor para especificar cuántos términos de Fibonacci deseas calcular
    fmt.Printf("Secuencia de Fibonacci de los primeros %d términos:\n", limite)
    fibonacci(limite)
}

```

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int  | Estatico |  Imperativa | func **main**() { } | 

  * ### Palabra Palindroma 

``` go
package main

import (
    "fmt"
    "strings"
)

func esPalindroma(palabra string) bool {
    palabra = strings.ToLower(palabra) // Convertir la palabra a minúsculas para hacer la comparación insensible a mayúsculas
    for i := 0; i < len(palabra)/2; i++ {
        if palabra[i] != palabra[len(palabra)-1-i] {
            return false // Si los caracteres no coinciden, la palabra no es palíndroma
        }
    }
    return true // Si todos los caracteres coinciden, la palabra es palíndroma
}

func main() {
    entrada := "reconocer" // Cambia esta palabra para verificar si es palíndroma
    if esPalindroma(entrada) {
        fmt.Printf("%s es una palabra palíndroma.\n", entrada)
    } else {
        fmt.Printf("%s no es una palabra palíndroma.\n", entrada)
    }
}

```


| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| String  | Estatico |  Imperativa | func **main**() { } |

- # Rust
  * ### Factorial


``` rust
fn factorial(n: u64) -> u64 {
    if n == 0 {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

fn main() {
    let numero: u64 = 5; // Cambia este valor al número del cual quieres calcular el factorial
    let resultado = factorial(numero);
    println!("El factorial de {} es: {}", numero, resultado);
}


```

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int (u64) | Estatico |  Imperativa | fn **main**() { } |
  
  - ### Fibonacci

``` rust

fn fibonacci(n: u64) -> u64 {
    if n == 0 {
        return 0;
    } else if n == 1 {
        return 1;
    } else {
        let mut a = 0;
        let mut b = 1;
        let mut temp;
        
        for _ in 2..=n {
            temp = a + b;
            a = b;
            b = temp;
        }
        
        return b;
    }
}

fn main() {
    let limite: u64 = 10; // Cambia este valor para especificar cuántos términos de Fibonacci deseas calcular
    println!("Secuencia de Fibonacci de los primeros {} términos:", limite);
    for i in 0..limite {
        print!("{} ", fibonacci(i));
    }
    println!();
}

```

| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| Int (u64) | Estatico |  Imperativa | fn **main**() { } |

  * ### Palabra Palindroma 

``` rust
fn es_palindroma(palabra: &str) -> bool {
    let palabra = palabra.to_lowercase(); // Convertir la palabra a minúsculas para hacer la comparación insensible a mayúsculas
    let caracteres: Vec<char> = palabra.chars().collect(); // Convertir la palabra en una lista de caracteres
    let longitud = caracteres.len();
    
    for i in 0..longitud/2 {
        if caracteres[i] != caracteres[longitud - 1 - i] {
            return false; // Si los caracteres no coinciden, la palabra no es palíndroma
        }
    }
    true // Si todos los caracteres coinciden, la palabra es palíndroma
}

fn main() {
    let entrada = "reconocer"; // Cambia esta palabra para verificar si es palíndroma
    if es_palindroma(entrada) {
        println!("{} es una palabra palíndroma.", entrada);
    } else {
        println!("{} no es una palabra palíndroma.", entrada);
    }
}


```


| Tipo De Dato | Tipado   | Paradigma | Estructura |
| ------------ | -------- | --------  | ---------  |
| chars (&str) | Estatico |  Imperativa | fn **main**() { } |