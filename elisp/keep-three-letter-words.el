(defun keep-three-letter-words (word-list)
  "Keep three letter words in WORD-LIST"
  (cond
   ;; " 最初に、再帰条件：停止条件"
   ((not word-list) nil)

   ;; 2番目に, 再帰条件：実行すべきとき
   ((eq 3 (length (symbol-name (car word-list))))
	;; combine acted-on element with recursive call on shorter list
	(cons (car word-list) (keep-three-letter-words (cdr word-list))))

   ;; 3番目に、再帰条件：無視すべき要素のとき
   (t (keep-three-letter-words (cdr word-list)))))

(keep-three-letter-words '(one two three four five six))
