(defun keep-three-letter-words (word-list)
  "Keep three letter words in WORD-LIST"
  (cond
   ;; " �ǽ�ˡ��Ƶ�����߾��"
   ((not word-list) nil)

   ;; 2���ܤ�, �Ƶ����¹Ԥ��٤��Ȥ�
   ((eq 3 (length (symbol-name (car word-list))))
	;; combine acted-on element with recursive call on shorter list
	(cons (car word-list) (keep-three-letter-words (cdr word-list))))

   ;; 3���ܤˡ��Ƶ���̵�뤹�٤����ǤΤȤ�
   (t (keep-three-letter-words (cdr word-list)))))

(keep-three-letter-words '(one two three four five six))
