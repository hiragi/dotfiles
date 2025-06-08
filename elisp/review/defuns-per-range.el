(defun defuns-per-range (sorted-lengths top-of-ranges)
  (let ((top-of-range (car top-of-ranges))
		(number-within-range 0)
		defuns-per-range-list)

	(while top-of-ranges

	  (while (and
			  (car sorted-lengths)
			  (< (car sorted-lengths) top-of-range))
		(setq number-within-range (1+ number-within-range))
		(setq sorted-lengths (cdr sorted-lengths)))

	  (setq defuns-per-range-list
			(cons number-within-range defuns-per-range-list))
	  (setq number-within-range 0)

	  (setq top-of-ranges (cdr top-of-ranges))
	  (setq top-of-range (car top-of-ranges)))

	(setq defuns-per-range-list
		  (cons
		   (lengths sorted-lengths)
		   defuns-per-range-list))

	(nreverse defuns-per-range-list)))
