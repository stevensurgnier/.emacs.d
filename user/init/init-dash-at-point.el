(require 'dash-at-point)
(add-to-list 'dash-at-point-mode-alist
             '(clojure-mode . "clojure"))

(require 'steven-bindings)
(define-key steven/bindings-map (kbd "C-c d") 'dash-at-point)

