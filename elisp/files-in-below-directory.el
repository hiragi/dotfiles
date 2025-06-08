(defun files-in-below-directory (directory)
  "List the .el files in DIRECTORY and in its sub-directories."
  ;; この関数は非対話的に使われるけれども
  ;; 対話的に使えるとテストに便利である．
  ;; ディレクトリは "/usr/local/share/emacs/21.0.100/lisp/"
  ;; のような名前である．
  (interactive "DDirectory name: ")
  (let (el-files-list
		(current-directory-list
		 (directory-files-and-attributes directory t)))
	;; カレントディレクトリでwhile
	(while current-directory-list
	  (cond
	   ;; ファイル名が `.el' で終わるか確認する
       ;; もしそうなら，リストに追加する．
	   ((equal ".el" (substring (car (car current-directory-list)) -3))
		(setq el-files-list
			  (cons (car (car current-directory-list)) el-files-list)))
	   ;; ファイル名がディレクトリであるか確認する
	   ((eq t (car (cdr (car (current-directory-list))))
			;; 無視するか再帰するか決定する
			(if
				(equal (or "." "..")
					   (substring (car (car current-directory-list)) -1))
				;; ファイル名がカレントディレクトリか
				;; 親ディレクトリであれば何もしない
				()
			  ;; そうでなければ，ディレクトリを下り，
			  ;; 処理を繰り返す
			  (setq el-files-list
					(append
					 (files-in-below-directory
					  (car (car current-directory-list)))
					 el-files-list))))))
	  ;; リストの次へファイルへ移る．リストを短くすることで
      ;; while ループは結局終わりがくる．
	  (setq current-directory-list (cdr current-directory-list)))
	;; ファイル名を返す
	el-files-list))
