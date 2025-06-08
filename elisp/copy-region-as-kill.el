(defun copy-region-as-kill (beg end)
  "Save the region as if killed, but don't kill it.
In Transient Mark mode, deactivate the mark.
If 'interprogram-cut-function' is non-nil, also save
the text for a window system cut and paste."
  (interactive "r")
  (if (eq last-command 'kill-region)
	  (kill-append (buffer-substring beg end) (< end beg))
	(kill-new (buffer-substring beg end)))
  (if transient-mark-mode
	  (setq deactivate-mark t))
  nil)
