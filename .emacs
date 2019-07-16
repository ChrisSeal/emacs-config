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
    yasnippet))
(mapc #'(lambda(package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

(setq inhibit-startup-message t)
(load-theme 'material t)
(global-linum-mode t)
(global-visual-line-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(ivy-mode 1)

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
 '(org-agenda-files
   (quote
    ("~/Dropbox/OrgFiles/refile.org" "~/Dropbox/OrgFiles/mytardis.org" "~/Dropbox/OrgFiles/gtd.org" "~/Dropbox/OrgFiles/Duncan.org" "~/Dropbox/OrgFiles/personal.org" "~/Dropbox/OrgFiles/ice.org")))
 '(package-selected-packages
   (quote
    (org-plus-contrib org-agenda-property ivy-omni-org ivy-yasnippet ivy org-super-agenda auctex org wc-goal-mode toml-mode origami json-mode py-autopep8 material-theme jedi flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
