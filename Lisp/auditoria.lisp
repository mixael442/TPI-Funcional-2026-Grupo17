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

; FUNCION: mostrar-evento
; NATURALEZA: Impura
;DESCRIPCION:  Muestra un único evento por pantalla.
;IMPACTO:no destructiva
(defun mostrar-evento (evento)

  (format t
          "Tiempo ~A: la luz ha cambiado de ~A a ~A~%"
          (car evento)
          (cadr evento)
          (caddr evento)))

;FUNCION: mostrar-historial
; NATURALEZA: Impura
; Recorre recursivamente el historial
; y muestra cada evento.
;IMPACTO: nos destructiva
(defun mostrar-historial (historial)

  (cond
    ((null historial) nil)

    (t
     (mostrar-evento (car historial))
     (mostrar-historial (cdr historial)))))


;FUNCION: escribir-eventos
;NATURALEZA: Impura
;DESCRIPCIÓN: Escribe los eventos del historial en un stream.
;IMPACTO: no destructiva
(defun escribir-eventos (historial stream)

  (cond
    ((null historial) nil)

    (t
     (let ((evento (car historial)))

       (format stream
               "Tiempo ~A: la luz ha cambiado de ~A a ~A~%"
               (car evento)
               (cadr evento)
               (caddr evento)))

     (escribir-eventos
      (cdr historial)
      stream))))



;FUNCION: informe
;NATURALEZA: Impura
;DESCRIPCIÓN:
;Genera un archivo con el historial de eventos.
;IMPACTO: destructiva
(defun informe (historial)

  (with-open-file
      (stream
       "informe-ejecucion-semaforo.txt"
       :direction :output
       :if-exists :supersede
       :if-does-not-exist :create)

    (format stream
            "Informe de Ejecución del Sistema Semafórico~%~%")

    (escribir-eventos
     (reverse historial)
     stream)

    (format stream
            "~%- Fin del Informe -~%")))
  
