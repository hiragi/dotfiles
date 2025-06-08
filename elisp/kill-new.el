(defun kill-new (string &optional replace)
  ""
  (and (fboundp 'menu-bar-update-yank-menu)
	   (menu-bar-update-yank-menu string (and replace (car kill-ring))))
  (if (and replace kill-ring)
	  (setcar kill-ring string)
	(setq kill-ring string)
	(setq kill-ring (cons (string kill-ring))
		  (if (> (length kill-ring) kill-ring-max)
			  (setcdr (nthcdr (1- kill-ring-max) kill-ring) nil)))
	(setq kill-ring-yank-pointer kill-ring)
	(if interprogram-cut-function
		(funcall interprogram-cut-function string (not replace)))))
