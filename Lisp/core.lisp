;===============================================================================;
;===============================================================================;
;FUNCIONES AUXILIARES
;DESCRIPCION: extrae los valores necesarios del archivo config.json
(load "~/quicklisp/setup.lisp")
(ql:quickload :cl-json)

(defun leerConfig ()
  (with-open-file (archivo "config.json"
                     :direction :input)
    (json:decode-json archivo)))

(defun obtenerRojo (clave)
  (print (ASSOC clave (leerConfig)))
)

(defun obtenerAmarillo (clave)
  (print (ASSOC clave (leerConfig)))
)

(defun obtenerVerde (clave)
  (print (ASSOC clave (leerConfig)))
)



;===============================================================================;
;===============================================================================;
;TRANSICION: Requerimiento 1
; 1: Estados de Transición
;Implemente la función transicion que modele el cambio de estados del semáforo:
;Especificación:
;Entrada: 
;color-actual (símbolo: en-rojo, en-amarillo, en-verde) y cambiar-a (símbolo del color destino: rojo, amarillo, verde)
;Salida: devuelve una lista con el estado y una acción a realizar, esta última como literal “cambiar-a-<color>”.
;Comportamiento: Por defecto, retorna color actual y 'accion-por-defecto si la transición no es válida
;Ejemplo esperado:
;(transicion 'en-rojo 'verde) → ('en-rojo "cambiar-a-verde")


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



;===============================================================================;
;===============================================================================;
;TIMER - REQUERIMIENTO 2
(defun calTimer (tiempo)
  (let ((rValor (obtenerRojo :rojo))
        (vValor (obtenerVerde :verde))
        (aValor (obtenerAmarillo :amarillo)))
    (and (not (integerp tiempo)) "tiempo ingresado incorrecto")
    (calcularRem tiempo rValor vValor aValor)
   )
)

(defun calcularRem (tiempo rojo verde amarillo)
    (compararRem (rem tiempo (+ rojo verde amarillo)))
)

(defun compararRem(resto) 
    (cond
        ((< resto 90) 'en-rojo)
        ((< resto 96) 'en-amarillo)
        ((>= resto 96) 'en-verde)
        (t "error")
    )
)




;===============================================================================;
;===============================================================================;
;AUDITORÍA - REQUERIMIENTO 3

;FUNCION: registrar-evento
;NATURALEZA: Pura
;DESCRIPCIÓN:
;Agrega un nuevo evento al historial y devuelve
;un historial actualizado.
;IMPACTO: no destructiva
(defun registrar-evento
       (timestamp estado-anterior estado-nuevo historial)

  (cons
   (list timestamp estado-anterior estado-nuevo)
   historial))


;FUNCION: mostrar-evento
;NATURALEZA: Impura
;DESCRIPCIÓN:
;Muestra un único evento por pantalla.
;IMPACTO: no destructiva
(defun mostrar-evento (evento)

  (format t
          "Tiempo ~A: la luz ha cambiado de ~A a ~A~%"
          (car evento)
          (cadr evento)
          (caddr evento)))


;FUNCION: mostrar-historial
;NATURALEZA: Impura
;DESCRIPCIÓN:
;Recorre recursivamente el historial y muestra cada evento.
;IMPACTO: no destructiva
(defun mostrar-historial (historial)

  (cond
    ((null historial) nil)

    (t
     (mostrar-evento (car historial))
     (mostrar-historial (cdr historial)))))


;FUNCION: evento-a-texto
;NATURALEZA: Pura
;DESCRIPCIÓN:
;Convierte un evento en una cadena de texto.
;IMPACTO: no destructiva
(defun evento-a-texto (evento)

  (format nil
          "Tiempo ~A: la luz ha cambiado de ~A a ~A~%"
          (car evento)
          (cadr evento)
          (caddr evento)))


;FUNCION: historial-a-texto
;NATURALEZA: Pura
;DESCRIPCIÓN:
;Convierte todo el historial en una cadena de texto.
;IMPACTO: no destructiva
(defun historial-a-texto (historial)

  (cond
    ((null historial) "")

    (t
     (concatenate
      'string
      (evento-a-texto (car historial))
      (historial-a-texto (cdr historial))))))


;FUNCION: guardar-informe
;NATURALEZA: Impura
;DESCRIPCIÓN:
;Genera un archivo de texto con el informe de auditoría.
;IMPACTO:  no destructiva
(defun guardar-informe (historial)

  (with-open-file
      (archivo
       "informe-ejecucion-semaforo.txt"
       :direction :output
       :if-exists :supersede
       :if-does-not-exist :create)

    (write-string
     (informe historial)
     archivo)))




;FUNCION: informe
;NATURALEZA: Pura
;DESCRIPCIÓN:
;Genera el informe completo como una cadena de texto.
;IMPACTO: no destructiva
(defun informe (historial)

  (concatenate
   'string
   "Informe de Ejecución del Sistema Semafórico

"
   (historial-a-texto (reverse historial))
   "
- Fin del Informe -"))





;===============================================================================;
;===============================================================================;
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





;;;; ============================================================
;;;; REQUERIMIENTO 5: PLANIFICACIÓN TEMPORAL
;;;; FUNCIÓN: ciclos-por-tiempo
;;;; Entrada: minutos
;;;; Salida: número de ciclos completos en ese período
;;;; ============================================================
(defun ciclosTiempo (minutos)
  (let ((duracion-ciclo 216)   ; 90 + 6 + 120 segundos
        (segundos-totales (* minutos 60)))
    (floor segundos-totales duracion-ciclo)))

(format t "~a~%" (ciclos-por-tiempo 15))
(format t "~a~%" (ciclos-por-tiempo 60))
(format t "~a~%" (ciclos-por-tiempo 3))
(format t "~a~%" (ciclos-por-tiempo 1))



;===============================================================================;
;===============================================================================;
;TIMER - REQUERIMIENTO 6
(defun distribucionTemp ()
    (let ((rojo) (amarillo) (verde))

    )
)
