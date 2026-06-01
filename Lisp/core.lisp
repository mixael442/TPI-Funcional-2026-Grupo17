(defun actividad (color-actual cambiar-a)
	( let (transicion color-actual cambiar-a)))

(defun transicion (color-actual cambiar-a)
  (cond
    ((eq cambiar-a 'rojo);compara si dos simbolos son el mismo 
     (list color-actual "cambiar-a-rojo"));contruye la lista 

    ((eq cambiar-a 'amarillo)
     (list color-actual "cambiar-a-amarillo"))

    ((eq cambiar-a 'verde)
     (list color-actual "cambiar-a-verde"))

    (t
     (list color-actual 'accion-por-defecto))))
