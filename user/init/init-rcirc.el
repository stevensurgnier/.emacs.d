(require 'rcirc)
(require 'auth-source)

(rcirc-track-minor-mode 1)

(setq rcirc-fill-flag nil
      rcirc-fill-column nil
      rcirc-time-format "%Y-%m-%d %H:%M:%S "
      rcirc-log-flag t
      rcirc-log-directory (expand-file-name "~/.irclogs"))

(setq rcirc-keywords
      '("\\bsteven\\b"
        "\\bsteven's\\b"
        "dataeng"
        "analytics/help"
        "github.banksimple.com/analytics"
        "clojure"
        "clojerks"
        "redshift"
        "redshit"
        "datapipeline"
        "machine learning"
        "deep learning"))

(setq rcirc-omit-responses
      '("324"
        "329"
        "332"
        "333"
        "353"
        "353"
        "477"
        "MODE"
        "JOIN"
        "NICK"
        "PART"
        "QUIT"))

(defun my-rcirc-mode-setup ()
  "Set things up for channel and query buffers spawned by rcirc."
  ;; rcirc-omit-mode always *toggles*, so we first 'disable' it
  ;; and then let the function toggle it *and* set things up.
  (setq rcirc-omit-mode nil)
  (rcirc-omit-mode))

(add-hook 'rcirc-mode-hook 'my-rcirc-mode-setup)

(defun my-rcirc-profile (host user port)
  "Search auth-info for an entry matching HOST, USER, and PORT."
  (let* (
         (auth-info
          (car
           (auth-source-search
            :max 1
            :host host
            :user user
            :port port
            :create nil)))
         (password (funcall (plist-get auth-info :secret))))
    (list
     host
     :nick user
     :password (format "%s:%s" user password)
     :full-name user
     :port port
     :encryption 'tls)))

(setq rcirc-server-alist
      (list
       (my-rcirc-profile "chat.banksimple.com" "ssurgnier" 9999)
       (my-rcirc-profile "flame.firrre.com" "stevensurgnier" 9090)))

(require 'rcirc-color)
(setq rcirc-color-is-deterministic t)

(require 'rcirc-controls)
