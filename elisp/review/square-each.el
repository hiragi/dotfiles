(defun square-each (numbers-list)
  ""
  (if (not numbers-list)
	  nil
	(cons
	 (* (car numbers-list) (car numbers-list))
	 (square-each (cdr numbers-list)))))

(square-each '(1 2 3))
