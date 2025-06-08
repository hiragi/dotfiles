(defun add-element (numbers-list)
  ""
  (if (not numbers-list)
	  0
	(+ (car numbers-list) (add-elements (cdr numbers-list)))))

(add-elements '(1 2 3 4))
