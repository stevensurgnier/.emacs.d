(require 'mu4e)

(setq
 mu4e-maildir                "~/mail"
 user-mail-address           "stevensurgnier@gmail.com"
 my-mu4e-default-account     "stevensurgnier@gmail.com"
 mu4e-get-mail-command       "true"
 mu4e-update-interval        nil
 mu4e-sent-messages-behavior 'delete
 mu4e-user-mail-address-list '("stevensurgnier@gmail.com"
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
