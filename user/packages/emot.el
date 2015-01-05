;;; emot.el --- emoticons

(defmacro emot (fn text)
  `(defun ,(intern (format "emot-%s" fn)) ()
        (interactive)
        (insert ,text)))

(emot "happy" "(¬‿¬)")
(emot "shrug-lol" "¯\(°_o)/¯")
(emot "shrug-smile" "¯\_(ツ)_/¯")
(emot "rage" "(ノಠ益ಠ)ノ彡┻━┻")
(emot "unsure" "ಠ_ಠ")
(emot "worried" "⊙﹏⊙")
(emot "cool" "(⌐■_■)")

(provide 'emot)
