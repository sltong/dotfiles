;; early-init.el --- Early Initialization File -*- lexical-binding: t; -*-

(when (featurep 'native-compile)
  (setq native-comp-async-report-warnings-errors 'silent)
  (startup-redirect-eln-cache "var/eln-cache/"))

;; garbage collection
(setq gc-cons-percentage 1
      gc-cons-threshold most-positive-fixnum)

(defun lao/set-after-early-init-gc-values ()
  (setq gc-cons-percentage 0.1
        gc-cons-threshold (* 1024 1024 2))) ; 2MB

(add-hook 'after-init-hook 'lao/set-after-early-init-gc-values)

(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t)

;; don't wait for GTK events
(setq-default pgtk-wait-for-event-timeout 0)

;; graphical display
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(add-to-list 'default-frame-alist (height . 120))

(setq inhibit-startup-message t)
(setq initial-major-mode 'fundamental-mode)
