(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ...")

  ;; 1. 適切な条件を設定する
  (save-excursion
	(let ((count 0))
	  (goto-char beginning)

	  ;; 2. while loop
	  (while (and (< (point) end)
				  (re-search-forword "\\w+\\W*" end t))
		(setq count (1+ count)))

	  ;; 2. ユーザにメッセージを与える
	  (cond ((zerop count)
			 (message
			  "The region does NOT have any words."))
			((= 1 count)
			 (message
			  "The region has 1 word."))
			(t
			 (message
			  "The region has %d words." count))))))
