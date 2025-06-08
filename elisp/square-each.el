(defun square-each (numbers-list)
  "Square each of a NUMBERS LIST, recursively."
  (if (not numbers-list) ; 再帰条件
	  nil
	(cons
	 (* (car numbers-list) (car numbers-list))
	 (square-each (cdr numbers-list))))); 次段式

(square-each '(1 2 3))
