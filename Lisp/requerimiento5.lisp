;;;; ============================================================
;;;; REQUERIMIENTO 5: PLANIFICACIÓN TEMPORAL
;;;; FUNCIÓN: cantidad-ciclos
;;;; Entrada: minutos
;;;; Salida: número de ciclos completos en ese período
;;;; ============================================================
(load "funcionesAux.lisp")

(defun cantidad-ciclos (minutos)

  (if (not (integerp minutos))

      "ingresar un numero entero"

      (floor
       (* minutos 60)

       (+ (cdr (obtener-color :rojo))
          (cdr (obtener-color :verde))
          (cdr (obtener-color :amarillo))
          (* 3 (cdr (obtener-color :intermitente)))))))


