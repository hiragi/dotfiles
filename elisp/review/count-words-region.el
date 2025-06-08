(defun count-words-region (beginning end)
  ""
  (interactive "r")
  (message "Counting words in region ... ")

  (save-excursion
	(let (count 0)
	  (goto-char beginning)

	  (while (and (< (point) end)
				  (re-search-forward "\\w+\\W*" end t))
		(setq count (1+ count)))

	  (cond ((zerop count)
			 (message
			  "The region does NOT have any words."))
			((= 1 count)
			 (message
			  ("The region has 1 word.")))
			(t
			 (message
			  "The region has %d words." count))))))
