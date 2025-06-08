(defun copy-region-as-kill (beg end)
  ""
  (interactive "r")
  (if (eq last-command 'kill-region)
	  (kill-append (buffer-substring beg end) (< end beg))
	(kill-new (buffer-substring beg end)))
  (if transient-mark-mode
	  (setq deactivate-mark t))
  nil)
