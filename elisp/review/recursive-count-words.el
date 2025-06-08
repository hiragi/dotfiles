(defun recursive-count-words (region-end)
  ""
  (if (and (< (point) region-end)
		   (re-search-forward "\\w\\W*" region-end t))
	  (1+ (recursive-count-words region-end))

	0))

(defun count-words-region (beggining end)
  (interactive "r")
  (message "")
  (save-excursion
	(goto-char beginning)
	(let ((count (recursive-count-words end)))
	  (cond ((zerop count)
			 (message ""))
			((= 1 count)
			 (message ""))
			(t
			 (message ""))))))
