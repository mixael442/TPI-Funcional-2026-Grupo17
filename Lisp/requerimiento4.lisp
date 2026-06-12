;;;; Requerimiento 4: "Análisis de ciclos semafóricos"
;; ========================================================
;; FUNCIÓN: duracion-ciclo 
;; NATURALEZA: Pura (no produce efectos secundarios)
;; ESTRATEGIA: Operacion aritmética (suma)
;; IMPACTO: No destructiva 
;; ========================================================
(load "funcionesAux.lisp")

(defun duracion()

  (let ((rojo (cdr (obtener-color :rojo)))
        (verde (cdr (obtener-color :verde)))
        (amarillo (cdr (obtener-color :amarillo)))
        (intermitente (cdr (obtener-color :intermitente))))

    (+ rojo
       intermitente
       verde
       intermitente
       amarillo
       intermitente)))
;fin 
;; ========================================================
;; FUNCIÓN: recomendacion-ciclo 
;; NATURALEZA: Pura (misma entrada, misma salida)
;; ESTRATEGIA: Condicional (evalua distintos casos para una entrada)
;; IMPACTO: No destructiva
;; ========================================================
(defun recomendacion-ciclo (duracion)
      (cond ((> duracion 150) "Ciclo demasiado largo")
            ((< duracion 35) "Ciclo demasiado corto")
            (t "Ciclo optimo")
      );fin cond
);fin
