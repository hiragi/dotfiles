(defun triangle-recursively (number)
  ""
  (if (= number 1)
	  1
	(+ number
	   (triangle-recursively (1- number)))))

(triangle-recursively 7)
