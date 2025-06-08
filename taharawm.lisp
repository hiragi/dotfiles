… ;; -*- mode: common-lisp; -*-
;; debian=sbcl
;;
;; LOADRC
;;   Function: Reload the @file{~/.stumpwmrc} file.
;;
;; show-window-properties で class, instance, type, role, title が表示される。

(in-package :stumpwm-user)


;; (setq *debug-level* 999)
;; (setq *debug-stream* (open "/home/ancient/tmp/stumpwm.log"
;;                            :direction :output
;;                            :if-does-not-exist :create
;;                            :if-exists :append
;;                            :external-format :utf-8))


;; 以下は ~/bin/stumpwm の中で実行する。
(run-shell-command "xset b off" t)
;;(run-shell-command "xmodmap ~/.xmodmaprc" t)
;;(run-shell-command "xsands")

(set-prefix-key (kbd "C-)"))
;;(set-prefix-key (kbd "H-t"))

(setq *shell-program* "/usr/bin/zsh")

(set-font "-*-*-medium-r-normal-*-12-*-*-*-*-*-iso10646-1")

(setq *mouse-focus-policy* :sloppy)

(defmacro def-my-command (name key &key
                                     (command (string-downcase name))
                                     (class (string-capitalize name)))
  (let ((pull (intern (format nil "PULL-~a" name))))
    `(progn
       (defcommand ,name () ()
         ,(format nil "run-or-raise ~a" name)
         (run-or-raise ,command '(:class ,class)))
       (defcommand ,pull () ()
         ,(format nil "run-or-pull ~a" name)
         (stumpwm::run-or-pull ,command '(:class ,class)))
       ,@(when key
           `((define-key *root-map* (kbd ,(format nil "C-~a" key)) ,(string-downcase name))
             (define-key *root-map* (kbd ,key) ,(string-downcase pull)))))))

(def-my-command emacs "u")

(def-my-command opera "(")

(def-my-command gnome-terminal nil)

(def-my-command mlterm "p" :class "mlterm" :command "mlterm -e sleep-and-tmux")

(def-my-command firefox "y" :class "Iceweasel")

(def-my-command chrome "o" :class "Google-chrome" :command "google-chrome")

(def-my-command virtualbox "v" :class "VirtualBox" :command "virtualbox")

(def-my-command skype "i" :class "Skype" :command "skype")

(defcommand climacs () ()
  "climacs"
  (run-or-raise "" '(:class "Climacs")))
;; (define-key *root-map* (kbd "C-c") "climacs")
;; (define-key *root-map* (kbd "c") "climacs")

(def-my-command kvm "q" :class "kvm" :command "")

(def-my-command eclipse "e" :class "Eclipse" :command "/home/ancient/local/opt/eclipse/eclipse")

(def-my-command amarok nil)

;; (def-my-command titanium "t" :class "Titanium Studio"
;;   :command "/home/ancient/local/opt/Titanium\\ Studio/TitaniumStudio")
;;
;; (def-my-command android-emulator "e" :class "SDL_App" :command "")

;; input window を中央に出す。
(setq *input-window-gravity* :center)
(define-key *input-map* (kbd "C-i") 'stumpwm::input-complete-forward)
(define-key *input-map* (kbd "C-m") 'stumpwm::input-submit)
(define-key *input-map* (kbd "C-h") 'stumpwm::input-delete-backward-char)
(define-key *input-map* (kbd "M-C-h") 'stumpwm::input-backward-kill-word)

;; message window を中央に出す。
(setq *message-window-gravity* :center)
;; 閉じるまでのタイムアウト
(setq *timeout-wait* 5)


(define-key *root-map* (kbd "'") "windowlist")


(load-module "battery-portable")
(load-module "cpu")
(load-module "mem")


;; mode-line
(setf *mode-line-position* :bottom)
(progn
  (setf *screen-mode-line-format*
        (list '(:eval (run-shell-command "date '+%m/%d(%a) %H:%M' |tr -d \\[:cntrl:\\]" t))
              " | %B | %c %t %M| %W"))
  (loop repeat 2 do (toggle-mode-line (current-screen) (current-head))))
(enable-mode-line (current-screen) (current-head) t)


(progn
  ;; amixer
  (load-module "amixer")
  (stumpwm::defvolcontrol amixer-Master-1%- "Master" "'1%-'")
  (stumpwm::defvolcontrol amixer-Master-1%+ "Master" "'1%+'")
  (define-key *top-map* (kbd "XF86AudioRaiseVolume") "amixer-Master-1%+")
  (define-key *top-map* (kbd "XF86AudioLowerVolume") "amixer-Master-1%-"))


(defmacro program-with-layout (name &key (command (string-downcase (string name)))
                                      (props `'(:class ,(string-capitalize command))))
  (macrolet ((with-gensyms ((&rest names) &body body)
               `(let ,(loop for n in names collect `(,n (gensym)))
                  ,@body)))
    (with-gensyms (s w h files-path layout rules)
      `(defcommand ,name () ()
         ,(princ-to-string name)
         (let* ((,s (current-screen))
                (,w (prin1-to-string (stumpwm::screen-width ,s)))
                (,h (prin1-to-string (stumpwm::screen-height ,s)))
                (,files-path "~/.stumpwm.d/")
                (,layout (concat ,files-path ,command "-layout-" ,w "x" ,h))
                (,rules (concat ,files-path ,command "-rules")))
           (stumpwm::gnew ,command)
           (stumpwm::restore-from-file ,layout)
           (stumpwm::restore-window-placement-rules ,rules)
           (run-or-raise ,command ,props)
           (stumpwm::place-existing-windows)))))) ; needed if command was already run

(program-with-layout gimp)

(define-key *root-map* (kbd "C-a") "amarok")
(define-key *root-map* (kbd "a") "amarok")


(require :swank)
(defcommand swank () ()
  "swank"
  (setf stumpwm:*top-level-error-action* :break)
  (and (swank:create-server :port 4005
              :dont-close t)
       (echo-string (current-screen) "Starting Swank")))

(defcommand lock () ()
  "xscreensaver-command -lock"
  (run-shell-command "xscreensaver-command -lock"))


(progn
  (defvar *emacs-edit-request-window* nil)

  (defcommand return-to-emacs-edit-request-window () ()
    "戻る"
    (let* ((win *emacs-edit-request-window*)
           (group (stumpwm::window-group win))
           (frame (stumpwm::window-frame win))
           (old-frame (stumpwm::tile-group-current-frame group)))
      (stumpwm::frame-raise-window group frame win)
      (stumpwm::focus-all win)
      (unless (eq frame old-frame)
        (stumpwm::show-frame-indicator group))))

  ;; emacs で編集する。
  (defun send-fake-key-seq (key-seq)
    (loop for key in (stumpwm::parse-key-seq key-seq)
          do (stumpwm::send-fake-key (current-window) key))
    (xlib:display-finish-output *display*))

  (defcommand start-emacs-edit () ()
    "start emacs edit"
    (setf *emacs-edit-request-window* (current-window))
    (send-fake-key-seq "C-a")
    (sleep 0.5)
    (send-fake-key-seq "C-c")
    (run-shell-command "emacsclient -e '(progn (switch-to-buffer (generate-new-buffer \"*stumpwm-emacs-edit*\")) (setq buffer-offer-save nil))'")
    (stumpwm::run-commands "emacs")
    (sleep 0.5)
    (send-fake-key-seq "
C-y
M-<"))

  (defcommand commit-emacs-edit () ()
    "commit emacs edit"
    (send-fake-key-seq "
C-x
h
M-w
C-x
k
RET")
    (return-to-emacs-edit-request-window)
    (send-fake-key-seq "C-a")
    (sleep 1.0)
    (send-fake-key-seq "C-v"))

  (defcommand emacs-edit () ()
    "Emacs で編集する。"
    (let ((matches (stumpwm::find-matching-windows '(:class "Emacs")
                                          *run-or-raise-all-groups*
                                          *run-or-raise-all-screens*)))
      (if (member (current-window) matches)
          (commit-emacs-edit)
          (start-emacs-edit))))

  (define-key *root-map* (kbd "e") "emacs-edit")
  )

;;(gnome-terminal)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Redmine
;;;;
;;;; sudo apt-get install xclip
;;;;
(ql:quickload :drakma)
(ql:quickload :cl-json)

(defun redmine-issue (id)
  (let* ((drakma:*text-content-types* '(("application" . "json"))))
    (cdr (assoc :issue
                (json:decode-json-from-string
                 (drakma:http-request
                  (format nil "https://its.actindi.net/issues/~a.json" id)
                  :additional-headers '(("X-Redmine-API-Key" . "fec76abf5288d462f32cc993feba76af965f728f"))))))))

(defun redmine-issue-subject (id)
  (let ((issue (redmine-issue id)))
    (format nil "refs #~a ~a: ~a" id
            (cdr (assoc :name (cdr (assoc :project issue))))
            (cdr (assoc :subject
             (cdr (assoc :subject issue)))))

(defcommand r (id) ((:number "#: "))
  "set the issue subject to a clibboard."
  (let ((subject (redmine-issue-subject id)))
    (run-shell-command (format nil "echo \"~a\" | xclip -selection CLIPBOARD"
                               subject))
    (message "~a" subject)))

(defcommand ticket (ticket) ((:number "#: "))
  "show ticket"
  (run-shell-command
   (format nil "firefox https://its.actindi.net/issues/~d" ticket)))

(defcommand rr () ()
  "set the issue subject to a clibboard from Firefox with Vimperator."
  (labels ((send-key-seq (key-seq)
             (loop with window = (current-window)
                   for key in (stumpwm::parse-key-seq key-seq)
                   do (stumpwm::send-fake-key window key))))
    (let ((win (current-window)))
      (run-commands "firefox")
      (sleep 0.2)
      (send-key-seq "y")
      (sleep 0.2)
      (let* ((url (get-x-selection))
             (id (parse-integer url :start (1+ (position #\/ url :from-end t))
                                    :junk-allowed t)))
        (stumpwm::pull-window win)
        (run-commands (format nil "r ~a" id))
        (sleep 0.1)
        (send-key-seq "C-y")))))
