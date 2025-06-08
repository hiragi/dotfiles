(defun recursive-lengths-list-many-files (list-of-files)
  ""
  (if list-of-files
	  (append
	   (lengths-list-file
		(expand-file-name (car list-of-files)))
	   (recursive-lengths-list-many-files
		(cdr list-of-files)))))
