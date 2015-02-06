;;; font.el --- type face

(defun font-exists-p (name)
  (car (member name (font-family-list))))

(defvar font-name
  (car (remove-if 'null (mapcar 'font-exists-p
        '("Source Code Pro" "Monaco")))))
(defvar font-size 17)

(defun set-font (&optional font &optional size)
  (progn
    (when font (setq font-name font))
    (when size (setq font-size size))
    (set-frame-font (concat font-name "-" (number-to-string font-size)))))

(defun set-font-name (name)
  (interactive)
  (set-font name nil))

(defun set-font-size (size)
  (interactive)
  (set-font nil size))

(defun dec-font-size ()
  (interactive)
  (set-font-size (- font-size 1)))

(defun inc-font-size ()
  (interactive)
  (set-font-size (+ font-size 1)))

(provide 'font)
