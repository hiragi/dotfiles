(defun count-words-in-defun ()
  ""
  (beginning-of-defun)
  (let ((count 0)
		(end (save-excursion (end-of-defun) (point))))
	(while
		(and (< (point) end)
			 (re-search-forward
			  "\\(\\w\\|\\s_\\)+[^ \t\n]*[ \t\n]*"
			  end t))
	  (setq count (1+ count)))
	count))

(defun count-words-defun ()
  ""
  (interactive)
  (message
   "Counting words and symbols in function definition ... ")
  (let ((count (count-words-in-defun)))
	(cond
	 ((zerop count)
	  (message
	   "The definition does NOT have any words or symbols"))
	 ((=1 count)
	  (message
	   "The definition has 1 word or symbol."))
	 (t
	  (message
	   "The definition has %d words or symbols." count)))))
