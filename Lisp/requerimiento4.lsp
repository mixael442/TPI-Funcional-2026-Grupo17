;;;; Requerimiento 4: "Análisis de ciclos semafóricos"
;; ========================================================
;; FUNCIÓN: duracion-ciclo 
;; NATURALEZA: pura
;; ESTRATEGIA: predicado
;; IMPACTO: No destructiva
;; ========================================================
(defun duracion-ciclo (ciclo-seg)
    (if (and (>= ciclo-seg 35)(<= ciclo-seg 150)) t nil )
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

;;agregar validacion de datos (que sea un numero - el numero puede ser entero o float)
;;mejorar la descripcion de cada funcion (que sea mas descriptivo)
