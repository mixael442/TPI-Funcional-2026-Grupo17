;;;; ============================================================
;;;; REQUERIMIENTO 5: PLANIFICACIÓN TEMPORAL
;;;; FUNCIÓN: cantidad-ciclos
;;;; Entrada: minutos
;;;; Salida: número de ciclos completos en ese período
;;;; ============================================================
(load "funcionesAux.lisp")

(defun cantidadCiclos (minutos)
    (if (not (integerp minutos))
      nil

      (floor (* minutos 60) 
            (+ (cdr (obtenerColor :rojo)) 
                (cdr (obtenerColor :verde)) 
                (cdr (obtenerColor :amarillo))))
    )
)


