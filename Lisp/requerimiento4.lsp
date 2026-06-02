;;;; Requerimiento 4: "Análisis de ciclos semafóricos"
;; ========================================================
;; FUNCIÓN: duracion-ciclo 
;; NATURALEZA: pura
;; ESTRATEGIA: predicado
;; IMPACTO: No destructiva
;; ========================================================
(defun duracion-ciclo (ciclo-seg)
    (cond ((listp ciclo-seg) (error "El parametro debe ser solamente un dato (atomo)"))
          ((not (numberp ciclo-seg)) (error "Tipo de dato incorrecto. Debe ser numérico"))
          ((not (plusp ciclo-seg)) (error "El numero debe ser mayor o igual a 0 (positivo)")) ;tambien puede ser (< ciclo-seg 0) 
          (t (if (and (>= ciclo-seg 35)(<= ciclo-seg 150)) t nil ))
    ); fin cond
);fin

;; ========================================================
;; FUNCIÓN: recomendacion-ciclo 
;; NATURALEZA: pura
;; ESTRATEGIA: condicional
;; IMPACTO: No destructiva
;; ========================================================
(defun recomendacion-ciclo (seg-ciclo)
    (cond ((duracion-ciclo seg-ciclo) "Optimo"); primera condicion "si esta dentro del rango o no"        
          ((< seg-ciclo 35) "Demasiado corto");  segunda condicion si es menor que el minimo (35seg)
          (t "Demasiado largo");                 ultima condicion si es mayor que el maximo (150seg)
    );fin COND
);fin
