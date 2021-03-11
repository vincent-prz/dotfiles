(require 'package)
 
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
 
(package-initialize)

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode t))
(global-set-key (kbd "<M-left>") 'evil-window-left)
(global-set-key (kbd "<M-up>") 'evil-window-up)
(global-set-key (kbd "<M-right>") 'evil-window-right)
(global-set-key (kbd "<M-down>") 'evil-window-down)

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  )
(global-set-key (kbd "M-x") 'helm-M-x)

(use-package helm-projectile
  :ensure t
  :commands (helm-projectile helm-projectile-switch-project))
