(put 'set-goal-column 'disabled nil)
(transient-mark-mode t)
(setq scroll-step 1)
(define-key global-map "\C-z" 'undo)
(define-key global-map "\C-c;" 'comment-region)
(define-key global-map "\C-c:" 'uncomment-region)
;;; 日本語入力切替
(define-key global-map "\C-o" 'toggle-input-method)
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)
(tool-bar-mode 0)
;;; 対応する括弧を光らせる。
(show-paren-mode 0)
;;; ばっくあっぷふぁいるを作らない。
(setq backup-inhibited t)
(setq delete-auto-save-files t)
(set-scroll-bar-mode 'right)
;;; 最終行に必ず一行挿入する
(setq require-final-newline t)
;;; 一行が８０文字異常になった場合は自動改行する
(setq fill-column 80)
(setq-default tab-width 4
              auto-fill-mode t
	      indent-tabs-mode t)
;;; モードラインに時間を表示する
(display-time)

;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;;; ~/.emacs.d/elispにロードパスを通す。
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; まず、install-elispのコマンドを使えるようにします。
(require 'install-elisp)
;;; 次に、Elispファイルをインストールする場所を指定します。
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; Wanderlustの設定。
(load "mime-setup")
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; 全自動インデント
;;(global-set-key "\C-m" 'newline-and-indent)

;; かっこを強調表示する
(show-paren-mode t)

;; 全自動インデント
;; (setq c-auto-newline t)

;; 行番号
(require 'linum)
(global-linum-mode)

;; 指定した行番号にワープ
(global-set-key "\C-x:" 'goto-line)

;; Mewを使うための設定
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;;; パスワードを表示させない為の設定
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; twittering-mode
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; elscreen
;; なぜかできない。
;;(require 'elscreen)

;; navi2ch
(require 'navi2ch)
