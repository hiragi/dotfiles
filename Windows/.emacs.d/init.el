(autoload 'insert-date "~/.emacs.d/elisp/insert-date")
(global-set-key "\C-x\C-t" 'insert-date)

;; ���̂��ł��Ȃ�
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/install-elisp.el"))
;;(require 'install-elisp)

;; ������Ȃ����ł��Ȃ�
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

;; Ruby�ۊ� �o����������
;; (require 'ruby-electric)

;; �N�����E�C���h�E���� 2012/05/22
(split-window-vertically)

;; �N����eshell�N�� 2012/05/22
(setq inhibit-startup-screen t)
(other-window 1)
(eshell)

;; �N�����̃t���[���T�C�Y
(setq initial-frame-alist
      (append (list
	       '(width . 128 )
	       '(height . 61)
	       )
	      initial-frame-alist))