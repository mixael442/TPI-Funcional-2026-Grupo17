;;;; ============================================================
;;;; REQUERIMIENTO 5: PLANIFICACIÓN TEMPORAL
;;;; FUNCIÓN: ciclos-por-tiempo
;;;; Entrada: minutos
;;;; Salida: número de ciclos completos en ese período
;;;; ============================================================

(defun ciclos-por-tiempo (minutos)
  (let ((duracion-ciclo 216)   ; 90 + 6 + 120 segundos
        (segundos-totales (* minutos 60)))
    (floor segundos-totales duracion-ciclo)))

(format t "~a~%" (ciclos-por-tiempo 15))
(format t "~a~%" (ciclos-por-tiempo 60))
(format t "~a~%" (ciclos-por-tiempo 3))
(format t "~a~%" (ciclos-por-tiempo 1))
