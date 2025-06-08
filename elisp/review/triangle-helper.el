(defun triangle-initialization (number)
  ""
  (triangle-recursive-helper 0 0 number))

(defun triangle-recursive-helper (sum counter number)
  ""
  (if (> counter number)
	  sum
	(triangle-recursive-helper (+ sum counter)
							   (1+ counter)
							   number)))

(triangle-initialization 2)
