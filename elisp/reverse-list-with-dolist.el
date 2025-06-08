(setq animals '(gazelle giraffe lion tiger))

(defun reverse-list-with-dolist (list)
  "Using dolist, reverse the order of LIST."
  (let (value) ; make sure list starts empty
	(dolist (element list value)
	  ;; elementをlistから取り出し、結果をvalueで返す。
	  (setq value (cons element value)))))

(reverse-list-with-dolist animals)
