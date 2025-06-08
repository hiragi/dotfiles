(defun multi-string (n str)
  (loop repeat n concat str))

(defun pre-post-text-string (str)
  (list str str))

(defun pre-post-tag-string (str)
  (list (concat "<" str ">") (concat "</" str ">")))

(defun pre-post-multi-string (n str)
  (let ((n-str (multi-string (string-to-int n) str)))
    (list n-str n-str)))

(defun pre-post-string (str)
  (cond
   ((string-match "^s\\(.*\\)" str)
    (pre-post-text-string (match-string 1 str)))
   ((string-match "^t\\(.*\\)" str)
    (pre-post-tag-string (match-string 1 str)))
   ((string-match "^\\([0-9]+\\)\\(.*\\)" str)
    (pre-post-multi-string (match-string 1 str) (match-string 2 str)))))

(defun enclose-region (start end str)
  (interactive "r\nsString(s/t/num):")
  (destructuring-bind (pre-str post-str) (pre-post-string str)
    (message (concat pre-str ":" post-str))
    (save-excursion
      (save-restriction
        (save-restriction
          (narrow-to-region start end)
          (goto-char (point-min))
          (insert pre-str "\n")
          (goto-char (point-max))
          (unless (bolp)
            (insert "\n"))
          (insert-before-markers post-str "\n"))))))

(provide 'enclose-region)
