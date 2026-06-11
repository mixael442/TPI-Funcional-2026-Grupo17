(load "funcionesAux.lisp")

(defun calcular-timer (tiempo)
  (let ((rValor (cdr (obtener-color :rojo)))
        (vValor (cdr (obtener-color :verde)))
        (aValor (cdr (obtener-color :amarillo))))
    (and (not (integerp tiempo)) "tiempo ingresado incorrecto")
    (calcularRem tiempo rValor vValor aValor)
   )
)

(defun calcular-rem (tiempo rojo verde amarillo)
    (compararRem (rem tiempo (+ rojo verde amarillo)) rojo verde amarillo)
)

(defun comparar-rem(resto rojo verde amarillo) 
    (cond
        ((< resto rojo) 'en-rojo)
        ((< resto (+ amarillo rojo)) 'en-amarillo)
        ((>= resto (+ amarillo rojo)) 'en-verde)
        (t "error")
    )
)



