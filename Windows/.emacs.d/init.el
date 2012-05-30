(autoload 'insert-date "~/.emacs.d/elisp/insert-date")
(global-set-key "\C-x\C-t" 'insert-date)

;; 何故かできない
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/install-elisp.el"))
;;(require 'install-elisp)

;; これもなぜかできない
;; anything
(add-to-list 'load-path (expand-file-name "/.emacs.d/elisp"))
;; (require 'anything)

;; mark-whole-buffer
(global-set-key "\C-xa" 'mark-whole-buffer)

;; auto-install
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install")
(auto-install-compatibility-setup)

;; display line number
(require 'linum)
(global-linum-mode)

;; display file name on title bar
(setq frame-title-format (format "Emacs@%s : %%f" (system-name)))

;; not display tool bar
(tool-bar-mode 0)

;; change undo key bind
(global-set-key "\C-z" 'undo)

;; Ruby保管 出来無いっぽ
;; (require 'ruby-electric)

;; 起動時うぃんどう分割
(add-hook 'after-init-hook (lambda()
							      (setq w(selected-window))
								       (setq w2(split-window w (- (window-height w) 20)))
									        (select-window w2)
											     (eshell)
												      (select-window w)))

;; 起動時の画面はいらない
(setq inhibit-startup-message t)

;; 起動時のsize, position, font
(setq initial-frame-alist
      (append (list
			          '(width . 80)
					         '(height . 60)
							        '(top . 0)
									       '(left . 0)
										          )
			        initial-frame-alist))
(setq default-frame-alist initial-frame-alist)
