(defun kill-region (beg end)
  "Kill between point and mark. The text is deleted but saved in the kill ring."
  (interactive "r")
  (condition-case nil
	  (let ((string (delete-and-extract-region beg end)))
		(when string
		  (if (eq last-command 'kill-region)
			  (kill-append string (< end beg))
			(kill-new string))
		  (setq this-command 'kill-region))
		((buffer-read-only text-read-only)
		 (copy-region-as-kill beg end)
		 (if kill-read-only-ok
			 (message "Read only text copied to kill ring")
		   (barf-if-buffer-read-only)
		   (signal 'text-read-only (list (current-buffer))))))))
