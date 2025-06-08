(defun triangle-recursively (number)
  "Return the sum of the numbers 1 through NUMBER inclusive. Uses recursion."
  (if (= number 1)
	  1
	(+ number
	   (triangle-recursively (1- number)))))

(triangle-recursively 7)
