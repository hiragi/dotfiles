;; 初期化関数
(defun triangle-initialization (number)
  "Return the sum of numbers 1 through NUMBER inclusive.
This is the 'initialization' component of a two function
duo that uses recursion."
  (triangle-recursive-helper 0 0 number))

;; 援助関数
(defun triangle-recursive-helper (sum counter number)
  "Return SUM, using COUNTER, through NUMBER inclusive,
This is the 'helper' component of a two function duo
that uses recursion."
  (if (> counter number)
	  sum
	(triangle-recursive-helper (+ sum counter)
							   (1+ counter)
							   number)))

(triangle-initialization 2)
