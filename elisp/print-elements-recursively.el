(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-recursively (list)
  "Print each element of LIST on a line of its own. Uses recursion."
  (if list  ; 再帰条件
	  (progn
		(print (car list)) ; 本体
		(print-elements-recursively ; 再帰呼び出し
		 (cdr list))))) ; 次段式

(print-elements-recursively animals)
