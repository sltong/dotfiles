;;; early-init.el --- Early initialization. -*- lexical-binding: t -*-
(setq gc-cons-threshold 1024 * 1024 * 1024)

(setq frame-inhibit-implied-resize t)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(fullscreen . fullheight) default-frame-alist)
(push '(fullscreen . maximized) default-frame-alist)

(setq package-enable-at-startup nil)

(provide 'early-init)
