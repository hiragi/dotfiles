(defun triangle (number-of-rows)
  (let ((total 0)
		(row-number 1))
	(while (<= row-number number-of-rows)
	  (setq total (+ total row-number))
	  (setq row-number (1+ row-number)))
	total))

(triangle 10)
