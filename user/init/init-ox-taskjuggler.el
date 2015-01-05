(require 'ox-taskjuggler)

(add-to-list 'org-export-backends 'taskjuggler)

(setq org-taskjuggler-target-version 3.5
      org-taskjuggler-reports-directory "")

(defun org-taskjuggler-export-as-indexhtml ()
  (interactive)
  (progn (org-taskjuggler-export-and-process)
         (shell-command "mv Plan.html index.html")))

(defun org-taskjuggler-export-as-indexhtml-and-open ()
  (interactive)
  (org-taskjuggler-export-as-indexhtml)
  (shell-command "open index.html"))
