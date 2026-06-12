(load "funcionesAux.lisp")
(defun porcentaje-color ()
    (let* ((rojo (cdr (obtener-color :rojo))) 
           (verde (cdr (obtener-color :verde)))
           (amarillo (cdr (obtener-color :amarillo)))
           (ciclo (+ rojo verde amarillo))
           (ciclos (floor 3600 ciclo))
           (resto (rem 3600 ciclo)))

          
        (list (cons 'rojo (calcular rojo (calcular-rem resto rojo verde amarillo 'rojo) ciclos)) 
              (cons 'verde (calcular verde (calcular-rem resto rojo verde amarillo 'verde) ciclos))
              (cons 'amarillo (calcular amarillo (calcular-rem resto rojo verde amarillo 'amarillo) ciclos)) 
    )
))

(defun calcular-rem (resto rojo verde amarillo actual)
    (cond
        ((equal actual 'rojo)(min resto rojo))
        ((equal actual 'verde)(max (min (- resto rojo) verde) 0))
        ((equal actual 'amarillo)(max (min (- resto rojo verde) amarillo) 0))
        (t 0)
    )
)

(defun calcular (color resto ciclos)
    (* 100.0 (/ (+ (* color ciclos) resto) 3600))
)

