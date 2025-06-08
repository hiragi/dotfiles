;;; Yasnippet
;; (package-install 'yasnippet)

(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
(require 'yasnippet)

(custom-set-variables '(yas-trigger-key "TAB"))

(custom-set-variables
 '(yas/snippet-dirs '("~/.emacs.d/snippets")))
(yas-global-mode t)

;; use "M-o" to expand, not "TAB"
(define-key yas-minor-mode-map (kbd "M-o") 'yas-expand)

;; anything interface
(eval-after-load "anything-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
              (selected (anything-other-buffer
                         `(((name . ,(format "%s" prompt))
                            (candidates . names)
                            (action . (("Insert snippet" . (lambda (arg) arg))))))
                         "*anything yas/prompt*")))
         (if selected
             (let ((n (position selected names :test 'equal)))
               (nth n choices))
           (signal 'quit "user quit!"))))
     (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
     (define-key anything-command-map (kbd "y") 'yas/insert-snippet)))

;; snippet-mode for *.yasnippet files
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))
