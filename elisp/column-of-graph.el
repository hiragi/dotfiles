(defun column-of-graph (max-graph-height actual-height)
  "Returns MAX-GRAPH-HEIGHT strings; ACTUAL-HEIGHT are graph-symbols.

The graph-symbols are contiguous entries at the end
of the list.
The list will be inserted as one column of a graph.
The strings are either graph-blank or graph-symbol."

  (let ((insert-list nil)
		(number-of-top-blanks
		 (- max-graph-height actual-height)))

	;; graph-symbolsを埋め込む
	(while (> actual-height 0)
	  (setq insert-list (cons graph-symbol insert-list))
	  (setq actual-height (1- actual-height)))

	;; graph-symbolsを埋め込む
	(while (> number-of-top-blanks 0)
	  (setq insert-list (cons graph-blank insert-list))
	  (setq number-of-top-blanks
			(1- number-of-top-blanks)))

	;; リスト全体を返す
	insert-list))

