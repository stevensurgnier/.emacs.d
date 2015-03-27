(require 'erc)
(require 'erc-truncate)
(require 'erc-hl-nicks)
(require 'erc-image)
(require 'erc-match)
(require 'erc-track)
(require 'tls)

(setq erc-modules '(autojoin
                    button
                    completion
                    irccontrols
                    keep-place
                    list
                    log
                    match
                    menu
                    move-to-prompt
                    netsplit
                    networks
                    noncommands
                    readonly
                    ring
                    scrolltobottom
                    stamp
                    track
                    truncate
                    hl-nicks
                    image))
(erc-update-modules)

(setq erc-keywords '("\\bsteven\\b"
                     "\\bsteven's\\b"
                     "analytics"
                     "clojure"
                     "clojerks"
                     "kafka"
                     "redshift"
                     "redshit"
                     "datapipeline"
                     "cascalog"
                     "machine learning"
                     "coinscope"
                     "dataeng"))


(defadvice erc-track-find-face
  (around erc-track-find-face-promote-query activate)
  (if (erc-query-buffer-p)
      (setq ad-return-value (intern "erc-current-nick-face"))
    ad-do-it))


(add-hook 'erc-mode-hook (lambda () (auto-fill-mode 0)))
(add-hook 'erc-mode-hook (lambda () (erc-fill-disable)))

(defun erc-generate-log-file-name-with-date (buffer target nick server port)
  "Compute a short log file name.
   The name of the log file is composed of BUFFER and the current date.
   This function is a possible value for `erc-generate-log-file-name-function'.
   Modified for UTC."
  (concat (format-time-string "%Y-%m-%d" nil t) "-" nick "-" target  ".txt"))


(set-face-foreground 'erc-keyword-face "slateblue")
(erc-match-mode t)
(erc-track-mode t)
(erc-autojoin-mode t)
(setq erc-prompt ">"
      erc-join-query 'bury
      erc-join-buffer 'bury
      erc-log-channels-directory "~/.erc/logs/"
      erc-log-insert-log-on-open nil
      erc-log-matches-alist '((keyword . "&activity")
                              (current-nick . "&activity"))
      erc-generate-log-file-name-function 'erc-generate-log-file-name-with-date
      erc-hide-list '("JOIN" "NICK" "PART" "QUIT")
      erc-track-exclude-types '("JOIN"
                                "NICK"
                                "PART"
				"TOPIC"
                                "QUIT"
                                "MODE"
                                "NOTICE"
                                "324" ;; Channel Modes
                                "329" ;; Creation Time
                                "332" ;; topic change
                                "333" ;; shit znc spews
                                "353" ;; shit znc spews RPL_NAMEREPLY
                                "305" ;; shit znc spews (RPL_UNAWAY msg)
                                "477" ;; NoChanModes
                                )
      erc-track-switch-direction 'importance
      erc-timestamp-mode t
      erc-server-303-functions nil
      erc-server-coding-system '(utf-8 . utf-8)
      erc-server-auto-reconnect nil
      erc-autojoin-timing :ident
      erc-flood-protect nil
      erc-max-buffer-size 50000
      erc-current-nick-highlight-type 'nick
      erc-track-use-faces t
      erc-track-faces-priority-list '(erc-current-nick-face
				      erc-keyword-face
				      erc-direct-msg-face
				      erc-nick-msg-face
				      erc-prompt-face
				      erc-notice-face)
      erc-track-priority-faces-only 'all
      erc-hide-timestamps nil
      erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "%Y-%m-%d %H:%M:%S "
      erc-insert-timestamp-function 'erc-insert-timestamp-left)

;; make private messages appear urgent
(defadvice erc-track-find-face
    (around erc-track-find-face-promote-query activate)
  (if (erc-query-buffer-p)
      (setq ad-return-value (intern "erc-current-nick-face"))
    ad-do-it))

(defadvice erc-track-modified-channels
    (around erc-track-modified-channels-promote-query activate)
  (if (erc-query-buffer-p)
      (setq erc-track-priority-faces-only 'nil))
  ad-do-it
  (if (erc-query-buffer-p)
      (setq erc-track-priority-faces-only 'all)))
