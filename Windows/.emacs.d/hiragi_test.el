(defun insert-date ()
  "Insert the current time according to insert-time-format."
  (interactive)
  (insert (format-time-string "%Y/%m/%d" (current-time)))
)