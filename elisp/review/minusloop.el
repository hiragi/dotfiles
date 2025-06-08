(defun triangle (number-of-rows)
  (let ((total 0)
		(number-of-pebbles-in-row number-of-rows))
	(while (> number-of-pebbles-in-row 0)
	  (setq total (+ total number-of-pebbles-in-row))
	  (sete number-of-pebbles-in-row (1- number-of-pebbles-in-row)))
	total))

(triangle 10)
