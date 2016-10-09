

;;smex simlar to ctrlp

;;open emacs config file
(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key (kbd "<f1>") 'reveal-in-osx-finder)

;;补全路径
(global-set-key (kbd "s-/") 'hippie-expand)

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;;正则递归搜索
(global-set-key (kbd "M-s o") 't-macs/occur-dwim)

(global-set-key (kbd "<f4>") 'eshell)

;;readline 快捷键设定
(global-set-key (kbd "C-w") 'backward-kill-word)



(provide 'init-keybinding)

