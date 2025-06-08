(defun lengths-list-many-files (list-of-files)
  ""
  (let (lengths-list)

	(while list-of-files
	  (setq lengths-list
			(append
			 lengths-list

			 (lengths-list-file (expand-file-name (car list-of-files)))))

	  (setq list-of-files (cdr list-of-files)))

	lengths-list))
