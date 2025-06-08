(setq animals '(gazelle giraffe lion tiger))

(defun print-elements-recursively (list)
  "Print each element of LIST on a line of its own. Uses recursion."
  (if list  ; �Ƶ����
	  (progn
		(print (car list)) ; ����
		(print-elements-recursively ; �Ƶ��ƤӽФ�
		 (cdr list))))) ; ���ʼ�

(print-elements-recursively animals)
