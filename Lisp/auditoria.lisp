;AUDITORÍA - REQUERIMIENTO 3

;registrar-evento
;NATURALEZA: Pura
;DESCRIPCIÓN:
;Agrega un nuevo evento al historial y devuelve
;un historial actualizado.
(defun registrar-evento
       (timestamp estado-anterior estado-nuevo historial)

  (cons
   (list timestamp estado-anterior estado-nuevo)
   historial))


;escribir-eventos
;NATURALEZA: Impura
;DESCRIPCIÓN:
;Escribe los eventos del historial en un stream.
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



;informe
;NATURALEZA: Impura
;DESCRIPCIÓN:
;Genera un archivo con el historial de eventos.
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
  
