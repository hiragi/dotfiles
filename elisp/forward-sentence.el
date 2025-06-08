(defun forward-sentence (&optional arg)
  "Move forward to next sentence-end.  With argument, repeat.
With negative argument, move backward repeatedly to sentence-beginning.
Sentence ends are identified by the value of sentence-endtreated as a regular expression.  Also, every paragraph boundary
terminates sentences as well."
  (interactive "p")
  (or arg (setq arg 1))
  (while (< arg 0)
	(let (par-beg
		  (save-excursion (start-of-paragraph-text (point))))
	  (if (re-search-backward
		   (concat sentence-end "[^ \t\n]") par-beg t)
		  (goto-char (1- (match-end 0)))
		(goto-char par-beg)))
	(setq arg (1+ arg)))
  (while (> arg 0)
	(let ((par-end
		   (save-excursion (end-of-paragraph-text) (point))))
	  (if (re-search-forward sentence-end par-end t)
		  (skip-chars-backward " \t\n")
		(goto-char par-end)))
	(setq arg (1- arg))))
