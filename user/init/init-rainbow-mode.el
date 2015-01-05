(dolist (hook '(css-mode-hook
                html-mode-hook
                js-mode-hook
                r-mode-hook))
  (add-hook hook 'rainbow-mode))
