;; doubleという関数を定義

(defun double (x) (* x 2))

;; 関数を表現するには、lambda式を使う
(lambda (x) (* x 2))
;; doubleと同じ関数を作る
((lambda (x) (* x 2)) 2)
