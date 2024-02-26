(defun calcular-precio (cantidad)
  (cond ((< cantidad 5) (* cantidad precio-normal))
        ((and (>= cantidad 5) (< cantidad 12)) (* cantidad (* precio-normal 0.85)))
        ((>= cantidad 12) (* cantidad (* precio-normal 0.7)))
        (t (print "Cantidad inválida"))))
        
(defun pedir-cantidad ()
  (print "Ingrese la cantidad de pantalones a comprar: ")
  (finish-output)
  (read))

(defvar precio-normal 100)

(let ((cantidad (pedir-cantidad)))
  (print "El total a pagar es: ")
  (print (calcular-precio cantidad)))

--------------------------------------------------------------------------
(defun calcular-puntos (salario cantidad otras-propiedades)
  "Calcula los puntos del solicitante según ciertos criterios."
  (let ((puntos 0)
        (porcentaje-salario (/ salario cantidad))
        (doble-cantidad (* 2 cantidad)))
    (cond ((>= porcentaje-salario 0.5) (setq puntos (+ puntos 5)))
          ((and (>= porcentaje-salario 0.25) (< porcentaje-salario 0.5)) (setq puntos (+ puntos 3)))
          ((and (>= porcentaje-salario 0.1) (< porcentaje-salario 0.25)) (setq puntos (+ puntos 1))))
    (cond ((>= otras-propiedades doble-cantidad) (setq puntos (+ puntos 5)))
          ((>= otras-propiedades cantidad) (setq puntos (+ puntos 3))))
    puntos))

(defun solicitar-datos ()
  "Solicita los datos del solicitante."
  (print "Ingrese el nombre del solicitante: ")
  (finish-output)
  (let ((nombre (read-line))
        (historia-crediticia nil)
        (cantidad 0)
        (salario-anual 0)
        (otras-propiedades 0))
    (print "Historia crediticia (b = buena, m = mala): ")
    (finish-output)
    (setq historia-crediticia (read-char))
    (print "Cantidad pedida: ")
    (finish-output)
    (setq cantidad (parse-integer (read-line)))
    (print "Salario anual: ")
    (finish-output)
    (setq salario-anual (parse-integer (read-line)))
    (print "Valor de otras propiedades: ")
    (finish-output)
    (setq otras-propiedades (parse-integer (read-line)))
    (list nombre historia-crediticia cantidad salario-anual otras-propiedades)))

(defun puede-obtener-prestamo (solicitante)
  "Determina si el solicitante puede obtener un préstamo."
  (let ((historia-crediticia (cadr solicitante))
        (cantidad (caddr solicitante))
        (salario (cadddr solicitante))
        (otras-propiedades (fifth solicitante)))
    (if (char= historia-crediticia #\b)
        (let ((puntos (calcular-puntos salario cantidad otras-propiedades)))
          (if (> puntos 6)
              (print "El solicitante puede obtener el préstamo.")
              (print "El solicitante no puede obtener el préstamo debido a su puntaje insuficiente.")))
        (print "El solicitante no puede obtener el préstamo debido a su historia crediticia."))))

(let ((solicitante (solicitar-datos)))
  (puede-obtener-prestamo solicitante))
-------------------------------------------

(defun determinar-tipo-letra (letra)
  "Determina si una letra es una vocal, semivocal o consonante."
  (cond ((member letra '(#\a #\e #\i #\o #\u)) (print "La letra es una vocal."))
        ((char= letra #\y) (print "La letra es una semivocal."))
        ((and (>= letra #\a) (<= letra #\z)) (print "La letra es una consonante."))
        (t (print "El caracter ingresado no es una letra minúscula."))))

(defun solicitar-letra ()
  "Solicita al usuario una letra minúscula."
  (print "Ingrese una letra minúscula:")
  (finish-output)
  (char-downcase (read-char)))

(let ((letra (solicitar-letra)))
  (determinar-tipo-letra letra))
------------------------------------------------
(defun es-bisiesto (anio)
  "Determina si el año es bisiesto."
  (if (if (= (mod anio 4) 0) 
          (if (or (not (= (mod anio 100) 0))
                  (= (mod anio 400) 0))
              t
              nil)
          nil)
      (print "El año es bisiesto.")
      (print "El año no es bisiesto.")))

(defun solicitar-anio ()
  "Solicita al usuario ingresar un año."
  (print "Ingrese un año:")
  (finish-output)
  (parse-integer (read-line)))

(let ((anio (solicitar-anio)))
  (es-bisiesto anio))
----------------------------------------------------

(defun imprimir-dias-del-mes (mes)
  "Imprime el número de días del mes dado."
  (cond ((= mes 2) (print "El mes tiene 28 días."))
        ((member mes '(4 6 9 11)) (print "El mes tiene 30 días."))
        ((member mes '(1 3 5 7 8 10 12)) (print "El mes tiene 31 días."))
        (t (print "MES ERRONEO"))))

(defun solicitar-mes ()
  "Solicita al usuario el número de mes."
  (print "Ingrese el número de mes (del 1 al 12):")
  (finish-output)
  (parse-integer (read-line)))

(let ((mes (solicitar-mes)))
  (imprimir-dias-del-mes mes))
---------------------------------------------------------