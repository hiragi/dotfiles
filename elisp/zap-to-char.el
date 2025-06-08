(defun zap-to-char (arg char)
  "Kill up to and including ARG'th occurrence of CHAR.
Goes backward if ARG is negative; error if CHAR not found."
  (interactive "*p\ncZap to char: ")
  (kill-region (point)
			   (progn
				 (search-forward
				  (char-to-string char) nil nil arg)
				 (point))))
