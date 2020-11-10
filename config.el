;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


(setq user-full-name "YanTree"
      user-mail-address "yantreeland@outlook.com"

      doom-scratch-initial-major-mode 'lisp-interaction-mode

      ;; I like `doom-monokai-pro' theme, Flagship `doom-one-light'.
      doom-theme 'doom-monokai-pro

      ;; `nil', disabled line numbers. `relative', enable relative line numbers.
      display-line-numbers-type t

      ;; company
      company-idle-delay 2)


;;
;;; UI

(when IS-WINDOWS
  (when (display-graphic-p)
    (defun set-font (english chinese english-size chinese-size)
      (set-face-attribute 'default nil :font
                          (format   "%s:pixelsize=%d"  english english-size))
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family chinese :size chinese-size))))
    (set-font "JetBrains Mono" "WenQuanYi Micro Hei" 16 14)
    ))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))


;;
;;; Modules

(after! ivy
  ;; I prefer search matching to be ordered; it's more precise
  (add-to-list 'ivy-re-builders-alist '(counsel-projectile-find-file . ivy--regex-plus)))

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;;; :ui time
(setq display-time-24hr-format t
      display-time-format " %H:%M - %b %d"                    ;;格式
      display-time-load-average-threshold nil                 ;;不显示 load average
      system-time-locale "C")                                 ;;英文显示日期
(display-time-mode 1)

;;; :lang org
(setq
 org-directory "~/Documents/org"
 org-hide-leading-stars t         ;; hide stars
 org-export-coding-system 'utf-8
 org-use-sub-superscripts nil     ;; the_sliver_search
 )
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
