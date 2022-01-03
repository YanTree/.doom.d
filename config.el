;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "YanTree"
      user-mail-address "yantreeland@outlook.com")


;; Set `lisp-interaction-mode' with initial major mode
(setq doom-scratch-initial-major-mode 'lisp-interaction-mode)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t
      ;; exit no confirm
      confirm-kill-emacs nil)

;; My customize snippets(additional!)
(add-load-path! "~/Library/emacs/snippets")


;; Switch input type(english and chinese)
(defun emacs-ime-disable()
  (w32-set-ime-open-status nil))
(defun emacs-ime-enable()
  (w32-set-ime-open-status t))
(add-hook 'evil-insert-state-entry-hook #'emacs-ime-enable)
(add-hook 'evil-insert-state-exit-hook #'emacs-ime-disable)

;;
;;; Theme & Font

;; Frame size
(add-to-list 'default-frame-alist '(height . 54))
(add-to-list 'default-frame-alist '(width . 162))

;; load theme `one' `dracula' `vibrant' `monokai-pro'
(setq doom-theme 'doom-one)

;; English & Chinese Font
(setq doom-font (font-spec :family "Consolas" :size 14 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "WenQuanYi Micro Hei" :size 12))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))


;;
;;; Modules

;;; :editor evil

;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)


;;; :lang org
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Library/org/")


;;
;;; 3rd Packages
(use-package! fanyi
  :config
  ;; Setting sound player
  (setq fanyi-sound-player "mpv")
  ;; Toggle fast translate with a keybinding
  (map! :leader
        (:prefix-map ("t" . "toggle")
         :desc "Translate"      "t" #'fanyi-dwim2)))

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
