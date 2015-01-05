;;; font.el --- type face

(defun font-exists-p (name)
  (car (member name (font-family-list))))

(defvar default-font-name
  (car (remove-if 'null (mapcar 'font-exists-p
				'("Source Code Pro" "Monaco")))))
;; TODO setting but not initing the  default-font-size makes no sense
(defvar default-font-size 17)
(defvar font-name default-font-name)
(defvar font-size default-font-size)

(defun set-font (font size)
  (set-frame-font (concat font "-" (number-to-string size))))

(defun set-font-name (name)
  (set-font (setq font-name name) font-size))

(defun set-font-size (size)
  (interactive)
  (set-font font-name size))

(defun dec-font-size ()
  (interactive)
  (set-font-size (setq font-size (- font-size 1))))

(defun inc-font-size ()
  (interactive)
  (set-font-size (setq font-size (+ font-size 1))))

(provide 'font)
