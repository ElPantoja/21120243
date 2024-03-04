; 1.- Ejercicio
(defun SumaDeEnteros (x)
  (if (= x 0)
      0
      (+ x (SumaDeEnteros (- x 1)))))

(SumaDeEnteros 1 2 3 4 5 6 7 8 9)

; 4.- Ejercicio
(defun TercerElemento (lista)
  (car (cdr (cdr lista))))

(TercerElemento Uno Dos Tres)



; 5.- Ejercicio
(defun PrimeroUltimo (lista)
  (if (null (cdr lista))  
      (list (car lista) (car lista))  
      (if (null (cddr lista))  
          (list (car lista) (cadr lista))))) 
;no se como hacerle para n numero de valores en la lista xD

(PrimeroUltimo Uno Dos)