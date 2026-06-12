(load "funcionesAux.lisp")
(defun porcentaje-color ()
    (let* ((rojo (cdr (obtener-color :rojo))) 
           (verde (cdr (obtener-color :verde)))
           (amarillo (cdr (obtener-color :amarillo)))
           (ciclo (+ rojo verde amarillo))
           (resto (rem 3600 ciclo)  ))

          
        (list (cons 'rojo (calcular-rem resto ciclo rojo amarillo verde)) 
              (cons 'verde (calcular-rem resto ciclo rojo amarillo verde))
              (cons 'amarillo (calcular-rem resto ciclo rojo amarillo verde)) 
    )
))

(defun calcular-rem (resto ciclo rojo amarillo verde)
    (cond 
        ((< resto rojo) (calcular rojo ciclo resto))
        ((< resto (+ verde rojo)) (calcular verde ciclo (- resto rojo)))
        ((< resto (+ amarillo verde rojo)) (calcular amarillo ciclo (- resto rojo verde)))
        (t (calcular ))
    )
)

(defun calcular (color ciclo)
    (float (* 100 (/ (* color (floor 3600 ciclo)) 3600)))
)



(print(porcentaje-color))