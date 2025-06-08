(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-recursively (list)
  "Print each element of LIST on a line of its own."
  (if list
	  (progn ;; º¸¤«¤é½ç¤ËÉ¾²Á¤¹¤ë
		(print (car list))
		(print-elements-recursively
		 (cdr list)))))

(print-elements-recursively animals)
