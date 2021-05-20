;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load! "lisp/+utils")
(load! "lisp/+bindings")

(setq user-full-name "YanTree"
      user-mail-address "yantreeland@outlook.com"

      doom-scratch-initial-major-mode 'lisp-interaction-mode
      doom-theme 'doom-monokai-pro

      display-line-numbers-type t
      company-idle-delay 0.7)


;;
;;; Font
(setq doom-font (font-spec :family "Jetbrains Mono" :size 15 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Noto Serif" :size 16)
      ivy-posframe-font (font-spec :family "Jetbrains Mono" :size 18))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))


;;
;;; Modules
(after! ivy
  ;; I prefer search matching to be ordered; it's more precise
  (add-to-list 'ivy-re-builders-alist '(counsel-projectile-find-file . ivy--regex-plus)))

;;; :lang org
(setq
 org-directory "~/Documents/org"
 org-hide-leading-stars t         ;; hide stars
 org-export-coding-system 'utf-8
 org-use-sub-superscripts nil)

;;; :lang scheme
(after! geiser
  (if IS-WINDOWS
      (setq geiser-chez-binary "C:\\Program Files\\Chez Scheme 9.5.4\\bin\\ta6nt\\scheme")))

;;; :UI doom-dashboard
;; `https://github.com/tecosaur/emacs-config/blob/master/misc/splash-images'
;;(setq fancy-splash-image (concat doom-private-dir "splash.png"))
;; Hide the menu for as minimalistic a startup screen as possible.
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)


;;
;; Additional Packages
(use-package! beacon
  :config
  (setq-default beacon-lighter ""
                beacon-size 17)
  (beacon-mode 1))
