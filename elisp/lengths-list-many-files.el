(defun lengths-list-many-files (list-of-files)
  "Return list of lengths of defuns in LIST-OF-FILES."
  (let (lengths-list)

	;; 判定条件
	(while list-of-files
	  (setq lengths-list
			(append
			 lengths-list

			 ;; 長さのリストを作る
			 (lengths-list-file
			  (expand-file-name (car list-of-files)))))

	  ;; ファイルのリストを短くする
	  (setq list-of-files (cdr list-of-files)))

	;; 長さのリストを最終的な値として返す
	lengths-list))
