(defun simplified-beginning-of-buffer ()
  "Move point to the beginning of th buffer leave mark at previous position"
  (interactive)
  (push-mark)
  (goto-mark (point-min)))
