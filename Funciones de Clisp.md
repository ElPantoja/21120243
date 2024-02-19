- # Funciones de Clisp
  * ### Nombre de Funcion Operacion que realiza
 * #### Suma 
(defun sumar (a b)
  "Realiza la suma de dos números."
  (**+** a b))
 * #### Resta 
(defun restar (a b)
  "Realiza la resta de dos números."
  (**-** a b))
 * #### Multiplicar 
(defun multiplicar (a b)
  "Realiza la multiplicación de dos números."
  (* a b))
 * #### Dividir 
(defun dividir (a b)
  "Realiza la división de dos números."
  (**/** a b))
 * #### Obtener Longitud 
(defun obtener-longitud (lista)
  "Devuelve la longitud de una lista."
  (**length** lista))
 * #### Obtener Elemento 
(defun obtener-elemento (indice lista)
  "Devuelve el elemento en el índice especificado de una lista."
  (**nth** indice lista))
 * #### Concantenar Listas
(defun concatenar-listas (lista1 lista2)
  "Concatena dos listas."
  (**append** lista1 lista2))
 * #### Invertir Lista 
(defun invertir-lista (lista)
  "Invierte el orden de los elementos en una lista."
  (**reverse** lista))
 * #### Encontrar Elemento 
(defun encontrar-elemento (elemento lista)
  "Verifica si un elemento está presente en una lista."
  (**member** elemento lista))
 * #### Agregar Elemento 
(defun agregar-elemento (elemento lista)
  "Agrega un elemento al principio de una lista."
  (**cons** elemento lista))
 * #### Crear Lista 
(defun crear-lista (&rest elementos)
  "Crea una lista a partir de los elementos proporcionados."
  (**list** elementos))
 * #### Primer Elemento 
(defun primer-elemento (lista)
  "Devuelve el primer elemento de una lista."
  (**car** lista))
 * #### Resto de Elementos 
(defun resto-elementos (lista)
  "Devuelve todos los elementos excepto el primero de una lista."
  (**cdr** lista))
 * #### Verificar Identidad 
(defun verificar-identidad (objeto1 objeto2)
  "Verifica si dos objetos son idénticos."
  (**eq** objeto1 objeto2))
 * #### Verificar Igualdad 
(defun verificar-igualdad (objeto1 objeto2)
  "Verifica si dos objetos son estructuralmente iguales."
  (**equal** objeto1 objeto2))
 * #### Formatear Cadena 
(defun formatear-cadena (cadena &rest parametros)
  "Formatea una cadena con los parámetros especificados."
  (**format** cadena parametros))
 * #### Leer Expresion 
(defun leer-expresion ()
  "Lee una expresión desde la entrada estándar."
  (**read**))
 * #### Imprimir objeto 
(defun imprimir-objeto (objeto)
  "Imprime un objeto en la salida estándar."
  (**write** objeto))
 * #### Asignar Valor 
(defun asignar-valor (variable valor)
  "Asigna un valor a una variable."
  (**setq**variable valor))
 * #### Definir Funcion 
(defun definir-funcion (nombre parametros &rest cuerpo)
  "Define una función Lisp."
  (**defun** nombre parametros cuerpo))
