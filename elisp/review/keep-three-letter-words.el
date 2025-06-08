(defun keep-three-letter-words (word-list)
  ""
  (cond
   ((not word-list) nil)

   ((eq 3 (length (symbol-name (car word-list))))
	(cons (car word-list) (keep-three-letter-words (cdr word-list))))

   (t (keep-three-letter-words (cdr word-list)))))

(keep-three-letter-words '(one two three four five six))
