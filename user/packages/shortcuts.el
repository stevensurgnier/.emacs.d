;;; shortcuts.el --- browser shortcuts

(defun grafana (service)
  "Open a grafana dashboard"
  (interactive "sService name: ")
  (browse-url (format "https://github.banksimple.com/pages/ops/grafana/index.html#/dashboard/file/%s.json" service)))

(defun redshift-doc (command)
  "Open the docs for a Redshift command"
  (interactive "s command: ")
  (browse-url (format "http://docs.aws.amazon.com/redshift/latest/dg/r_%s.html" (upcase command))))

(defun redshift-doc-at-point ()
  "Open the docs for a Redshift command"
  (interactive)
  (redshift-doc (thing-at-point 'symbol)))

(defun jenkins (job)
  "Open a jenkins job"
  (interactive "s job: ")
  (browse-url (format "https://jenkins-build.banksimple.com/job/%s" job)))

(defun thesaurus (term)
  "Open thesaurus for a given term"
  (interactive "s term: ")
  (eww (format "http://www.thesaurus.com/browse/%s" term)))

(defun thesaurus-at-point ()
  "Open thesaurus for a given term"
  (interactive)
  (thesaurus (thing-at-point 'symbol)))

(defun dictionary (term)
  "Open dictionary for a given term"
  (interactive "s term: ")
  (eww (format "http://dictionary.reference.com/browse/%s" term)))

(defun dictionary-at-point ()
  "Open dictionary for a given term"
  (interactive)
  (dictionary (thing-at-point 'symbol)))

(defun banner (name)
  "Create a new banner"
  (interactive "s name: ")
  (browse-url (format "http://patorjk.com/software/taag/#p=display&f=Graffiti&t=%s" name)))

(provide 'shortcuts)
