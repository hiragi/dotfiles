(add-to-list 'eshell-command-aliases-list (list "ll" "ls -l"))

;; eshellの文字化け防止
(add-hook 'set-language-environment-hook
		  (lambda ()
			(when (equal "ja_JP.UTF-8" (getenv "LANG"))
			  (setq default-process-coding-system '(utf-8 . utf-8))
			  (setq default-file-name-coding-system 'utf-8))
			(when (equal "Japanese" current-language-environment)
			  (setq default-buffer-file-coding-system 'euc-jp))))

(set-language-environment "Japanese")
