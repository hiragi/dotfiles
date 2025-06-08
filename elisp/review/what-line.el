(defun what-line ()
  ""
  (interactive)
  (save-restriction)
  (widen)
  (save-restriction
	(beginning-of-line)
	(message "Line %d"
			 (1+ (count-lines 1 (point))))))
