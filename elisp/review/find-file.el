(defun find-file (filename)
  ""
  (interactive "FFind file: ")
  (switch-to-buffer (find-file-noselect filename)))
