;;; prodigy-process-handling-test.el --- Prodigy: Tests various processes related things -*- lexical-binding: t; -*-

;; Copyright (C) 2014 Johan Andersson

;; Author: Johan Andersson <johan.rejeep@gmail.com>
;; Maintainer: Johan Andersson <johan.rejeep@gmail.com>

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;;; Code:


;;;; prodigy-start-service

(require 'ert-async)

(ert-deftest-async prodigy-start-service-test/callback-when-started (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service)))
     (prodigy-start-service service
       (lambda ()
         (prodigy-stop-service service nil done))))))

(ert-deftest-async prodigy-start-service-test/fail-when-not-started-after-tryouts (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service
                   :command "echo"
                   :args '("foo"))))
     (prodigy-start-service service)
     (prodigy-test/delay 2
       (lambda ()
         (should (eq (plist-get service :status) 'failed))
         (funcall done))))))

(ert-deftest prodigy-start-service-test/path ()
  
  )

(ert-deftest prodigy-start-service-test/env ()
  
  )

;;;; on-output

(ert-deftest-async prodigy-start-service-test/on-output/no-tags (done-log-foo done-log-bar done-stop)
  (with-sandbox
   (let ((service (prodigy-test/make-service
                   :on-output (lambda (service output)
                                (cond ((string= output "foo\n")
                                       (funcall done-log-foo))
                                      ((string= output "bar\n")
                                       (funcall done-log-bar)
                                       (prodigy-stop-service service nil done-stop)))))))
     (prodigy-start-service service
       (lambda ()
         (prodigy-test/post-message service 'log "foo")
         (prodigy-test/post-message service 'log "bar"))))))

(ert-deftest-async prodigy-start-service-test/on-output/with-tag (done-service done-tag done-stop)
  (with-sandbox
   (prodigy-define-tag
     :name 'tag
     :on-output (lambda (service output)
                  (when (string= output "foo\n")
                    (funcall done-tag)
                    (prodigy-stop-service service nil done-stop))))
   (let ((service
          (prodigy-test/make-service
           :tags '(tag)
           :on-output (lambda (service output)
                        (when (string= output "foo\n")
                          (funcall done-service))))))
     (prodigy-start-service service
       (lambda ()
         (prodigy-test/post-message service 'log "foo"))))))

;;;; init

(ert-deftest prodigy-start-service-test/init ()
  
  )

;;;; init-async

(ert-deftest-async prodigy-start-service-test/init-async/callbacked (done-init-async done-stop)
  (with-sandbox
   (let ((service
          (prodigy-test/make-service
           :init-async (lambda (done)
                         (funcall done)
                         (funcall done-init-async)))))
     (prodigy-start-service service
       (lambda ()
         (prodigy-stop-service service nil done-stop))))))

(ert-deftest prodigy-init-async-test/not-callbacked ()
  (with-sandbox
   (should-error
    (let ((prodigy-init-async-timeout 1)
          (service
           (prodigy-test/make-service
            :init-async (lambda (done)))))
      (prodigy-start-service service)))))


;;;; prodigy-stop-service

(ert-deftest-async prodigy-stop-service-test/remove-process-and-process-status (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service)))
     (prodigy-start-service service
       (lambda ()
         (prodigy-stop-service service nil
           (lambda ()
             (should-not (plist-get service :process))
             (should-not (plist-get service :process-status))
             (funcall done))))))))

(ert-deftest-async prodigy-stop-service-test/status-failed (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service)))
     (prodigy-start-service service
       (lambda ()
         (prodigy-test/post-message service 'ignore-signal "SIGINT")
         (prodigy-test/delay 1
           (lambda ()
             (prodigy-stop-service service nil
               (lambda ()
                 (funcall done "should not stop because SIGINT ignored")))
             (prodigy-test/delay 2
               (lambda ()
                 (should (eq (plist-get service :status) 'failed))
                 (prodigy-stop-service service 'force done))))))))))

(ert-deftest-async prodigy-stop-service-test/force-kill (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service)))
     (prodigy-start-service service
       (lambda ()
         (prodigy-test/post-message service 'ignore-signal "SIGINT")
         (prodigy-test/delay 1
           (lambda ()
             (prodigy-stop-service service 'force
               (lambda ()
                 (funcall done))))))))))

(ert-deftest-async prodigy-stop-service-test/callback-when-stopped (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service)))
     (prodigy-start-service service
       (lambda ()
         (prodigy-stop-service service nil done))))))

(ert-deftest prodigy-stop-service-test/kill-process-buffer-on-stop ()
  )

(ert-deftest-async prodigy-stop-service-test/todo (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service)))
     (prodigy-start-service service
       (lambda ()
         (switch-to-buffer (get-buffer-create "foo"))
         (insert "bar")
         (prodigy-stop-service service nil done)
         (should (string= (buffer-name) "foo"))
         (should (string= (buffer-string) "bar")))))))


;;;; prodigy-restart-service

(ert-deftest-async prodigy-restart-service-test/not-started (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service)))
     (prodigy-restart-service service
       (lambda ()
         (prodigy-stop-service service nil done))))))

(ert-deftest-async prodigy-restart-service-test/started (done)
  (with-sandbox
   (let ((service (prodigy-test/make-service)))
     (prodigy-start-service service
       (lambda ()
         (prodigy-restart-service service
           (lambda ()
             (prodigy-stop-service service nil done))))))))


;;;; prodigy-process-filter

(provide 'prodigy-process-handling-test)

;;; prodigy-process-handling-test.el ends here
