(defun triangle-using-dotimes (number-of-rows)
  "Using dotimes, add up the number of pebbles in a triangle."
  (let ((total 0)) ; otherwise a total is a void variable
	(dotimes (number number-of-rows total)
	  (setq total (+ total (1+ number))))))

(triangle-using-dotimes 4)
