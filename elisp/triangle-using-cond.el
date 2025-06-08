;; condはconditionalの略

;;(conditionalの略 (first-true-or-false-test 最初の帰結動作)
;;(2番目の判定条件 2番目の帰結動作)
;;(3番目の判定条件 3番目の帰結動作)
  ...)
(defun triangle-using-cond (number)
  (cond ((<= number 0) 0)
		((= number 1) 1)
		((> number 1)
		 (+ number (triangle-using-cond (1- number))))))

(triangle-using-cond 10)
