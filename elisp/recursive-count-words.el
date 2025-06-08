(defun recursive-count-words (region-end)
  "Number of words between point and REGION-END"

  ;; 1. 再帰条件
  (if (and (< (point) region-end)
		   (re-search-forward "\\w+\\W*" region-end t))

	  ;; 2. 真の動作：再帰呼び出し
	  (1+ (recursive-count-words region-end))

	;; 3. 偽の場合の動作
	0))

(defun count-words-region (beginning end)
  "Print number of words in the region.
Words are defined as at least one word-constituent
character followed by at least one character that is
not a word-constituent.  The buffer's syntax table
determines which characters these are."
  (interactive "r")
  (message "Counting words in region ...")
  (save-excursion
	(goto-char beginning)
	(let ((count (recursive-count-words end)))
	  (cond ((zerop count)
			 (message
			  "The region does NOT have any words.")
			 ((= 1 count)
			  (message
			   "The region has 1 word."))
			 (t
			  (message
			   "The region has %d words." count)))))))

