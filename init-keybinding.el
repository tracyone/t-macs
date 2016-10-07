
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;smex simlar to ctrlp
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

;;open emacs config file
(global-set-key (kbd "<f2>") 'open-my-init-file)
(evil-leader/set-key "vc" 'open-my-init-file)
(evil-leader/set-key
  "vc" 'open-my-init-file
  "vv" 'helm-do-ag-project-root
  "bk" 'kill-buffer
  "cc" 'comment-region
  "cu" 'comment-or-uncomment-region
  "bb" 'switch-to-buffer
  "fr" 'recentf-open-files
  "g" 'counsel-git
  "p" 'counsel-find-file
  )

(global-set-key (kbd "<f1>") 'reveal-in-osx-finder)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
;;补全路径
(global-set-key (kbd "s-/") 'hippie-expand)

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;;
(global-set-key (kbd "M-s i") 'counsel-imenu)

;;正则递归搜索
(global-set-key (kbd "M-s o") 'occur-dwim)

;;expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;;iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;;用c-n和c-p来选择补全
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous)
    )

;;readline 快捷键设定
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "<f3>") 'magit-status)

(provide 'init-keybinding)
