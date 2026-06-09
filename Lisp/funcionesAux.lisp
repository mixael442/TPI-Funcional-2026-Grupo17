(load "~/quicklisp/setup.lisp")
(ql:quickload :cl-json)

(defun leerConfig ()
  (with-open-file (stream "Lisp/config.json"
                          :direction :input)
    (json:decode-json stream))
)

(defun calcularTimer (config)
  (let ((red (cdr (assoc :rojo config)))
        (green (cdr (assoc :verde config)))
        (yellow (cdr (assoc :amarillo config))))

    (princ red)
    (princ green)
    (princ yellow)
   )
)

(calcularTimer leerConfig)