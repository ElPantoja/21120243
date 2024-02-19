- # Funciones de Clisp
  * ### Nombre de Funcion Operacion que realiza
  ``` clisp
  
(defun sumar (a b)
  "Realiza la suma de dos números."
  (+ a b))

(defun restar (a b)
  "Realiza la resta de dos números."
  (- a b))

(defun multiplicar (a b)
  "Realiza la multiplicación de dos números."
  (* a b))

(defun dividir (a b)
  "Realiza la división de dos números."
  (/ a b))

(defun obtener-longitud (lista)
  "Devuelve la longitud de una lista."
  (length lista))

(defun obtener-elemento (indice lista)
  "Devuelve el elemento en el índice especificado de una lista."
  (nth indice lista))

(defun concatenar-listas (lista1 lista2)
  "Concatena dos listas."
  (append lista1 lista2))

(defun invertir-lista (lista)
  "Invierte el orden de los elementos en una lista."
  (reverse lista))

(defun encontrar-elemento (elemento lista)
  "Verifica si un elemento está presente en una lista."
  (member elemento lista))

(defun agregar-elemento (elemento lista)
  "Agrega un elemento al principio de una lista."
  (cons elemento lista))

(defun crear-lista (&rest elementos)
  "Crea una lista a partir de los elementos proporcionados."
  (list elementos))

(defun primer-elemento (lista)
  "Devuelve el primer elemento de una lista."
  (car lista))

(defun resto-elementos (lista)
  "Devuelve todos los elementos excepto el primero de una lista."
  (cdr lista))

(defun verificar-identidad (objeto1 objeto2)
  "Verifica si dos objetos son idénticos."
  (eq objeto1 objeto2))

(defun verificar-igualdad (objeto1 objeto2)
  "Verifica si dos objetos son estructuralmente iguales."
  (equal objeto1 objeto2))

(defun formatear-cadena (cadena &rest parametros)
  "Formatea una cadena con los parámetros especificados."
  (format cadena parametros))

(defun leer-expresion ()
  "Lee una expresión desde la entrada estándar."
  (read))

(defun imprimir-objeto (objeto)
  "Imprime un objeto en la salida estándar."
  (write objeto))

(defun asignar-valor (variable valor)
  "Asigna un valor a una variable."
  (setq variable valor))

(defun definir-funcion (nombre parametros &rest cuerpo)
  "Define una función Lisp."
  (defun nombre parametros cuerpo))

  ```
