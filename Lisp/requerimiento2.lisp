(load "funcionesAux.lisp")

(defun calTimer (tiempo)
  (let ((rValor (cdr (obtenerColor :rojo)))
        (vValor (cdr (obtenerColor :verde)))
        (aValor (cdr (obtenerColor :amarillo))))
    (and (not (integerp tiempo)) "tiempo ingresado incorrecto")
    (calcularRem tiempo rValor vValor aValor)
   )
)

(defun calcularRem (tiempo rojo verde amarillo)
    (compararRem (rem tiempo (+ rojo verde amarillo)) rojo verde amarillo)
)

(defun compararRem(resto rojo verde amarillo) 
    (cond
        ((< resto rojo) 'en-rojo)
        ((< resto (+ amarillo rojo)) 'en-amarillo)
        ((>= resto (+ amarillo rojo)) 'en-verde)
        (t "error")
    )
)



