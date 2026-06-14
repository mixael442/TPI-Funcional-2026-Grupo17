; MENU PRINCIPAL
(load "requerimiento2.lisp")
(load "requerimiento4.lisp")
(load "requerimiento5.lisp")
(load "requerimiento6.lisp")

(defun mostrar-menu ()

  (format t "~%")
  (format t " SISTEMA DE SEMAFOROS INTELIGENTES~%")
  (format t "1 - Probar transicion~%")
  (format t "2 - Consultar timer~%")
  (format t "3 - Mostrar historial~%")
  (format t "4 - Duracion de ciclo~%")
  (format t "5 - Recomendacion de ciclo~%")
  (format t "6 - Ciclos por tiempo~%")
  (format t "0 - Salir~%")
  (format t "Seleccione una opcion: ")
  (terpri)
  (read))

(defun ejecutar-menu ()
  (let ((opcion (mostrar-menu)))
    (cond
      ; SALIR
      ((= opcion 0)
       (format t "~%Finalizando programa...~%"))
; REQ 1
      ((= opcion 1)
       (format t "~%Color actual: ")(finish-output)
       (let ((actual (read)))
         (format t "Cambiar a: ")(finish-output)
         (let ((nuevo (read)))
           (format t "~A~%"
                   (transicion actual nuevo))))
       (ejecutar-menu))
; REQ 2
      ((= opcion 2)
       (format t "~%Tiempo Unix: ")
       (let ((tiempo (read)))
         (format t "~A~%"
                 (calcular-timer tiempo)))
       (ejecutar-menu))
; REQ 3
      ((= opcion 3)
       (format t "~%Ingrese variable historial: ")
       (let ((historial (read)))
         (mostrar-historial historial))
       (ejecutar-menu))
; REQ 4
      ((= opcion 4)
       (format t "~%Duracion ciclo: ~A segundos~%~A~%"
               (duracion)
               (recomendacion-ciclo (duracion)))
       (format t "~%Presione ENTER para continuar...")
       (read-line)
       (ejecutar-menu))
 ;REQ 5
      ((= opcion 5)
       (format t "~%Minutos: ")
       (let ((minuto (read)))
        (format t "~%Cantidad de ciclos en ~A minutos: ~A~%"
                   minuto
                  (cantidad-ciclos minuto)))
       (ejecutar-menu))
; REQ 6
      ((= opcion 6)
       (format t "~%Porcentajes de cada color: ~A~%" (porcentaje-color))
       (format t "~%Presione ENTER para continuar...")
       (read-line)
       (ejecutar-menu))
      ;; ERROR
      (t
       (format t "~%Opcion invalida~%")
       (ejecutar-menu))
    )
  )
)
(ejecutar-menu)
