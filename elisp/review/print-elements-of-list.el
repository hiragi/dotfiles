(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-of-list (list)
  "Print each element of LIST of a line of its own."
  (while list
	(print (car list))
	(setq list (cdr list))))

(print-elements-of-list animals)
