(defun calTimer (tiempo)
  (let ((rValor 90)
        (vValor 120)
        (aValor 6))

    (calcular tiempo rValor vValor aValor)
   )
)

(defun calcular (tiempo rojo verde amarillo)
    (comparar (rem tiempo (+ rojo verde amarillo)))
)

(defun comparar(resto) 
    (cond
        ((< resto 90) 'en-rojo)
        ((< resto 96) 'en-amarillo)
        ((>= resto 96) 'en-verde)
        (t "error")
    )
)

(princ (calTimer 3332432))
