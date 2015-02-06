(require 'font)
(set-font)

(require 'steven-bindings)
(define-key steven/bindings-map (kbd "M-+") 'inc-font-size)
(define-key steven/bindings-map (kbd "M--") 'dec-font-size)
