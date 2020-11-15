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
      company-idle-delay 1.2)


;;
;;; Font
(when (display-graphic-p)
  (defun font-installed-p (font-name)
    "Check if font with FONT-NAME is available."
    (find-font (font-spec :name font-name)))

  ;; Set default font
  (cl-loop for font in '("JetBrains Mono" "Fira Code")
           when (font-installed-p font)
           return (set-face-attribute 'default nil
                                      :font font
                                      :height (cond (IS-MAC 130)
                                                    (IS-WINDOWS 100)
                                                    (t 100))))

  ;; Specify font for all unicode characters
  (cl-loop for font in '("Symbola" "Symbol")
           when (font-installed-p font)
           return(set-fontset-font t 'unicode font nil 'prepend))

  ;; Specify font for Chinese characters
  (cl-loop for font in '("WenQuanYi Micro Hei" "Microsoft Yahei")
           when (font-installed-p font)
           return (set-fontset-font t '(#x4e00 . #x9fff) font)))

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

;;; :lang scheme
(after! geiser
  (if IS-WINDOWS
      (setq geiser-chez-binary "C:\\Program Files\\Chez Scheme 9.5.4\\bin\\ta6nt\\scheme")))


;;
;;; addtional packages

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
