(put 'set-goal-column 'disabled nil)
(transient-mark-mode t)
(setq scroll-step 1)
(define-key global-map "\C-z" 'undo)
(define-key global-map "\C-c;" 'comment-region)
(define-key global-map "\C-c:" 'uncomment-region)
(define-key global-map (kbd "C-x C-n") 'split-window-horizontally)


;;; 日本語入力切替
;; (define-key global-map "\C-o" 'toggle-input-method)

;; 漢字だけ文字化けする。
;;(require 'un-define)
(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info
  "Japanese"
  'coding-priority (cons 'utf-8 (get-language-info "Japanese" 'coding-priority)))

;; デフォルトの文字コード
;(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)


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

;;; elispにロードパスを通す。
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; まず、install-elispのコマンドを使えるようにします。
(require 'install-elisp)
;;; 次に、Elispファイルをインストールする場所を指定します。
(setq install-elisp-repository-directory "~/.emacs.d/elisp")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; package.elの設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
  (add-to-list 'package-archives
			   '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  ;; インストールしたパッケージにロードパスを通して読みこむ
  (package-initialize))

;; Wanderlustの設定。
(load "mime-setup")
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; 全自動インデント
;;(global-set-key "\C-m" 'newline-and-indent)

;; 全選択
;;(global-set-key "\C-xa" 'mark-whole-buffer)

;; align-regexp
(global-set-key (kbd "C-x a") 'align-regexp)

;; かっこを強調表示する
(show-paren-mode t)

;; 全自動インデント
;; (setq c-auto-newline t)

;; 行番号
;;(require 'linum)
;;(global-linum-mode)

;; 指定した行番号にワープ
;;(global-set-key "\C-x:" 'goto-line)

;; Mewを使うための設定
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;;; パスワードを表示させない為の設定
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; twittering-mode
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; elscreen
(load "elscreen" "ElScreen" t)

;; navi2ch
(require 'navi2ch)

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; anything
(require 'anything)
(require 'anything-config)
;(add-to-list 'anything-sources 'anything-c-source-emacscommands)
(define-key global-map (kbd "C-l") 'anything)

;; c-mode, c++mode
(add-hook 'c-mode-common-hook
		  '(lambda ()
			 ;;; K&Rのスタイルをつかう
			 (c-set-style "k&r")
			 ;;; インデントにはタブを使う
			 (setq indent-tabs-mode t)
			 ;;; インデント幅
			 (setq c-basic-offset 4)
			 ))

(setq auto-mode-alist
	  ;;; 拡張子とモードの対応
	  (append
	   '(("\\.c$" . c-mode))
	   '(("\\.h$" . c-mode))
	   '(("\\.cpp$" . c++-mode))
	   '(("\\.cc$" . c++-mode))
	   auto-mode-alist))

;; 自動セーブを無効にする設定
;;(setq make-backup-files nil)
;;(setq auto-save-default nil)

;; google日本語入力
(require 'mozc)
(set-language-environment 'utf-8)
(setq default-input-method "japanese-mozc")

;; 起動時メッセージを表示しない
(setq inhibit-startup-message t)

;; 2012/02/05
;; php-mode
(load-library "php-mode")
(require 'php-mode)

(add-hook 'php-mode-user-hook
		  '(lambda()
			 (setq tab-width 2)
			 (setq indent-tabs-mode nil))
		  )

;; 2012/02/06
(add-hook 'ruby-mode-hook
		  '(lambda ()
			 (setq tab-width 2)
			 (setq indent-tabs-mode 't)
			 (setq ruby-indent-level tab-width)
))

;; endに対応する行のハイライト
(when (require 'ruby-block nil t)
  (setq ruby-block-highlight-toggle t))

;; */*/*/*--- 2012/06/23 10:43 ---*/*/*/*
(setq ruby-deep-indent-paren-style nil)


;; 2012/03/20
(global-set-key "\M-g" 'goto-line)

;; 2012/04/14
;; vbnet-modeの読み込み
(require 'vbnet-mode)
(add-to-list 'auto-mode-alist '("\\.vbs$" . vbnet-mode)) ; .vbsに関連付け
;; auto-completeの対象にする
(add-to-list 'ac-modes 'vbnet-mode)

;; ハイライトがうまくいかない？
(load-library "visual-basic-mode")
(add-to-list 'auto-mode-alist '("\\.\\(frm\\|bas\\|cls\\|vbs\\)$" . visual-basic-mode))

;; 2012/05/20 Added

(require 'hiragi_test)
(global-set-key "\C-r" 'hiragi_test)

;; (18:03 2012/05/22)
(require 'insert-time-date)
(global-set-key "\C-x\C-t" 'insert-time-date)

(split-window-horizontally)

;; 起動時にeshell起動
(other-window 1)
;;(add-hook 'after-init-hook (lambda() (eshell)))
(add-hook 'after-init-hook (lambda () (multi-term)))
(other-window 0)
(add-hook 'after-init-hook (lambda () (slime)))

;; eshell設定ファイル
(when (locate-library "eshell")
  (setq eshell-directory-name (expand-file-name "~/.eshell/init.el"))

  (load "~/.eshell/init.el")
)

;; Todoリストを作った (2012/05/22 20:29)
(require 'todo)
(global-set-key "\C-xt" 'todo) 

;; Open maze argorithm
(require 'maze)

;; カッコ補完 
;; やっぱやめた
;(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;(setq skeleton-pair 1)

;; Open .emacs file
(require 'open-emacs-setting-file)

;; duplicate-line
(require 'duplicate-line)
(global-set-key "\C-x\C-y" 'duplicate-line)

;; mew draft mode
(global-set-key "\C-xm" 'mew-send)

;; */*/*/*--- 2012/06/02 13:06 ---*/*/*/*
(setq mail-aliases t)

;; */*/*/*--- 2012/06/02 13:10 ---*/*/*/*
(global-set-key "\C-cw" 'compare-windows)

;; */*/*/*--- 2012/06/22 02:59 ---*/*/*/*
;; 起動時にメニューバーを消す
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))



;; scratch buffer 以外をまとめてタブに表示する
(require 'cl) ; for emacs-22.0.50 on Vine Linux 4.2
 (when (require 'tabbar nil t)
    (setq tabbar-buffer-groups-function
            (lambda (b) (list "All Buffers")))
    (setq tabbar-buffer-list-function
          (lambda ()
            (remove-if
             (lambda(buffer)
               (find (aref (buffer-name buffer) 0) " *"))
             (buffer-list))))
    (tabbar-mode))

;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
  (dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
    (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
  (defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
    `(defun ,name (arg)
       (interactive "P")
       ,do-always       (if (equal nil arg)
                             ,on-no-prefix         ,on-prefix)))
  (defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
  (defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
  (global-set-key [(control tab)] 'shk-tabbar-next)
  (global-set-key [(control shift tab)] 'shk-tabbar-prev)

;; 外観変更
 (set-face-attribute
   'tabbar-default-face nil   :background "gray60")
  (set-face-attribute   'tabbar-unselected-face nil   :background "gray85"
   :foreground "gray30"
   :box nil)
  (set-face-attribute   'tabbar-selected-face nil   :background "#f2f2f6"
   :foreground "black"
   :box nil)
  (set-face-attribute   'tabbar-button-face nil   :box '(:line-width 1 :color "gray72" :style released-button))
  (set-face-attribute   'tabbar-separator-face nil   :height 0.7)

;; F4 で tabbar-mode(global-set-key [f4] 'tabbar-mode)


;; "C-t" でウィンドウを切り替える。初期値はtranspose-chars
;; (define-key global-map (kbd "C-t") 'other-window)

(column-number-mode t)
(size-indication-mode t)

;; リージョン内の行数と文字列をモードラインに表示する
(require 'count-lines-and-chars)
(add-to-list 'default-mode-line-format
			 '(:eval (count-lines-and-chars)))

;; ハイライト設定
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
	 (:background "NavyBlue" t))
	;; 背景がlightならば背景色を緑に
	(((class color) (background light))
	 (:background "LightGoldenrodYellow" t))
	(t (:bold t)))
  "hl-line's my face")

(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; ファイルが#!から始まる場合、+xをつけて保存する
(add-hook 'after-save-hook
		  'executable-make-buffer-file-executable-if-script-p)

;; emacs-lisp-modeのフックをセット
(add-hook 'emacs-lisp-mode-hook
		  '(lambda ()
			 (when (require 'eldoc nil t)
			   (setq eldoc-idle-delay 0.2)
			   (setq eldoc-echo-area-use-multiline-p t)
			   (turn-on-eldoc-mode))))

;; eval-last-sexp変更
(define-key global-map (kbd "C-x j") 'eval-last-sexp)

;; redo+の設定
(when (require 'redo+ nil t)
  ;; C-u にRedoを割り当てる
  (global-set-key (kbd "C-u") 'redo))

;; color-moccurの設定
(when (require 'color-moccur nil t)
  ;; M-oにoccur-by-occurを割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りでAND検索
  (setq occur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; Migemoを利用できる環境であればMigemoを使う
  (when (and (executable-find "cmigemo")
			 (require 'migemo nil t))
	(setq moccur-use-migemo t)))

;; moccur-editの設定
(require 'moccur-edit nil t)

(require 'org-install)


;; Ruby用Flymake
(require 'flymake)
(defun flymake-ruby-init ()
  (list "ruby" (list "-c" (flymake-init-create-temp-buffer-copy
						   'flymake-create-temp-inplace))))
(add-to-list 'flymake-allowed-file-name-masks
			 '("\\.rb\\'" flymake-ruby-init))
(add-to-list 'flymake-err-line-patterns
			 '("\\.*\\):(\\[0-9]+\\)): \\(.*\\)" 1 2 nil 3))


;; SQLサーバ接続
(setq sql-user "root"
	  sql-database "information_schema"
	  sql-server "localhost"
	  sql-product "mysql")

;; GitフロントエンドEggの設定
(when (executable-find "git")
  (require 'egg nil t))

(when (require 'multi-term nil t)
  (setq multi-term-program "/usr/bin/zsh"))

;; replace-string
(global-set-key (kbd "\C-xrs") 'replace-string)

;; tuareg-mode
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)

;; tag-splitter
(require 'tag-splitter)

;; 楽しいScheme Life
(setq scheme-program-name "gosh -i")

(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))

(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)


(defun swap-screen ()
  "Swap two screen, leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
		(nextbuf (window-buffer (next-window))))
	(set-window-buffer (next-window) (window-buffer))
	(set-window-buffer thiswin nextbuf)))

(defun swap-screen-with-cursor ()
  "Swap two screen, with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
		(thisbuf (window-buffer)))
	(other-window 1)
	(set-window-buffer thiswind (window-buffer))
	(set-window-buffer (selected-window) thisbuf)))

;; */*/*/*--- 2012/10/19 01:29 ---*/*/*/*
(add-to-list 'load-path "~/.emacs.d/slime-2012-12-31")
;(setq inferior-lisp-program "clisp")
(setq inferior-lisp-program "sbcl")
(require 'slime)
(slime-setup)

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; */*/*/*--- 2012/10/23 16:03 ---*/*/*/*
(require 'magit)

(require 'sudoku)

(setq-default tab-width 4 indent-tabs-mode nil)

(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
