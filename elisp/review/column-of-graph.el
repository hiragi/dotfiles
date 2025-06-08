(defun column-of-graph (max-graph-height actual-height)
  ""
  (let ((insert-list nil)
		(number-of-top-blanks
		 (- max-graph-height actual-height)))
	(while (> actual-height 0)
	  (setq insert-list (cons graph-symbol insert-list))
	  (setq actual-height (1- actual-height)))

	(while (> number-of-top-blanks 0)
	  (setq insert-list (cons graph-blank insert-list))
	  (setq number-of-top-blanks
			(1- number-of-top-blanks)))

	insert-list))


