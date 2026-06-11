(load "funcionesAux.lisp")
(defun porcentajeColor ()
    (let* ((rojo (cdr (obtenerColor :rojo))) 
           (verde (cdr (obtenerColor :verde)))
           (amarillo (cdr (obtenerColor :amarillo)))
           (ciclo (+ rojo verde amarillo)))
    
        (list (cons 'rojo (float (* 100 (/ rojo ciclo)))) 
              (cons 'amarillo (float (* 100 (/ amarillo ciclo)))) 
              (cons 'verde (float (* 100 (/ verde ciclo)))))
    )
)

(print (porcentajeColor))