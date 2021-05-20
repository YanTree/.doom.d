;;; lisp/+bindings.el -*- lexical-binding: t; -*-

;;
;;; Global
;; Shift <left> <right> <up> <down> move cursor
(windmove-default-keybindings)

(map!
 (:map override
  "C-x C-r"   #'recentf-open-files
  "C-h C-f"   #'find-function
  "C-h C-v"   #'find-variable
  "C-h C-k"   #'find-function-on-key

  "C-S-d"     #'delete-current-line
  "C-c n"     #'cleanup-buffer)

  "C-s"       #'swiper-isearch
  "C-="       #'er/expand-region

  ;; multiple-cursors
  "C->"       #'mc/mark-next-like-this
  "C-<"       #'mc/mark-previous-like-this
  "C-r"       #'mc/mark-all-dwim

  ;; move dup
  [M-S-up]    #'move-dup-duplicate-up
  [M-S-down]  #'move-dup-duplicate-down)
