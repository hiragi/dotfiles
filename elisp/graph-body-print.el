(defun graph-body-print (numbers-list)
  "Print a bar graph of the NUMBERS-LIST.
The numbers-list consists of the Y-axis values."
  (let ((height (apply 'max numbers-list))
		(symbol-width (length graph-blank))
		from-position)

	(while numbers-list
	  (setq from-position (point))
	  (insert-rectangle
	   (column-of-graph height (car numbers-list)))
	  (goto-char from-position)
	  (forward-char symbol-width)
	  ;; ����ऴ�Ȥ˥���դ�����
	  (sit-for 0)
	  (setq numbers-list (cdr numbers-list)))
	;; ��ʿ���Υ�٥��Ѥ˥ݥ���Ȥ��֤�
	(forward-line height)
	(insert "\n")
	))

