;;; gif.el --- very important gifs

(defmacro gif (fn url)
  `(defun ,(intern (format "gif-%s" fn)) ()
        (interactive)
        (insert ,url)))

(gif "its-happening" "http://media0.giphy.com/media/rl0FOxdz7CcxO/giphy.gif")
(gif "woo" "http://www.reactiongifs.com/r/vhpy.gif")
(gif "take-my-money" "http://www.keenandgraev.com/wp-content/uploads/2012/12/Take-my-Money-300x168.jpg")
(gif "hang-in-there" "http://ecx.images-amazon.com/images/I/51S%2BpPtReeL._SY344_BO1,204,203,200_.jpg")
(gif "clap-wave-pow" "http://1.bp.blogspot.com/-ED_iMFF3A5I/UmBTCvjmpWI/AAAAAAAAaMA/wclkpl5n0ss/s1600/eQ8ECXX.gif")
(gif "kanye-happy-clap" "http://soundisstyle.com/wp-content/uploads/2014/03/Kanye-West-Clapping.gif")
(gif "toociced" "http://img.pandawhale.com/103113-thats-a-bingo-gif-Imgur-pyw2.gif")

(provide 'gif)
