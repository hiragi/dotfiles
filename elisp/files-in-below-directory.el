(defun files-in-below-directory (directory)
  "List the .el files in DIRECTORY and in its sub-directories."
  ;; ���δؿ���������Ū�˻Ȥ��뤱��ɤ�
  ;; ����Ū�˻Ȥ���ȥƥ��Ȥ������Ǥ��롥
  ;; �ǥ��쥯�ȥ�� "/usr/local/share/emacs/21.0.100/lisp/"
  ;; �Τ褦��̾���Ǥ��롥
  (interactive "DDirectory name: ")
  (let (el-files-list
		(current-directory-list
		 (directory-files-and-attributes directory t)))
	;; �����ȥǥ��쥯�ȥ��while
	(while current-directory-list
	  (cond
	   ;; �ե�����̾�� `.el' �ǽ���뤫��ǧ����
       ;; �⤷�����ʤ顤�ꥹ�Ȥ��ɲä��롥
	   ((equal ".el" (substring (car (car current-directory-list)) -3))
		(setq el-files-list
			  (cons (car (car current-directory-list)) el-files-list)))
	   ;; �ե�����̾���ǥ��쥯�ȥ�Ǥ��뤫��ǧ����
	   ((eq t (car (cdr (car (current-directory-list))))
			;; ̵�뤹�뤫�Ƶ����뤫���ꤹ��
			(if
				(equal (or "." "..")
					   (substring (car (car current-directory-list)) -1))
				;; �ե�����̾�������ȥǥ��쥯�ȥ꤫
				;; �ƥǥ��쥯�ȥ�Ǥ���в��⤷�ʤ�
				()
			  ;; �����Ǥʤ���С��ǥ��쥯�ȥ�򲼤ꡤ
			  ;; �����򷫤��֤�
			  (setq el-files-list
					(append
					 (files-in-below-directory
					  (car (car current-directory-list)))
					 el-files-list))))))
	  ;; �ꥹ�Ȥμ��إե�����ذܤ롥�ꥹ�Ȥ�û�����뤳�Ȥ�
      ;; while �롼�פϷ�ɽ���꤬���롥
	  (setq current-directory-list (cdr current-directory-list)))
	;; �ե�����̾���֤�
	el-files-list))
