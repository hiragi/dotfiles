(defun defuns-per-range (sorted-lengths top-of-ranges)
  ;; SORTED-LENGTHS defuns in each TOP-OF-RANGES range."
  (let ((top-of-range (car top-of-ranges))
		(number-within-range 0)
		defuns-per-range-list)

	;; ��¦�Υ롼��
	(while top-of-ranges

	  ;; ��¦�Υ롼��
	  (while (and
			  ;; ����Ƚ��ˤϿ���ɬ��
			  (car sorted-lengths)
			  (< (car sorted-lengths) top-of-range))
		;; ���ߤ��ϰ���ˤ������ǿ��������
		(setq number-within-range (1+ number-within-range))
		(setq sorted-lengths (cdr sorted-lengths)))

	  ;; ��¦�Υ롼�פ����򽪤��
	  (setq defuns-per-range-list
			(cons number-within-range defuns-per-range-list))
	  (setq number-within-range 0) ; �����󥿤򣰤ˤ���

	  ;; �Ĥ����ϰϤذ�ư
	  (setq top-of-ranges (cdr top-of-ranges))
	  ;; �Ĥ����ϰϤκ����ͤ����ꤹ��
	  (setq top-of-range (car top-of-ranges)))

	;; ��¦�Υ롼�פ�ȴ���ơ�������ϰϤ���
    ;;   �礭������θĿ��������
	(setq defuns-per-range-list
		  (cons
		   (lengths sorted-lengths)
		   defuns-per-range-list))

	;; ���ϰϤ�����θĿ��Υꥹ�Ȥ��֤�
    ;;   �Ǿ��������ν�
	(nreverse defuns-per-range-list)))
