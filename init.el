;; me
(setq user-full-name "Steven Surgnier")
(setq user-mail-address "stevensurgnier@gmail.com")

;; environment
(setq explicit-shell-file-name "/bin/bash")

(setq exec-path
      (append (mapcar 'expand-file-name '("/usr/local/bin"
																					"~/bin"))
							exec-path))

(setenv "PATH" (mapconcat 'identity exec-path path-separator))

(require 'cl)

;; package management
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; default packages
(defvar steven/packages
  '(clojure-mode
    dash-at-point
    el-get
    erc
    erc-hl-nicks
    ess
    ess-R-data-view
    find-file-in-project
    gist
    ibuffer-git
    magit
    markdown-mode
    marmalade
    paredit
    rainbow-mode
    scala-mode
    scratch
    shell-here
    smex
    smtpmail
    solarized-theme
    ssh
    yaml-mode)
  "Default packages")

;; install default packages
(defun steven/packages-installed-p ()
  (setq pkgs steven/packages)
  (while (package-installed-p (car pkgs))
    (setq pkgs (cdr pkgs)))
  (not (car pkgs)))

(defun steven/install-packages ()
  (unless (steven/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg steven/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg)))))

(steven/install-packages)

;; install el-get packages
(require 'el-get)
(add-to-list 'el-get-recipe-path
	     (expand-file-name "el-get-user/recipes" user-emacs-directory))
(add-to-list 'el-get-recipe-path
	     (expand-file-name "el-get/el-get/recipes" user-emacs-directory))
(setq el-get-byte-compile t
      el-get-git-shallow-clone t
      el-get-user-package-directory (expand-file-name "el-get-user/init"
						      user-emacs-directory))
(defvar steven/el-get-packages
  '(cider
    dash
    flycheck
    mu4e
    org-mode
    smart-mode-line
    sql-preset-el
    znc)
  "El-get packages")

(el-get 'sync steven/el-get-packages)

;; install local user packages
(setq user-packages-dir
      (expand-file-name "user/packages" user-emacs-directory))
(add-to-list 'load-path user-packages-dir)

(defvar steven/user-packages
  '(emot
    font
    gif
    shortcuts
    steven-bindings
    unicode
    useful)
  "user packages")

(dolist (package steven/user-packages)
  (require package))

;; initialize packages
(setq user-init-dir
      (expand-file-name "user/init" user-emacs-directory))

(defun init-packages ()
  (dolist (file (directory-files user-init-dir t "init-.+\.el$"))
    (when (file-regular-p file)
      (load file))))

(init-packages)

;; startup defaults
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode
      use-dialog-box nil
      visible-bell t
      make-backup-files nil
      backup-inhibited t
      default-tab-width 2)
(setq-default tab-width 2
              indent-tabs-mode nil)
(load-theme 'solarized-dark t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode t)
(set-fringe-mode 0)
(winner-mode 1)
(setq confirm-nonexistent-file-or-buffer nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; always use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; start in fullscreen
(set-frame-parameter nil 'fullscreen 'fullboth)

;; modeline
(setq display-time-format "%a %Y-%m-%d %H:%M:%S"
      display-time-default-load-average nil
;;      display-time-24hr-format t
      )
(display-time-mode 1)
(line-number-mode 0)
(column-number-mode 0)
(size-indication-mode 0)
(display-battery-mode 0)
(which-function-mode 0)

;; left cmd as meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta)
