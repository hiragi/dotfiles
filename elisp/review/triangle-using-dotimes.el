(defun triangle-using-dotimes (number-of-rows)
  ""
  (let ((total 0))
	(dotimes (number number-of-rows total)
	  (princ total)
	  (setq total (+ total (1+ number))))))

(triangle-using-dotimes 10)
