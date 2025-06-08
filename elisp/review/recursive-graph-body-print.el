(defun recursive-graph-body-print (numbers-list)
  ""
  (let ((height (apply 'max numbers-list))
		(symbol-width (length graph-blank))
		from-position)
	(recursive-graph-body-print-internal
	 numbers-list
	 height
	 symbol-width)))

(defun recursive-graph-body-print-internal
  (numbers-list height symbol-width)
  ""
  (if numbers-list
	  (progn
		(setq from-position (point))
		(insert-rectangle
		 (column-of-graph height (car numbers-list)))
		(goto-char from-position)
		(forward-char symbol-width)
		(sit-for 0)
		(recursive-graph-body-print-internal
		 (cdr numbers-list) height symbol-width))))
