(defun what-line ()
  "Print the current line number (in the buffer) of point."
  (interactive)
  (save-restriction)
  (widen)
  (save-excursion
	(beginning-of-line)
	(message "Line %d"
			 (1+ (count-lines 1 (point))))))
