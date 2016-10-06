
(setq ring-bell-function 'ignore)
(global-auto-revert-mode t)
(global-linum-mode t)
;;激活缩写模式
(abbrev-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(electric-indent-mode t)

;;高亮显示当前行
(global-hl-line-mode t)
(delete-selection-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


  (defun indent-buffer ()
    "Indent the currently visited buffer."
    (interactive)
    (indent-region (point-min) (point-max)))
    ;reveal-in-osx-finder   It is bound to RET, a.
    ;(indent-rSpacemacsegion (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
      (progn
        (indent-region (region-beginning) (region-end))
        (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))


(provide 'init-better-default)
