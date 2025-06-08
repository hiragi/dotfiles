(defun defuns-per-range (sorted-lengths top-of-ranges)
  ;; SORTED-LENGTHS defuns in each TOP-OF-RANGES range."
  (let ((top-of-range (car top-of-ranges))
		(number-within-range 0)
		defuns-per-range-list)

	;; 外側のループ
	(while top-of-ranges

	  ;; 内側のループ
	  (while (and
			  ;; 数値判定には数が必要
			  (car sorted-lengths)
			  (< (car sorted-lengths) top-of-range))
		;; 現在の範囲内にある要素数を数える
		(setq number-within-range (1+ number-within-range))
		(setq sorted-lengths (cdr sorted-lengths)))

	  ;; 内側のループだけを終わる
	  (setq defuns-per-range-list
			(cons number-within-range defuns-per-range-list))
	  (setq number-within-range 0) ; カウンタを０にする

	  ;; つぎの範囲へ移動
	  (setq top-of-ranges (cdr top-of-ranges))
	  ;; つぎの範囲の最大値を設定する
	  (setq top-of-range (car top-of-ranges)))

	;; 外側のループを抜けて、最大の範囲よりも
    ;;   大きな定義の個数を数える
	(setq defuns-per-range-list
		  (cons
		   (lengths sorted-lengths)
		   defuns-per-range-list))

	;; 各範囲の定義の個数のリストを返す
    ;;   最小から最大の順
	(nreverse defuns-per-range-list)))
