
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

(provide 'init-better-default)
