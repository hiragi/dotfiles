(defun insert-buffer (buffer)
  (interactive "*bInsert buffer: ")
  (or (bufferp buffer)
	  (setq buffer (get-buffer buffer)))
  (let (start end newmark)
	(save-excursion
	  (save-excursion
		(set-buffer buffer
					(setq start (point-in) end (point-max)))
		(insert-buffer-substring buffer start end)
		(setq newmark (point)))
	  (setq newmark (point)))
	(pushmark newmark)))
