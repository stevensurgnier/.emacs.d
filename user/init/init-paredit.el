(dolist (hook '(clojure-mode-hook
								emacs-lisp-mode-hook
								java-mode-hook
								json-mode-hook
								python-mode-hook
								R-mode-hook))
  (add-hook hook #'(lambda () (paredit-mode 1))))
