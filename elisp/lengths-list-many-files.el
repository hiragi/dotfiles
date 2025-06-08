(defun lengths-list-many-files (list-of-files)
  "Return list of lengths of defuns in LIST-OF-FILES."
  (let (lengths-list)

	;; Ƚ����
	(while list-of-files
	  (setq lengths-list
			(append
			 lengths-list

			 ;; Ĺ���Υꥹ�Ȥ���
			 (lengths-list-file
			  (expand-file-name (car list-of-files)))))

	  ;; �ե�����Υꥹ�Ȥ�û������
	  (setq list-of-files (cdr list-of-files)))

	;; Ĺ���Υꥹ�Ȥ�ǽ�Ū���ͤȤ����֤�
	lengths-list))
