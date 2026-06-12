(load "funcionesAux.lisp")

(defun calcular-timer (tiempo)
  (if (not (integerp tiempo))

      "tiempo ingresado incorrecto"

      (let ((rValor (cdr (obtener-color :rojo)))
            (vValor (cdr (obtener-color :verde)))
            (aValor (cdr (obtener-color :amarillo)))
            (iValor (cdr (obtener-color :intermitente))))

        (calcular-rem
         tiempo
         rValor
         vValor
         aValor
         iValor))))

(defun calcular-rem (tiempo rojo verde amarillo intermitente)
  (compararRem
    (rem tiempo
         (+ rojo verde amarillo
            (* 3 intermitente)))

    rojo
    verde
    amarillo
    intermitente))

(defun compararRem (resto rojo verde amarillo intermitente)

  (cond

    ((< resto rojo)
     'en-rojo)

    ((< resto (+ rojo intermitente))
     'rojo-intermitente)

    ((< resto (+ rojo intermitente verde))
     'en-verde)

    ((< resto (+ rojo intermitente verde intermitente))
     'verde-intermitente)

    ((< resto (+ rojo intermitente verde intermitente amarillo))
     'en-amarillo)

    ((< resto (+ rojo
                 intermitente
                 verde
                 intermitente
                 amarillo
                 intermitente))
     'amarillo-intermitente)

    (t
     "error")))


