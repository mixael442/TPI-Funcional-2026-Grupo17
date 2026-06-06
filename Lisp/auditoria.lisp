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
