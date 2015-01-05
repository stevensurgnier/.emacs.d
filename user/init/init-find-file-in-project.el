(require 'find-file-in-project)

(mapc (apply-partially 'add-to-list 'ffip-patterns)
      '("*.java" "*.sql" "*.clj" "*.cljs" "*.erb" "*.scala" "*.R"
        "pom.xml" "*.yml" "*.py" "Makefile" "*.json"))

(setq ffip-find-options "-not -path '*/target/*'")

(require 'steven-bindings)
(define-key steven/bindings-map (kbd "C-c f") 'find-file-in-project)

