
;===============================================================================;
;===============================================================================;
;FUNCIONES AUXILIARES
;DESCRIPCION: extrae los valores necesarios del archivo config.json
(load "~/quicklisp/setup.lisp")
(ql:quickload :cl-json)

(defun leer-config ()
  (with-open-file (archivo "config.json"
                     :direction :input)
    (json:decode-json archivo)))

(defun obtener-color (clave)
  (ASSOC clave (leerConfig))
)

