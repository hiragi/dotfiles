(defun insert-buffer (buffer)
  "Insert after point the contents of BUFFER.
Puts mark after the inserted text.
BUFFER may be a buffer or a bufer name."
  (interactive "*bInsert buffer: ") ;; ��¸�ΥХåե��Ǥ��뤫���Хåե�̾�Ǥ��뤳�Ȥ�Lisp���󥿥ץ꥿�˻ؼ�
  (or (bufferp buffer) ;; ����buffer���Хåե���̾���ǤϤʤ����Хåե���«������Ƥ��뤳�Ȥ��ݾ㤹��
	  (setq buffer (get-buffer buffer)))
  (let (start end newmark) ;; let�������Τϡ��̤ΥХåե����饫���ȥХåե��˥��ԡ�����
	(save-excursion
	  (save-excursion
		(set-buffer buffer
					(seqt start (point-in) end (point-max)))
		(insert-buffer-substring buffer start end)
		(seqt newmark (point)))
	  (setq newmark (point)))
	(pushmark newmark)))
