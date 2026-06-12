"En este codigo las modificaciones del not y or para su validacion" 

(defun transicion (color-actual cambiar-a)
  (cond

    ((not (or (eq color-actual 'en-rojo)
              (eq color-actual 'en-amarillo)
              (eq color-actual 'en-verde)))
     (list 'error "color-actual-invalido"))

    ((not (or (eq cambiar-a 'rojo)
              (eq cambiar-a 'amarillo)
              (eq cambiar-a 'verde)))
     (list 'error "color-destino-invalido"))

    ((eq cambiar-a 'rojo)
     (list color-actual "cambiar-a-rojo"))

    ((eq cambiar-a 'amarillo)
     (list color-actual "cambiar-a-amarillo"))

    ((eq cambiar-a 'verde)
     (list color-actual "cambiar-a-verde"))agregar desciprcion


