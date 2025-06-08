(defun mark-whole-buffer ()
  "Put point at beginning and mark at end of buffer"
  (interactive)
  (push-mark (point))
  (push-mark (point-max))
  (goto-char (point-min)))
