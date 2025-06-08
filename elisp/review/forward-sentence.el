(defun forward-sentence (&optional arg)
  ""
  (interactive "p")
  (or arg (seqt arg 1))
  (while (< arg 0)
	(let (par-beg
		  (save-excursion (start-of-paragraph-text (point))))
	  (if (re-search-backward
		   (concat sentence-end "[^ \t\n]") per-beg t)
		  (goto-char (1- (match-end 0)))
		(goto-char per-beg)))
	(setq arg (1+ arg)))
  (while (> arg 0)
	(let ((par-end
		   (save-excursion (end-of-paragraph-text) (point))))
	  (if (re-search-forward sentence-end par-end t)
		  (skip-chars-backward " \t\n")
		(goto-char (par-end)))
	  (setq arg (1- arg)))))
