;; anything-neco.el - redistribution of :Neco and :Unite-neco (Vim plugin)
;; written by peccu
;;
;; Unite neco screenshot
;;   http://lingr.com/room/vim/archives/2010/11/18#message-1025387
;; Code of unite neco
;;   https://github.com/ujihisa/config/commit/a1d5e08464f2679b4e156f6ddc406191dd2d90b4
;; Recorded Screencast of :Neco and unite-neco
;;   http://www.ustream.tv/recorded/11240673
;; neocomplcache(:Neco is part of neocomplcache)
;;   http://www.vim.org/scripts/script.php?script_id=2620
;; Code of :Neco
;;   https://github.com/Shougo/neocomplcache/blob/master/autoload/neocomplcache.vim#L1075-1238
;;
;;; Installation:
;;
;; Put the neco.el to your load-path.
;; Add to init.el or .emacs:
;; (require 'anything-neco)
;; (global-set-key (kbd "C-c n") 'anything-neco)
;;
;; M-x Neco runs Neco. Try it!
 
 
;;; Require
(require 'anything)
 
;;; Code
;; Neco
(defvar Neco-frames
  ;; ~(-'_'-) goes right
  '((("   A A"
      "~(-'_'-)")
     ("      A A"
      "   ~(-'_'-)")
     ("        A A"
      "     ~(-'_'-)")
     ("          A A"
      "       ~(-'_'-)")
     ("             A A"
      "          ~(-^_^-)"))
    ;; ~(-'_'-) goes right and left
    (("   A A"
      "~(-'_'-)")
     ("      A A"
      "   ~(-'_'-)")
     ("        A A"
      "     ~(-'_'-)")
     ("          A A"
      "       ~(-'_'-)")
     ("             A A"
      "          ~(-'_'-)")
     ("          A A"
      "       ~(-'_'-)")
     ("        A A"
      "     ~(-'_'-)")
     ("      A A"
      "   ~(-'_'-)")
     ("   A A"
      "~(-'_'-)"))
    ;; ~(-'_'-) goes right quickly
    (("   A A"
      "~(-'_'-)")
     ("        A A"
      "     ~(-'_'-)")
     ("             A A"
      "          ~(-'_'-)")
     ("                  A A"
      "               ~(-'_'-)")
     ("                       A A"
      "                    ~(-'_'-)")
     ("                           A A"
      "                        ~(-'_'-)"))
    ;; ~(-'_'-) goes right then smile
    ((""
      "   A A"
      "~(-'_'-)")
     ("      A A"
      "   ~(-'_'-)"
      "")
     (""
      "        A A"
      "     ~(-'_'-)")
     ("          A A"
      "       ~(-'_'-)"
      "")
     (""
      "             A A"
      "          ~(-^_^-)"))
    ;; ~(-'_'-)  -8(*'_'*) go right and left
    (("   A A        A A"
      "~(-'_'-)  -8(*'_'*)")
     ("     A A        A A"
      "  ~(-'_'-)  -8(*'_'*)")
     ("       A A        A A"
      "    ~(-'_'-)  -8(*'_'*)")
     ("     A A        A A"
      "  ~(-'_'-)  -8(*'_'*)")
     ("   A A        A A"
      "~(-'_'-)  -8(*'_'*)"))
    ;; (=' .' ) ~w
    (("  A\\_A\\"
      "(=' .' ) ~w"
      "((\")(\")")))
  "anymation frames for Neco.")
 
(defun Neco (&optional number)
  "Show neco animation."
  (interactive "P")
  (let ((neco (nth (prefix-numeric-value number) Neco-frames))
        frames frame)
      (while neco
        (setq frames (car neco))
        (setq frame (car frames))
        (setq frames (cdr frames))
        (while frames
          (setq frame (concat frame "\n" (car frames)))
          (setq frames (cdr frames)))
        (message frame)
        (sleep-for .3)
        (setq frame nil
              neco (cdr neco)))))
;; (Neco)
 
;; anything-neco
(defvar anything-c-source-neco-candidates
  '(("~(-'_'-) goes right" . 0)
    ("~(-'_'-) goes right and left" . 1)
    ("~(-'_'-) goes right quickly" . 2)
    ("~(-'_'-) goes right then smile" . 3)
    ("~(-'_'-)  -8(*'_'*) go right and left" . 4)
    ("(=' .' ) ~w" . 5)))
 
(defvar anything-c-source-neco
  '((name . "Neco")
    (candidates . (lambda () anything-c-source-neco-candidates))
    (action . Neco)))
;; (anything 'anything-c-source-neco)
 
(defun anything-neco ()
  "display neco"
  (interactive)
  (anything 'anything-c-source-neco))
;; (anything-neco)
(provide 'anything-neco)
