(defun areaCuadrado()
(princ "Dame el tamaño del primer Lado: ")
(setq lado1 (read))
(princ "Dame el tamaño del segundo Lado")
(setq lado2 (read))
(setq resultado (* lado1 lado2))
(write resultado)
)

(defun areaTriangulo()
(princ "Dame el tamaño de la Base: ")
(setq base (read))
(princ "Dame el tamaño de la Altura: ")
(setq altura (read))
(setq resultado (/ (* base altura) 2))
(write resultado)
)

(defun areaRectangulo()
(princ "Dame el tamaño de la Base: ")
(setq base (read))
(princ "Dame el tamaño de la Altura: ")
(setq altura (read))
(setq resultado (* base altura))
(write resultado)
)

(defun areaTrapecio()
(princ "Dame el tamaño de la Base Mayor: ")
(setq baseMayor (read))
(princ "Dame el tamaño de la Base Menor: ")
(setq baseMenor (read))
(princ "Dame el tamaño de la Altura: ")
(setq altura (read))
(setq resultado (*(/(+ baseMayor BaseMenor)2)altura))
(write resultado)
)