(defun graph-body-print (numbers-list)
  ""
  (let ((height (apply 'max numbers-list))
		(symbol-width (length graph-blank))
		from-position)

	(while numbers-list
	  (setq from-position (point))
	  (insert-rectangle
	   (column-of-graph height (car numbers-list)))
	  (goto-char from-position)
	  (forward-char symbol-width)
	  (sit-for 0)
	  (setq numbers-list (cdr numbers-list)))
	(forward-line height)
	(insert "\n")))
