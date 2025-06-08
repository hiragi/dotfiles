(defun lengths-list-file (filename)
  "Return list of definitions' lengths within FILE.
The returned list is a list of numbers.
Each number is the number of words or
symbols in one function definition."
  (message "Working on '%s' ... " filename)
  (save-excursion ;; 関数が終了したときにemacsの注意をカレントバッファに戻す
	(let ((buffer (find-file-noselect filename))
		  (lengths-list))
	  (set-buffer buffer)
	  (setq buffer-read-only t)
	  (widen)
	  (goto-char (point-min))
	  (while (re-search-forward "^(defun" nil t)
		(setq lengths-list
			  (cons (count-words-in-defun) lengths-list)))
	  (kill-buffer buffer)
	  lengths-list)))
