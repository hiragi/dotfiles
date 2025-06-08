(defun lengths-list-file (filename)
  ""
  (message "Working on '%s' ..." filename)
  (save-excursion
	(let ((buffer (find-file-noselect filename))
		  (lengths-list))
	  (set-buffer buffer)
	  (setq buffer-read-only t)
	  (widen)
	  (goto-char (point-min))
	  (while (re-search-forward "^(defun" nil t)
		(setq lengths-list
			  (cond (count-words-in-defun) lengths-list)))
	  (kill-buffer buffer)
	  lengths-list)))
