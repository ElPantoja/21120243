(defparameter *nodes*
  '((heroe (
       (genero (
           (hombre (
               (poderes (
                   (superman)
                   (flash)
                   (green lantern)
                   ))
               (habilidades (
                   (batman)
                   (nightwing)
                   ))
               ))
           (mujer (
               (poderes (
                   (wonder woman)
                   (supergirl)
                   ))
               (habilidades (
                   (batgirl)
                   (black canary)
                   ))
               ))
           ))
       ))
    (villano (
       (genero (
           (hombre (
               (poderes (
                   (lex-luthor)
                   (Black Adam)
                   ))
               (habilidades (
                   (deathstroke)
                   (penguin)
				   (joker)
                   ))
               ))
           (mujer (
               (poderes (
                   (June Moone)
                   ))
               (habilidades (
                   (harley quinn)
                   ))
               ))
           ))
       ))
    ))

(defun adivinar-personaje-constante (nodo)
  (cond ((null nodo) (format t "No se ha encontrado ningún personaje.~%"))
        ((atom nodo) (format t "El personaje es: ~a~%" nodo))
        (t (let ((categoria (car nodo)))
             (cond ((eq categoria 'heroe) (format t "¿Tu personaje es un héroe? (s/n): "))
                   ((eq categoria 'villano) (format t "¿Tu personaje es un villano? (s/n): "))
                   ((eq categoria 'genero) (format t "¿Es tu personaje hombre o mujer?~%"))
                   ((eq categoria 'hombre) (format t "¿Tu personaje es un hombre? (s/n): "))
                   ((eq categoria 'mujer) (format t "¿Tu personaje es una mujer? (s/n): "))
                   ((eq categoria 'poderes) (format t "¿Tu personaje tiene poderes sobrehumanos? (s/n): "))
                   ((eq categoria 'habilidades) (format t "¿Tu personaje tiene habilidades sobrehumanas? (s/n): ")))
             (let ((respuesta (read-line)))
               (cond ((string-equal respuesta "s")
                      (adivinar-personaje-constante (cdr (assoc 's (cdr nodo)))))
                     ((string-equal respuesta "n")
                      (adivinar-personaje-constante (cdr (assoc 'n (cdr nodo)))))
                     (t (format t "Respuesta inválida. Inténtalo de nuevo.~%"))))))))

(adivinar-personaje-constante *nodes*)

