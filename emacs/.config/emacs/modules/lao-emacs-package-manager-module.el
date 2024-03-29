;;; lao-emacs-package-manager-module.el --- Emacs package management -*- lexical-binding: t; -*-

(require 'package)
(require 'use-package)

;; configure package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa-devel" . "https://elpa.gnu.org/devel/"))

(setq package-archive-priorities
      '(("elpa" . 3)
        ("melpa" . 2)
        ("nongnu" . 1)
        ("elpa-devel" . 0)))

(setq package-quickstart t)

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

(provide 'lao-emacs-package-manager-module)
