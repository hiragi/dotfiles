(setq animals '(gazelle giraffe lion tiger))

(defun reverse-list-with-dolist (list)
  "Using dolist, reverse the order of LIST."
  (let (value) ; make sure list starts empty
	(dolist (element list value)
	  ;; element��list������Ф�����̤�value���֤���
	  (setq value (cons element value)))))

(reverse-list-with-dolist animals)
