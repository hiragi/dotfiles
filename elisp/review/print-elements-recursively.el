(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-recursively (list)
  "Print each element of LIST on a line of its own."
  (if list
	  (progn ;; ��������ɾ������
		(print (car list))
		(print-elements-recursively
		 (cdr list)))))

(print-elements-recursively animals)
