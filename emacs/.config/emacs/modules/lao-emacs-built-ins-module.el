;;; lao-emacs-built-ins-module.el --- Emacs built-in packages -*- lexical-binding: t; -*-

;; default configurations
(setq mode-line-position-column-line-format '(" (%l,%C)"))

;; modes
(savehist-mode 1)
(save-place-mode 1)
;; NOTE this doesn't save fullscreen window size
;; (desktop-save-mode 1)
(column-number-mode 1)
(electric-pair-mode 1)
(pixel-scroll-precision-mode 1)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

(use-package dired
  :ensure nil
  :custom
  (dired-listing-switches "-ahl")
  (dired-auto-revert-buffer t)
  :bind (:map dired-mode-map
              ("b" . dired-up-directory)
              ("+" . dired-create-empty-file)
              ("M-+" . dired-create-directory)))

(use-package dired-x
  :ensure nil
  :requires dired
  :init
  (setq dired-x-hands-off-my-keys t))

(use-package files
  :ensure nil
  :bind ("C-c r" . restart-emacs))

(use-package recentf
  :ensure nil
  :config
  (recentf-mode 1)
  :bind ("C-c f r" . recentf-open-files)
  :config
  (setq recentf-max-menu-items 30
        recentf-max-saved-items 30))

(use-package ibuffer
  :ensure nil
  :init
  :bind ("C-x C-b" . ibuffer))

(use-package treesit
  :ensure nil
)

(use-package flymake
  :ensure nil
)

(use-package whitespace
  :ensure nil
  :custom
  (whitespace-style '(face
                      trailing
                      tabs
                      lines-char))
  (whitespace-global-modes '(not vterm-mode magit-mode text-mode))
  :config
  (global-whitespace-mode 1))

(use-package eldoc
  :ensure nil
)

(use-package info
  :bind (:map Info-mode-map
         ("b" . Info-history-back)))

(use-package flymake
  :ensure nil
)

(use-package eglot
  :ensure nil
  :hook
  (heex-ts-mode . eglot-ensure)
  (elixir-ts-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '(elixir-ts-mode
                 "~/.local/share/language-servers/elixir-ls-1.14-25.1/language_server.sh")
               '(heex-ts-mode
                 "~/.local/share/language-servers/elixir-ls-1.14-25.1/language_server.sh")))

;; these configurations are needed for =vertico= and =corfu=
;; A few more useful configurations...
(use-package emacs
  :ensure nil
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t)

  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

(provide 'lao-emacs-built-ins-module)
