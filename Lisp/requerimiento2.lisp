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

(defun compararRem (resto rojo verde amarillo)

  (cond

    ((< resto rojo)
     'en-rojo)

    ((< resto (+ rojo 3))
     'rojo-intermitente)

    ((< resto (+ rojo 3 verde))
     'en-verde)

    ((< resto (+ rojo 3 verde 3))
     'verde-intermitente)

    ((< resto (+ rojo 3 verde 3 amarillo))
     'en-amarillo)

    ((< resto (+ rojo 3 verde 3 amarillo 3))
     'amarillo-intermitente)

    (t
     "error")))


