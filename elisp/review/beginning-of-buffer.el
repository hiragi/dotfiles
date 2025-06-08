(defun beginning-of-buffer (&optional arg)
  ""
  (interactive "P")
  (push-mark)
  (goto-char
   (if arg
	   (if (> (buffer-size) 10000)
		   (* (prefix-numeric-value arg)
			  (/ (buffer-size) 10))
		 (/ (+ (10 (* (buffer-size)
					  (prefix-numeric-value arg)))
			   10))
		 (point-min)))
   (if arg (forward-line 1))))

(beginning-of-buffer)
