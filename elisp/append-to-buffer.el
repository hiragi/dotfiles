(defun append-to-buffer (buffer start end)
  "Appnd to specified buffer the text of the region.
It is inserted into that buffer before its point."
  (interactive "Append to buffer:\nr")
  (let ((oldbuf (current-buffer)))
	(save-excursion
	  (set-buffer (get-buffer-create buffer))
	  (insert-buffer-substring oldbuf start end))))
