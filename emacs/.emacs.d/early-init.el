;;; early-init.el -*- lexical-binding: t -*-
(setq package-enable-at-startup nil)

(setq native-comp-deferred-compilation nil)

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1)))

(setq frame-inhibit-implied-resize t)

(setq load-prefer-newer noninteractive)

(setq-default inhibit-message t)
(add-hook 'window-setup-hook
          (lambda ()
            (setq-default inhibit-redisplay nil
                          inhibit-message nil)
            (redisplay)))

;; suppress messages from `load-file'
(define-advice load-file (:override (file) silence)
  (load file nil 'nomessage))

(set-language-environment "UTF-8")
(setq default-input-method nil)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(fullscreen . fullheight) default-frame-alist)
(push '(fullscreen . maximized) default-frame-alist)

(provide 'early-init)
