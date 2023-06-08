;;; lao-emacs-package-manager-module.el --- Emacs package management -*- lexical-binding: t; -*-

;; configure package archives
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
        ("elpa-devel" . "https://elpa.gnu.org/devel/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(setq package-archive-priorities
      '(("elpa" . 3)
        ("melpa" . 2)
        ("nongnu" . 1))
)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; (defun use-package-normalize/:built-in (name-symbol keyword args)
;;   (use-package-only-one (symbol-name keyword) args
;;     (lambda (label arg)
;;       (cond
;;        ((stringp arg) arg)
;;        ((symbolp arg) (symbol-name arg))
;;        (t
;;         (use-package-error
;;          ":built-in wants an archive name (a string)"))))))

;; (defun use-package-handler/:built-in (name-symbol keyword archive-name rest state)
;;   (let ((body (use-package-process-keywords name-symbol rest state)))
;;     ;; This happens at macro expansion time, not when the expanded code is
;;     ;; compiled or evaluated.
;;     (if (null archive-name)
;;         body
;;       (use-package-pin-package name-symbol archive-name)
;;       (use-package-concat
;;        body
;;        `((push '(,name-symbol . ,archive-name)
;;                package-pinned-packages))))))

(use-package no-littering :init)

;; debugging
(when init-file-debug
  (setq use-package-verbose t
        use-package-expand-minimally nil
        use-package-compute-statistics t
        debug-on-error t))

;; bootstrap elpaca
;; (defvar elpaca-installer-version 0.4)
;; (defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
;; (defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
;; (defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
;; (defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
;;                               :ref nil
;;                               :files (:defaults (:exclude "extensions"))
;;                               :build (:not elpaca--activate-package)))
;; (let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
;;        (build (expand-file-name "elpaca/" elpaca-builds-directory))
;;        (order (cdr elpaca-order))
;;        (default-directory repo))
;;   (add-to-list 'load-path (if (file-exists-p build) build repo))
;;   (unless (file-exists-p repo)
;;     (make-directory repo t)
;;     (when (< emacs-major-version 28) (require 'subr-x))
;;     (condition-case-unless-debug err
;;         (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
;;                  ((zerop (call-process "git" nil buffer t "clone"
;;                                        (plist-get order :repo) repo)))
;;                  ((zerop (call-process "git" nil buffer t "checkout"
;;                                        (or (plist-get order :ref) "--"))))
;;                  (emacs (concat invocation-directory invocation-name))
;;                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
;;                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
;;                  ((require 'elpaca))
;;                  ((elpaca-generate-autoloads "elpaca" repo)))
;;             (kill-buffer buffer)
;;           (error "%s" (with-current-buffer buffer (buffer-string))))
;;       ((error) (warn "%s" err) (delete-directory repo 'recursive))))
;;   (unless (require 'elpaca-autoloads nil t)
;;     (require 'elpaca)
;;     (elpaca-generate-autoloads "elpaca" repo)
;;     (load "./elpaca-autoloads")))
;; (add-hook 'after-init-hook #'elpaca-process-queues)
;; (elpaca `(,@elpaca-order))

;; ;; configure elpaca
;; ;; Install use-package support
;; (elpaca elpaca-use-package
;;   ;; Enable :elpaca use-package keyword.
;;   (elpaca-use-package-mode)
;;   ;; Assume :elpaca t unless otherwise specified.
;;   (setq elpaca-use-package-by-default t))

;; ;; load =no-littering= right after bootstrapping elpaca
;; (elpaca no-littering
;;   (require 'no-littering))

;; ;; Block until current queue processed.
;; (elpaca-wait)

;; ;; When installing a package which modifies a form used at the top-level
;; ;; (e.g. a package which adds a use-package key word),
;; ;; use `elpaca-wait' to block until that package has been installed/configured.
;; ;; For example:
;; ;; (use-package general :demand t)
;; ;; (elpaca-wait)

;; ;; Expands to: (elpaca evil (use-package evil :demand t))
;; ;; (use-package evil :demand t)

;; ;; Turns off elpaca-use-package-mode current declartion
;; ;; Note this will cause the declaration to be interpreted immediately (not deferred).
;; ;; Useful for configuring built-in emacs features.
;; ;; (use-package emacs :elpaca nil :config (setq ring-bell-function #'ignore))

;; ;; Don't install anything. Defer execution of BODY
;; ;; (elpaca nil (message "deferred"))

;; ;; We need this loaded for SSH protocol
;; (elpaca-queue
;;  (elpaca keychain-environment
;;    (keychain-refresh-environment)))

(provide 'lao-emacs-package-manager-module)
