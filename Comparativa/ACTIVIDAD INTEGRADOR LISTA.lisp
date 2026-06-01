Requerimiento
 1: Estados de Transición
Implemente la función transicion que modele el cambio de estados del semáforo:
Especificación:
Entrada: 
color-actual (símbolo: en-rojo, en-amarillo, en-verde) y cambiar-a (símbolo del color destino: rojo, amarillo, verde)
Salida: devuelve una lista con el estado y una acción a realizar, esta última como literal “cambiar-a-<color>”.
Comportamiento: Por defecto, retorna color actual y 'accion-por-defecto si la transición no es válida
Ejemplo esperado:
(transicion 'en-rojo 'verde) → ('en-rojo "cambiar-a-verde")


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
