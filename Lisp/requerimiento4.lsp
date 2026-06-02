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
);fin     ---     Tal vez sea necesario eliminar la validacion en esta función, ya que es algo redundante

;; ========================================================
;; FUNCIÓN: recomendacion-ciclo 
;; NATURALEZA: pura
;; ESTRATEGIA: condicional
;; IMPACTO: No destructiva
;; ========================================================
(defun recomendacion-ciclo (seg-ciclo)
    (cond ((listp seg-ciclo) (error "El parametro debe ser solamente un dato (atomo)"))
          ((not (numberp seg-ciclo)) (error "Tipo de dato incorrecto. Debe ser numérico"))
          ((not (plusp seg-ciclo)) (error "El numero debe ser mayor o igual a 0 (positivo)")) ;tambien puede ser (< ciclo-seg 0) 
          (t 
            (cond ((duracion-ciclo seg-ciclo) "Optimo"); primera condicion "si esta dentro del rango o no"        
                  ((< seg-ciclo 35) "Demasiado corto");  segunda condicion si es menor que el minimo (35seg)
                  (t "Demasiado largo");                 ultima condicion si es mayor que el maximo (150seg)
            );fin segundo COND
    )); fin primer cond
);fin
