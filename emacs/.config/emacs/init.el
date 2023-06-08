(setq user-full-name "Lao Tong"
      user-mail-address "stong@aer.com")

(defvar lao-emacs-modules-directory
  (locate-user-emacs-file "modules")
  "Emacs modules directory.")

(add-to-list 'load-path (locate-user-emacs-file "modules"))

(require 'lao-emacs-package-manager-module)
(require 'lao-emacs-built-ins-module)
(require 'lao-emacs-essentials-module)
(require 'lao-emacs-notes-module)

;; try out packages
(use-package keycast
  :bind ("C-c m m k" . keycast-mode-line-mode))
