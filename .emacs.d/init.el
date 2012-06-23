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

;;; elispにロードパスを通す。
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;; まず、install-elispのコマンドを使えるようにします。
(require 'install-elisp)
;;; 次に、Elispファイルをインストールする場所を指定します。
(setq install-elisp-repository-directory "./elisp")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; Wanderlustの設定。
(load "mime-setup")
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; 全自動インデント
;;(global-set-key "\C-m" 'newline-and-indent)

;; 全選択
(global-set-key "\C-xa" 'mark-whole-buffer)

;; かっこを強調表示する
(show-paren-mode t)

;; 全自動インデント
;; (setq c-auto-newline t)

;; 行番号
(require 'linum)
(global-linum-mode)

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
(setq auto-install-directory "./elisp")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; anything
(require 'anything)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacscommands)
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
(setq make-backup-files nil)
(setq auto-save-default nil)

;; google日本語入力
(require 'mozc)
(set-language-environment "japanese")
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
(add-hook 'after-init-hook (lambda() (eshell)))

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
;;(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;;(setq skeleton-pair 1)

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

;; デフォルトの文字コード
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
