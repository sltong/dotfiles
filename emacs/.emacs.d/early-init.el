;;; early-init.el --- Pre-init file customizations -*- lexical-binding: t -*-
;;; Commentary:
;;
;; This file contains customizations that take place before `init.el'
;; file is loaded. Some customizations include decreased initialization time.
;;
;; Code:

;; don't make installed packages available before loading `init.el'
(setq package-enable-at-startup nil)

;; increase to a sufficiently large value so garbage collection doesn't get triggered
(setq gc-cons-threshold most-positive-fixnum)

;; always load the newest version of a file
;;
;; relevant for compiled elisp files
;;
;; e.g. if `init.el' is newer than `init.elc', `init.el' will load
;; first
(setq load-prefer-newer t)

;; don't display *Warnings* buffer when native compilation warnings are reported
(setq native-comp-async-report-warnings-errors 'silent)

;; configure GUI and frames
(modify-all-frames-parameters
 '((menu-bar-lines . 0)
   (tool-bar-lines . 0)
   (tab-bar-lines . 0)
   (horizontal-scroll-bars . nil)
   (vertical-scroll-bars . nil)
   (fullscreen . fullboth)))

;; configure garbage collection and set `gc-cons-threshold' to a reasonable value
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 128 1024 1024))))

(provide 'early-init)
