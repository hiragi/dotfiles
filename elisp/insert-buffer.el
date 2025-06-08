(defun insert-buffer (buffer)
  "Insert after point the contents of BUFFER.
Puts mark after the inserted text.
BUFFER may be a buffer or a bufer name."
  (interactive "*bInsert buffer: ") ;; 既存のバッファであるか、バッファ名であることをLispインタプリタに指示
  (or (bufferp buffer) ;; 引数bufferがバッファの名前ではなく、バッファに束縛されていることを保障する
	  (setq buffer (get-buffer buffer)))
  (let (start end newmark) ;; let式の本体は、別のバッファからカレントバッファにコピーする
	(save-excursion
	  (save-excursion
		(set-buffer buffer
					(seqt start (point-in) end (point-max)))
		(insert-buffer-substring buffer start end)
		(seqt newmark (point)))
	  (setq newmark (point)))
	(pushmark newmark)))
