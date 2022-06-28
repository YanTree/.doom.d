;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Change frame title style
(setq frame-title-format '("BUFFER - %b"))

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
(add-load-path! "~/Library/emacs/doom-snippets")


;; Switch input type(english and chinese)
(defun emacs-ime-disable()
  (w32-set-ime-open-status nil))
(defun emacs-ime-enable()
  (w32-set-ime-open-status t))
(add-hook 'evil-insert-state-entry-hook #'emacs-ime-enable)
(add-hook 'evil-insert-state-exit-hook #'emacs-ime-disable)


;;
;;; UI

;; Frame size
(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 130))

;; load theme `one' `dracula' `vibrant' `monokai-pro'
;; `doom-tomorrow-day' `doom-nord-light'
(setq doom-theme 'doom-tomorrow-night)

;; Font setting
(when IS-WINDOWS
  (when (display-graphic-p)
    (defun set-font (english chinese english-size chinese-size unicode)
      ;; English font
      (set-face-attribute 'default nil :font
                          (format   "%s:pixelsize=%d"  english english-size))
      ;; all unicode characters
      (set-fontset-font t 'unicode unicode nil 'prepend)
      ;; Chinese characters
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family chinese :size chinese-size)))
      (run-hooks 'after-setting-font-hook))
    (set-font "Consolas" "LXGW WenKai" 14 14 "Segoe UI Symbol")))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))


;;
;;; Modules

;;; :editor evil
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)


;;; :UI doom-dashboard
;; (setq fancy-splash-image (concat doom-private-dir "cat.png"))
;; Hide the menu for as minimalistic a startup screen as possible.
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)


;;; :UI modeline
;; An evil mode indicator is redundant with cursor shape
(advice-add #'doom-modeline-segment--modals :override #'ignore)


;;; :tools lsp
;; Disable invasive lsp-mode features
(after! lsp-mode
  (setq lsp-enable-symbol-highlighting nil
        ;; If an LSP server isn't present when I start a prog-mode buffer, you
        ;; don't need to tell me. I know. On some machines I don't care to have
        ;; a whole development environment for some ecosystems.
        lsp-enable-suggest-server-download nil))
(after! lsp-ui
  (setq lsp-ui-sideline-enable nil  ; no more useful than flycheck
        lsp-ui-doc-enable nil))     ; redundant with K


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
