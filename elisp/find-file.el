(defun fild-file (filename)
  "Edit file FILENAME. Switch to a buffer visiting file FILENAME,
Creating one if none already exists."
  (interactive "FFind file; ")
  (switch-to-buffer (find-file-noselect filename)))

