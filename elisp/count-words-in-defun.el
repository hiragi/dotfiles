(defun count-words-in-defun ()
  "Return the number of words and symbols in a defun."
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

;; 対話的なバージョン
(defun count-words-defun ()
  "Number of words and symbols in a function definition."
  (interactive)
  (message
   "Counting words and symbols in function definition ... ")
  (let ((count (count-words-in-defun)))
	(cond
	 ((zerop count)
	  (message
	   "The definition does NOT have any words or symbols"))
	 ((= 1 count)
	  (message
	   "The definition has 1 word or symbol."))
	 (t
	  (message
	   "The definition has %d words or symbols." count)))))
