(require 'mu4e)

(setq
 mu4e-maildir                        "~/mail"
 user-mail-address                   "stevensurgnier@gmail.com"
 my-mu4e-default-account             "stevensurgnier@gmail.com"
 mu4e-get-mail-command               "true"
 mu4e-update-interval                nil
 mu4e-sent-messages-behavior         'delete
 mu4e-compose-signature-auto-include nil
 mu4e-user-mail-address-list
 '("stevensurgnier@gmail.com"
   "steven.surgnier@simple.com")
 my-mu4e-account-alist
 '(("steven.surgnier@simple.com"
    (mu4e-drafts-folder "/steven.surgnier@simple.com/[Gmail]/Drafts")
    (mu4e-sent-folder   "/steven.surgnier@simple.com/[Gmail]/Sent Mail")
    (mu4e-trash-folder  "/steven.surgnier@simple.com/[Gmail]/Trash")
    (smtpmail-smtp-user "steven.surgnier@simple.com")
    (user-full-name     "Steven Surgnier")
    (user-mail-address  "steven.surgnier@simple.com"))
   ("stevensurgnier@gmail.com"
    (mu4e-drafts-folder "/stevensurgnier@gmail.com/[Gmail]/Drafts")
    (mu4e-sent-folder   "/stevensurgnier@gmail.com/[Gmail]/Sent Mail")
    (mu4e-trash-folder  "/stevensurgnier@gmail.com/[Gmail]/Trash")
    (smtpmail-smtp-user "stevensurgnier@gmail.com")
    (user-full-name     "Steven Surgnier")
    (user-mail-address  "stevensurgnier@gmail.com"))))

;; http://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html
(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(require 'smtpmail)
(setq
 mail-user-agent              'mu4e-user-agent
 message-kill-buffer-on-exit  t
 message-signature            nil
 starttls-use-gnutls          t
 smtpmail-queue-mail          nil
 smtpmail-queue-dir           "~/mail/queue/cur"
 smtpmail-debug-info          t
 smtpmail-stream-type         'ssl
 smtpmail-default-smtp-server "smtp.gmail.com"
 smtpmail-smtp-server         "smtp.gmail.com"
 smtpmail-smtp-service        465
 smtpmail-starttls-credentials
 '(("smtp.gmail.com" 465 "steven.surgnier@simple.com" nil)
   ("smtp.gmail.com" 465 "stevensurgnier@gmail.com" nil)))
