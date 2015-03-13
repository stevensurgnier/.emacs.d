(require 'auth-source)

(defun* my-znc-profile (name host user port)
  (let* ((auth-info (car (auth-source-search :max 1
                                             :host host
                                             :user user
                                             :port port
                                             :create nil)))
         (password (funcall (plist-get auth-info :secret))))
    (list host port t (list (list name user password)))))

(setq
 znc-erc-connector 'erc
 znc-servers
 (list (my-znc-profile 'simple "chat.banksimple.com" "ssurgnier" 9999)))
