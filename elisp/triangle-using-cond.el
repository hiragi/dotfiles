;; cond��conditional��ά

;;(conditional��ά (first-true-or-false-test �ǽ�ε���ư��)
;;(2���ܤ�Ƚ���� 2���ܤε���ư��)
;;(3���ܤ�Ƚ���� 3���ܤε���ư��)
  ...)
(defun triangle-using-cond (number)
  (cond ((<= number 0) 0)
		((= number 1) 1)
		((> number 1)
		 (+ number (triangle-using-cond (1- number))))))

(triangle-using-cond 10)
