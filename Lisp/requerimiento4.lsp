;;;; Requerimiento 4: "Análisis de ciclos semafóricos"
;; ========================================================
;; FUNCIÓN: duracion-ciclo 
;; NATURALEZA: Pura (no produce efectos secundarios)
;; ESTRATEGIA: Operacion aritmética (suma)
;; IMPACTO: No destructiva 
;; ========================================================
(defun duracion-ciclo ()
      (+ 90 6 120)
      ;(+ rojo amarillo verde) --- esto configurando el config.json
);fin 
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
