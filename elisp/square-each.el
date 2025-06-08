(defun square-each (numbers-list)
  "Square each of a NUMBERS LIST, recursively."
  (if (not numbers-list) ; �Ƶ����
	  nil
	(cons
	 (* (car numbers-list) (car numbers-list))
	 (square-each (cdr numbers-list))))); ���ʼ�

(square-each '(1 2 3))
