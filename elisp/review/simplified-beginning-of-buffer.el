(defun simplified-beginning-of-buffer ()
  (interactive)
  (push-mark)
  (goto-mark (point-min)))
