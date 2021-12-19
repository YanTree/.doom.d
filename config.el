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
(add-load-path! "~/projects/emacs/snippets")


;;
;;; Theme & Font

;; Frame size
(add-to-list 'default-frame-alist '(height . 68))
(add-to-list 'default-frame-alist '(width . 192))

;; load theme `doom-one' `doom-monokai-pro'
(setq doom-theme 'doom-one)

;; English & Chinese Font
(setq doom-font (font-spec :family "Consolas" :size 14 :weight 'semi-light)
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
(setq org-directory "~/org/")


;;
;;; 3rd Packages

;; (use-package! youdao-dictionary
;;   :commands youdao-dictionary-play-voice-of-current-word
;;   :init
;;   ;; (map! :leader
;;   ;;     (:prefix-map ("t" . "toggle")
;;   ;;      (:prefix ("t" . "journal")
;;   ;;       :desc "New journal entry"    "t" #'remacs-youdao-dictionary-search-at-point
;;   ;;       :desc "Search journal entry" "?" #'youdao-dictionary-hydra/body)))
;;   ;; (map! "SPC t t"  #'remacs-youdao-dictionary-search-at-point
;;   ;;       "SPC t ?"  #'youdao-dictionary-hydra/body)

;;   (setq url-automatic-caching t
;;         youdao-dictionary-use-chinese-word-segmentation t) ; 中文分词

;;   (defun remacs-youdao-dictionary-search-at-point ()
;;     "Search word at point and display result with `posframe', `pos-tip', or buffer."
;;     (interactive)
;;     (if (display-graphic-p)
;;         (youdao-dictionary-search-at-point-posframe)
;;       (youdao-dictionary-search-at-point)))
;;   :config
;;   (with-no-warnings
;;     (defun my-youdao-dictionary--posframe-tip (string)
;;       "Show STRING using posframe-show."
;;       (unless (and (require 'posframe nil t) (posframe-workable-p))
;;         (error "Posframe not workable"))

;;       (let ((word (youdao-dictionary--region-or-word)))
;;         (if word
;;             (progn
;;               (with-current-buffer (get-buffer-create youdao-dictionary-buffer-name)
;;                 (let ((inhibit-read-only t))
;;                   (erase-buffer)
;;                   (youdao-dictionary-mode)
;;                   (insert (propertize "\n" 'face '(:height 0.5)))
;;                   (insert string)
;;                   (insert (propertize "\n" 'face '(:height 0.5)))
;;                   (set (make-local-variable 'youdao-dictionary-current-buffer-word) word)))
;;               (posframe-show youdao-dictionary-buffer-name
;;                              :position (point)
;;                              :left-fringe 16
;;                              :right-fringe 16
;;                              :background-color (face-background 'tooltip nil t)
;;                              :internal-border-color (face-foreground 'font-lock-comment-face nil t)
;;                              :internal-border-width 1)
;;               (unwind-protect
;;                   (push (read-event) unread-command-events)
;;                 (progn
;;                   (posframe-hide youdao-dictionary-buffer-name)
;;                   (other-frame 0))))
;;           (message "Nothing to look up"))))
;;     (advice-add #'youdao-dictionary--posframe-tip)))

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
