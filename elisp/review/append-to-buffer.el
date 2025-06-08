(defun append-to-buffer (buffer start end)
  ""
  (interactive "Appent to buffer:\nr")
  (let ((oldbuf (current-buffer)))
	(save-excursion
	  (set-buffer (get-buffer-create buffer))
	  (insert-buffer-substring oldbuf start end))))
