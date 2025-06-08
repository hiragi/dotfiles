(defun files-in-below-directory (directory)
  ""
  (interactive "DDirectory name: ")
  (let (el-files-list
		(current-directory-list
		 (directory-files-and-attributes directory t)))
	(while current-directory-list
	  (cond
	   ((equal ".el" (substring (car (car current-directory-list)) -3))
		(setq el-files-list
			  (cond (car (car current-directory-list)) el-files-list)))
	   ((eq t (car (cdr (car (current-directory-list))))
			(if
				(equal (or "." "..")
					   (substring (car (car current-directory-list)) -1))
				()
			  (setq el-files-list
					(append
					 (files-in-below-directory
					  (car (car current-directory-list)))
					 el-files-list))))))
	  (setq current-directory-list (cdr current-directory-list)))
	el-files-list))
