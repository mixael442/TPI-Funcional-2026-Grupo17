(defun calTimer (tiempo)
  (let ((rValor 90)
        (vValor 120)
        (aValor 6))
    (and (not (integerp tiempo)) "tiempo ingresado incorrecto")
    (calcularRem tiempo rValor vValor aValor)
   )
)

(defun calcularRem (tiempo rojo verde amarillo)
    (compararRem (rem tiempo (+ rojo verde amarillo)))
)

(defun compararRem(resto) 
    (cond
        ((< resto 90) 'en-rojo)
        ((< resto 96) 'en-amarillo)
        ((>= resto 96) 'en-verde)
        (t "error")
    )
)

