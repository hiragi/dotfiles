(defun recursive-lengths-list-many-files (list-of-files)
  "Return list of lengths of each defun in LIST-OF-FILES."
  (if list-of-files ; ºÆµ¢¾ò·ï
	  (append
	   (lengths-list-file
		(expand-file-name (car list-of-files)))
	   (recursive-lengths-list-many-files
		(cdr list-of-files)))))
