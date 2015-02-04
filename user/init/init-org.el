(defun header-org-mode ()
  "Insert org-mode header at the beginning of the file."
  (interactive)
  (insert "#+title: " (file-name-nondirectory
		       (file-name-sans-extension (buffer-file-name))) "\n")
  (insert "#+author: " (user-full-name) "\n"))

(setq org-log-done 'time
      org-pretty-entities t
      org-use-sub-superscripts '{}
      org-src-fontify-natively t
      org-agenda-files '("~/notes/planner.org")
			org-startup-with-inline-images t)

(org-babel-do-load-languages 'org-babel-load-languages
			     '((sh . t)
			       (R . t)
			       (python . t)
			       (ruby . t)
			       (perl . t)))

(add-hook 'org-mode-hook 'turn-on-auto-fill)

(require 'steven-bindings)
(define-key steven/bindings-map (kbd "C-c a") 'org-agenda)
