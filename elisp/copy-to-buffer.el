(defun copy-to-buffer ()
  ""
  (interactive "BCopy to buffer: \nr")
  (let ((oldbuf (current-buffer)))
	(save-excursion
	  (set-buffer (get-buffer-create buffer))
	  (erase-buffer)
	  (save-excursion
		(insert-buffer-substring oldbuf start end)))))
