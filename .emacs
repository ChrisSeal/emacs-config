(server-start)
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar myPackages
  '(auctex
    better-defaults
    ein
    ivy
    elpy
    flycheck
    material-theme
    py-autopep8
    jedi
    yasnippet
    solarized-theme))
(mapc #'(lambda(package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

(setq inhibit-startup-message t)
(load-theme 'material t)
;(load-theme 'solarized-dark t)
(global-linum-mode t)
(global-visual-line-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(ivy-mode 1)

(defvar --backup-directory (concat user-emacs-directory "emacs-backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(define-minor-mode sensitive-mode
  "For sensitive files like password lists.
It disables backup creation and auto saving.

With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode."
  ;; The initial value.
  nil
  ;; The indicator for the mode line.
  " Sensitive"
  ;; The minor mode bindings.
  nil
  (if (symbol-value sensitive-mode)
      (progn
	;; disable backups
	(set (make-local-variable 'backup-inhibited) t)	
	;; disable auto-save
	(if auto-save-default
	    (auto-save-mode -1)))
    ;resort to default value of backup-inhibited
    (kill-local-variable 'backup-inhibited)
    ;resort to default auto save setting
    (if auto-save-default
	(auto-save-mode 1))))

(add-to-list 'load-path "~/.emacs.d/myInit/")
(load-library "my-python")
(load-library "my-org")
(load-library "my-keys")
(load-library "my-auctex")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(org-agenda-files
   (quote
    ("~/Dropbox/OrgFiles/refile.org" "~/Dropbox/OrgFiles/mytardis.org" "~/Dropbox/OrgFiles/gtd.org" "~/Dropbox/OrgFiles/Duncan.org" "~/Dropbox/OrgFiles/personal.org" "~/Dropbox/OrgFiles/ice.org")))
 '(package-selected-packages
   (quote
    (fill-column-indicator pyenv-mode magit color-theme-solarized org-plus-contrib org-agenda-property ivy-omni-org ivy-yasnippet ivy org-super-agenda auctex org wc-goal-mode toml-mode origami json-mode py-autopep8 material-theme jedi flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
