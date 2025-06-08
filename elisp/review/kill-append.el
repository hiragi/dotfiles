(defun kill-append (string before-p)
  ""
  (kill-new (if before-p
				(concat string (car kill-ring))
			  (concat (car kill-ring) string))
			t))
