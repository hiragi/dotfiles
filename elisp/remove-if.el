(remove-if #'evenp '(1 2 3 4 5 6 7 8 9))

;; ������remove-if�ε�ǽ�����Ǥ�����򼨤���
(defun remove-if (fn lst)
  (if (null lst)
	  nil
	(if (funcall fn (car lst))
		(our-remove-if fn (cdr lst))
	  (cons (car lst) (out-remove-if fn (cdr lst))))))
