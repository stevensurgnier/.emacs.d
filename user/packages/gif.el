;;; gif.el --- very important gifs

(defmacro gif (fn url)
  `(defun ,(intern (format "gif-%s" fn)) ()
        (interactive)
        (insert ,url)))

(gif "its-happening" "http://media0.giphy.com/media/rl0FOxdz7CcxO/giphy.gif")
(gif "woo" "http://www.reactiongifs.com/r/vhpy.gif")
(gif "take-my-money" "http://www.keenandgraev.com/wp-content/uploads/2012/12/Take-my-Money-300x168.jpg")

(provide 'gif)
