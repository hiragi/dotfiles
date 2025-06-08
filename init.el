;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get-bundle solidity-mode)
(el-get-bundle emacs-w3m)
(el-get-bundle selected)
(el-get-bundle google-this)
(el-get-bundle auto-complete)
(el-get-bundle cider)
(el-get-bundle elscreen)
;; (el-get-bundle anything)
(el-get-bundle ag)
(el-get-bundle key-chord)
(el-get-bundle slim-mode)
(el-get-bundle coffee-mode)
(el-get-bundle yaml-mode)
(el-get-bundle color-theme)
(el-get-bundle json-mode)
(el-get-bundle multi-term)
(el-get-bundle tabbar)
(el-get-bundle undo-tree)
(el-get-bundle yasnippet)
(el-get-bundle popwin)
(el-get-bundle clojure-mode)
(el-get-bundle ruby-mode)
(el-get-bundle sass-mode)
(el-get-bundle php-mode)
(el-get-bundle rainbow-delimiters)
(el-get-bundle web-mode)
(el-get-bundle anzu)
(el-get-bundle smooth-scroll)
(el-get-bundle yascroll)
(el-get-bundle smartparens)
(el-get-bundle inf-ruby)
(el-get-bundle dired+)
(el-get-bundle volatile-highlights)
(el-get-bundle git-gutter)
(el-get-bundle magit)
(el-get-bundle jade-mode)
(el-get-bundle mozc)
(el-get-bundle projectile-rails)
(el-get-bundle inf-ruby)
(el-get-bundle rainbow-mode)
(el-get-bundle typescript-mode)
(el-get-bundle markdown-mode)
(el-get-bundle mmm-mode)
(el-get-bundle edit-server)
(el-get-bundle csharp-mode)
(el-get-bundle request)
(el-get-bundle sesman)
(el-get-bundle parseedn)
(el-get-bundle helm)
(el-get-bundle company)
(el-get-bundle auto-highlight-symbol)
(el-get-bundle ace-link)
(el-get-bundle lsp-mode)
(el-get-bundle graphql)
(el-get-bundle editorconfig)

(load-file "/home/hiroaki/dotfiles/elisp/vue-html-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/edit-indirect.el")
(load-file "/home/hiroaki/dotfiles/elisp/ssass-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/vue-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/persistent-scrath.el")
(load-file "/home/hiroaki/dotfiles/elisp/visual-basic-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/scad-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/scad-preview.el")
(load-file "/home/hiroaki/dotfiles/elisp/string-inflection.el")
(load-file "/home/hiroaki/dotfiles/elisp/googler-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/sqlup-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/lsp-prisma.el")
(load-file "/home/hiroaki/dotfiles/elisp/prisma-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/graphql-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/hy-base.el")
(load-file "/home/hiroaki/dotfiles/elisp/hy-font-lock.el")
(load-file "/home/hiroaki/dotfiles/elisp/hy-shell.el")
(load-file "/home/hiroaki/dotfiles/elisp/hy-jedhy.el")
(load-file "/home/hiroaki/dotfiles/elisp/hy-mode.el")
(load-file "/home/hiroaki/dotfiles/elisp/ripgrep.el")

;; (load-file "/home/hiroaki/dotfiles/elisp/hy-test.el")

(setq inferior-lisp-program "/usr/bin/sbcl")

(require 'cl)
(require 'dired+)
(require 'wdired)
(require 'mozc)
(require 'projectile)
(require 'typescript-mode)
(require 'solidity-mode)
(require 'markdown-mode)
(require 'edit-server)
(require 'scad-mode)
(require 'scad-preview)
(require 'string-inflection)
(require 'request)
(require 'googler-mode)
(require 'helm-net)
(require 'helm-config)
(helm-mode 1)
(require 'hy-mode)

(setq typescript-indent-level 2)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(define-key helm-map (kbd "C-w") 'kill-backward-dwim)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)

(setq helm-lisp-fuzzy-completion t)
(setq helm-locate-fuzzy-match t)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(edit-server-start)
(setq edit-server-new-frame nil)

(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)
(column-number-mode t)
(size-indication-mode t)
(load-theme 'wombat)
(global-anzu-mode +1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(coffee-tab-width 2)
 '(package-selected-packages
   '(epc ripgrep lisp-infection hy-mode graphql-mode graphql json-reformat atomic-chrome helm-eww selected company helm-google sesman parseedn string-inflection scad-mode persistent-scratch edit-indirect vue-html-mode ssass-mode vue-mode http rainbow-mode inflections s projectile-rails mozc nil queue cider))
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   '((cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (cider-cljs-lein-repl . "(do (dev) (go) (cljs-repl))")
     (cider-refresh-after-fn . "reloaded.repl/resume")
     (cider-refresh-before-fn . "reloaded.repl/suspend")))
 '(yas-trigger-key "TAB"))

;; (setq cider-cljs-lein-repl
;;       "(do (require 'figwheel-sidecar.repl-api)
;;            (figwheel-sidecar.repl-api/start-figwheel!)
;;            (figwheel-sidecar.repl-api/cljs-repl))")

(global-set-key (kbd "\C-xrs") 'anzu-query-replace-regexp)
(global-yascroll-bar-mode 1)
(volatile-highlights-mode t)
;(global-linum-mode t)
(scroll-bar-mode -1)
(global-git-gutter-mode +1)
(setq wdired-allow-to-change-permissions t)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "C-o") 'next-window-any-frame)

;; Persist and save/restore *scratch* buffer
(persistent-scratch-setup-default)

(setq browse-url-generic-program "google-chrome")
(setq browse-url-default-browser "google-chrome")
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(setq initial-scratch-message "")

(setq ruby-use-encoding-map nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 起動時メッセージを表示しない
(setq inhibit-startup-message t)

;;; ばっくあっぷふぁいるを作らない。
(setq backup-inhibited t)
(setq delete-auto-save-files t)

;;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;;; モードラインに時間を表示する
(display-time)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; デフォルトの文字コード
;(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info
  "Japanese"
  'coding-priority (cons 'utf-8 (get-language-info "Japanese" 'coding-priority)))

(setq default-input-method "japanese-mozc")
(global-set-key (kbd "C-l") 'toggle-input-method)
(setq mozc-candidate-style 'echo-area)

;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

(setq scroll-step 1)

(defun strip-html ()
  "Remove HTML tags from the current buffer,
   (this will affect the whole buffer regardless of the restrictions in effect)."
  (interactive "*")
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (while (re-search-forward "<[^<]*>" (point-max) t)
    (replace-match "\\1"))
      (goto-char (point-min))
      (replace-string "&copy;" "(c)")
      (goto-char (point-min))
      (replace-string "&amp;" "&")
      (goto-char (point-min))
      (replace-string "&lt;" "<")
      (goto-char (point-min))
      (replace-string "&gt;" ">")
      (goto-char (point-min)))))

(defun insert-current-date () (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun switch-to-scratch ()
  (interactive)
  (if (equal (buffer-name) "scratch.clj")
      (switch-to-previous-buffer)
    (switch-to-buffer "scratch.clj")))

(defun switch-to-terminal ()
  (interactive)
  (if (equal (buffer-name) "*terminal<1>*")
      (switch-to-previous-buffer)
    (switch-to-buffer "*terminal<1>*")))

;; 前の単語を削除
(defun kill-backward-dwim ()
  (interactive)
  (if mark-active
    (kill-region (mark) (point))
    (backward-kill-word 1)))

(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point))

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end))))

(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe
         (lambda()
           (if (string= "shell-mode" major-mode)
               (progn (comint-next-prompt 25535) (yank))
             (progn (goto-char (mark)) (yank) )))))
    (if arg
        (if (= arg 1)
            nil
          (funcall pasteMe))
      (funcall pasteMe))))

(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  ;;(paste-to-mark arg)
  )

(defun file-root-p (filename)
  "Return t if file FILENAME created by root."
  (eq 0 (nth 2 (file-attributes filename))))

(defun th-rename-tramp-buffer ()
  (when (file-remote-p (buffer-file-name))
    (rename-buffer
     (format "%s:%s"
             (file-remote-p (buffer-file-name) 'method)
             (buffer-name)))))

(add-hook 'find-file-hook
          'th-rename-tramp-buffer)

(defadvice find-file (around th-find-file activate)
  "Open FILENAME using tramp's sudo method if it's read-only."
  (if (and (file-root-p (ad-get-arg 0))
           (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File "
                             (ad-get-arg 0)
                             " is read-only.  Open it as root? ")))
      (th-find-file-sudo (ad-get-arg 0))
    ad-do-it))

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

(defun make-a-href (href word)
  ""
  (interactive "shref? \nsword?")
  (insert (format "<a href='%s' target='_blank' rel='nofollow'>%s</a>" href word)))

(defun make-img (src alt)
  ""
  (interactive "ssrc? \nsalt?")
  (insert (format "<img src='%s' alt='%s' />" src alt)))


(defun th-find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))

(keyboard-translate ?\C-h ?\C-?)

(defun forward-word+1 ()
  (interactive)
  (forward-word)
  (forward-char))

(defun backward-word+1 ()
  (interactive)
  (backward-word)
  (backward-char))

(defun kill-word+1 ()
  (interactive)
  (kill-word 1)
  (delete-char 1))

(defun my-save-buffer (arg)
  (interactive "P")
  (progn
    (multiverse-store)
    (save-buffer)))

(global-set-key (kbd "C-x s") 'my-save-buffer)
(global-set-key [(control shift f)] 'forward-word+1)
(global-set-key [(control shift b)] 'backward-word+1)
(global-set-key [(control shift d)] 'kill-word+1)
(global-set-key (kbd "C-o") 'next-window-any-frame)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-2") 'set-mark-command)
(global-set-key (kbd "C-w") 'kill-backward-dwim)
(global-set-key (kbd "M-s") 'switch-to-scratch)
(global-set-key (kbd "C-t") 'switch-to-terminal)
(global-set-key (kbd "C-x RET") 'magit-status)
(global-set-key (kbd "C-c C-c") 'copy-word)
(global-set-key (kbd "C-c r") 'rename-buffer)
(global-set-key (kbd "C-x s") 'swap-screen)
(global-set-key (kbd "C-c ;") 'comment-line)
(global-set-key (kbd "C-c [") 'quoted-insert)
(global-set-key (kbd "C-c g") 'cider-jack-in)

;; align-regexp
(global-set-key (kbd "C-x a") 'align-regexp)

;; 指定した行番号にワープ
(global-set-key "\C-x:" 'goto-line)

;;; パスワードを表示させない為の設定
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)


;; c-mode, c++mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             ;;; K&Rのスタイルをつかう
             (c-set-style "k&r")
             ;;; インデントにはタブを使う
             (setq indent-tabs-mode nil)
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

(split-window-horizontally)

;; ハイライト設定
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
     (:background "Black" t))
    ;; 背景がlightならば背景色を緑に
    (((class color) (background light))
     (:background "Black " t))
    (t (:bold t)))
  "hl-line's my face")

(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; ファイルが#!から始まる場合、+xをつけて保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

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


;; Mode line setup
(setq-default
 mode-line-format
 '(; Position, including warning for 80 columns
   (:propertize "%4l:" face mode-line-position-face)
   (:eval (propertize "%3c" 'face
                      (if (>= (current-column) 80)
                          'mode-line-80col-face
                        'mode-line-position-face)))
   ; emacsclient [default -- keep?]
   mode-line-client
   "  "
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize "RO" 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize "*" 'face 'mode-line-modified-face))
          (t "   ")))
   "    "
   ; directory and buffer/file name
   (:propertize (:eval (shorten-directory default-directory 30))
                face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)
   ; narrow [default -- keep?]
   " %n "
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   "["
   (vc-mode vc-mode)
   "]"
   "  %["
   (:propertize mode-name
                face mode-line-mode-face)
   "%] "
   (:eval (propertize (format-mode-line minor-mode-alist)
                      'face 'mode-line-minor-mode-face))
   (:propertize mode-line-process
                face mode-line-process-face)
   (global-mode-string global-mode-string)
   "    "
   ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
    :foreground "gray80" :background "gray40"
    :inverse-video nil
    :box '(:line-width 6 :color "gray40" :style nil))
(set-face-attribute 'mode-line-inactive nil
    :foreground "gray60" :background "gray20"
    :inverse-video nil
    :box '(:line-width 6 :color "gray20" :style nil))

(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :foreground "#4271ae"
    :box '(:line-width 2 :color "#4271ae"))
(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :foreground "#c82829"
    :background "#ffffff"
    :box '(:line-width 2 :color "#c82829"))
(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#eab700"
    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face
    :family "Menlo" :height 100)
(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :foreground "gray40"
    :height 110)
(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
    :inherit 'mode-line-position-face
    :foreground "black" :background "#eab700")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(require 'elscreen)
;(setq load-path (cons "~/dotfiles/elscreen" load-path))
;(setq elscreen-prefix-key (kbd "\C-t"))
;(define-key elscreen-map "\C-c" 'elscreen-clone)
;(define-key elscreen-map "\C-k" 'elscreen-kill-screen-and-buffers)
;(define-key elscreen-map "\C-t" 'elscreen-toggle)
;(setq elscreen-tab-display-kill-screen nil)

;; anything
;; (require 'anything)
;; (require 'anything-config)
;; ;(add-to-list 'anything-sources 'anything-c-source-emacscommands)
;; (define-key global-map (kbd "C-x ;") 'anything)
;; (global-set-key (kbd "C-x C-b") 'anything-for-files)
;; (global-set-key (kbd "M-y") 'anything-show-kill-ring)
;; (global-set-key (kbd "C-x M-x") 'anything-M-x)
;; ;(global-set-key (kbd "C-r") 'anything-imenu)
;; (define-key anything-map (kbd "C-h") 'delete-backward-char)
;; (define-key global-map (kbd "M-x") 'anything-M-x)
;; (global-set-key (kbd "C-x b") 'anything-for-files)
;; (define-key global-map (kbd "C-c f") 'anything-filelist+)
;; (define-key global-map (kbd "C-c C-f") 'anything-filelist+)

;; ag
(require 'ag)
(setq ag-highlight-search t)
;; (global-set-key (kbd "M-a") 'ag)
(global-set-key (kbd "M-a") 'ripgrep-regexp)

;; key-chord
(key-chord-mode t)
(setq key-chord-two-keys-delay 0.08)
(key-chord-define-global "]\\" 'ag)
(key-chord-define-global "\\1" 'magit)
;; (key-chord-define-global "\\2" 'anything-filelist+)
(key-chord-define-global "\\3" 'swap-screen)

(require 'slim-mode)
(add-to-list 'auto-mode-alist '("\\/slim$" . slim-mode))

(require 'coffee-mode)

(setq coffee-cos-mode t)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
(setq web-mode-attr-indent-offset nil)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq indent-tabs-mode nil)
(setq tab-width 2)
(setq cssm-indent-level 2)
(setq css-mode-indent-level 2)

(defun my-setup-indent ()
  (setq-local css-indent-offset 2))
(add-hook 'prog-mode-hook 'my-setup-indent)

(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "C-u") 'undo-tree-redo)
(global-set-key (kbd "C-x C-u") 'undo-tree-visualize)

(require 'yasnippet)

(setq yasnippet-dirs
      '("~/.emacs.d/snippets"))
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(require 'smartparens-config)
(smartparens-global-mode t)

(require 'rainbow-delimiters)
(rainbow-delimiters-mode t)

(require 'php-mode)

(setq php-mode-force-pear t)
(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

(projectile-global-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(setq js-indent-level 2)

(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'php-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'slim-mode-hook 'rainbow-mode)

(require 'clojure-mode)
(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))


(defun post-esa(id category name body_md wip)
  (request
   (format "https://api.esa.io/v1/teams/catallaxy/posts/%s" (if id id ""))
   :type (if id "PATCH" "POST")
   :data (json-encode-alist
          `(("post" ("name" . ,name) ("body_md" . ,body_md) ("category" . ,category) ("wip" . ,wip))))
   :headers '(("Content-Type" . "application/json") ("Authorization" . "Bearer W-mmm08vjB7lNFkM6Ng60ap3gQ4oBaPdVAUGyXwz6AQ"))
   :parser 'json-read
   :success (function*
             (lambda (&key data &allow-other-keys)
               (message "%S" data)))))

;; (message "I sent: %S" (assoc-default 'form data))))))

;; (post-esa "test" "hoge")

;; Create New Page with Selected Text
(let ((filename "~/dotfiles/scratch.clj"))
  (when (file-exists-p filename)
    (setq initial-buffer-choice filename)))

(defun my-csharp-mode-hook ()
  ;; enable the stuff you want for C# here
  (electric-pair-local-mode 1) ;; Emacs 25
  )
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

(require 'company)
(global-company-mode) ; 全バッファで有効にする
(setq company-transformers '(company-sort-by-backend-importance)) ;; ソート順
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 3) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next) ;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates) ;; C-sで絞り込む
(define-key company-active-map (kbd "C-i") 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map [tab] 'company-complete-selection) ;; TABで候補を設定
(define-key company-active-map (kbd "C-f") 'company-complete-selection) ;; C-fで候補を設定
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete) ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う

;;; マイナーモードとして使いたいならば以下の設定
(setq google-this-keybind (kbd "C-x g"))
(google-this-mode 1)
(require 'google-this)
(setq google-this-location-suffix "co.jp")
;; (with-eval-after-load "google-this"
;;     (defun my:google-this ()
;;       "検索確認をスキップして直接検索実行"
;;       (interactive)
;;       (google-this "ohishi" t)))

(defun my:google-this2 ()
  ""
  (interactive)
  (google-this (current-word) t))

(defun get-selected-text (start end)
  (interactive "r")
    (if (use-region-p)
        (let ((regionp (buffer-substring start end)))
          regionp)))

(defun send-todo-to-my-slack (start end)
  "範囲選択した箇所をSlackに投稿する。"
  (interactive "r")
  (let ((text (get-selected-text start end)))
    (request "https://slack.mitsu-ri.net/api/slack"
      :type "POST"
      :data `(("channel" . "times_hiroaki_ohishi")
              ("username" . "Hiroaki Ohishi")
              ("icon_emoji" . ":hiroaki:")
              ("text" . ,(format ":white_check_mark: %s" text))))))

(require 'selected)
(selected-global-mode 1)
(define-key selected-keymap (kbd "g") 'google-this)
(define-key selected-keymap (kbd "n") 'googler-search)
(define-key selected-keymap (kbd "s") 'send-todo-to-my-slack)

(global-set-key (kbd "C-c n") 'googler-search)
(global-set-key (kbd "C-c C-n") 'googler-search)
(global-set-key (kbd "C-c p") 'browse-url-at-point)
(global-set-key (kbd "C-c C-p") 'browse-url-at-point)

(require 'xml)
(setq helm-google-tld "co.jp")

; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

(require 'w3m-load)
(define-key selected-keymap (kbd "w") 'w3m-search)

;; (require 'atomic-chrome)
;; (atomic-chrome-start-server)

;; (setq atomic-chrome-buffer-open-style 'frame)

;;; ------------------------------------------------------------
;;; 全角英数字を半角英数字に、半角カナを全角に、UTF-8の濁点分離を直す
;; http://d.hatena.ne.jp/nakamura001/20120529/1338305696
;; http://www.sakito.com/2010/05/mac-os-x-normalization.html
;; gist-description: Emacs(Elisp): 全角英数字を半角英数字に、半角カナを全角に、UTF-8の濁点分離を直す。
;; gist-id: 08a752b04107dbc50ef5
;; gist-name: normalize-chars.el
;; gist-private: nil

(require 'ucs-normalize)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8-hfs)
(setq locale-coding-system 'utf-8-hfs)
(defun normalize-chars ()
  "Normarize chars."
  (interactive)
  ;; 選択範囲があればそこを対象にする
  (let (type
        beg
        end)
    (if (region-active-p)
        (progn
          (setq beg (region-beginning))
          (setq end (region-end)))
      (progn
        (setq type (read-string "normalize whole buffer?(y, n): " nil))
        (if (string= type "y")
            (progn
              (setq beg (point-min))
              (setq end (point-max)))
          (error "Error: no target region"))))
    (japanese-zenkaku-region beg end t)
    (japanese-hankaku-region beg end t)
    (ucs-normalize-NFC-region beg end)))

;; 音引、句読点等を除外
;; thx http://d.hatena.ne.jp/khiker/20061014/1160861915
(put-char-code-property ?ー 'ascii nil)
(put-char-code-property ?～ 'ascii nil)
(put-char-code-property ?、 'ascii nil)
(put-char-code-property ?。 'ascii nil)

;; 確実に変換
(put-char-code-property ?， 'jisx0208 ?,)
(put-char-code-property ?． 'jisx0208 ?.)

;; Capitalize keywords in SQL mode
(add-hook 'sql-mode-hook 'sqlup-mode)
;; Capitalize keywords in an interactive session (e.g. psql)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;; Set a global keyword to use sqlup on a region
(global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)

(add-to-list 'sqlup-blacklist "name")
(put 'downcase-region 'disabled nil)

;; (load-file "/home/hiroaki/dotfiles/elisp/copilot.el")
;; (require 'copilot)

;; ;; 使用するnode.jsを指定
;; (setq copilot-node-executable "/home/hiroaki/.nvm/versions/node/v17.9.1/bin/node")

;; ;; プログラムモードの場合、copilot-modeを実行
;; (add-hook 'prog-mode-hook 'copilot-mode)

;; ;; copilot用にキーバインドを設定
;; (defun my-tab ()
;;   (interactive)
;;   (or (copilot-accept-completion)
;;       (company-indent-or-complete-common nil)))

;; (global-set-key (kbd "C-TAB") #'my-tab)
;; (global-set-key (kbd "C-<tab>") #'my-tab)

;; (with-eval-after-load 'company
;;   (define-key company-active-map (kbd "C-TAB") #'my-tab)
;;   (define-key company-active-map (kbd "C-<tab>") #'my-tab)
;;   (define-key company-mode-map (kbd "C-TAB") #'my-tab)
;;   (define-key company-mode-map (kbd "C-<tab>") #'my-tab))
