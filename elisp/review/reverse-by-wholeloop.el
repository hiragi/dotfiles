(setq animals '(gazelle giraffe lion tiger))

(defun reverse-list-with-while (list)
  (let (value)
	(while list
	  (setq value (cons (car list) value))
	  (setq list (cdr list)))
	value))

(reverse-list-with-while animals)
