;;; steven-bindings.el --- a minor mode for my bindings

(define-minor-mode steven/bindings
  "My global bindings"
  t nil (make-sparse-keymap))

(define-key steven/bindings-map (kbd "M-j") 'windmove-left)
(define-key steven/bindings-map (kbd "M-k") 'windmove-down)
(define-key steven/bindings-map (kbd "M-i") 'windmove-up)
(define-key steven/bindings-map (kbd "M-l") 'windmove-right)
(define-key steven/bindings-map (kbd "C-;") 'comment-or-uncomment-region)

(provide 'steven-bindings)
