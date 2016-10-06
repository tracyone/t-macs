;(package-initialize)
;添加外部packages源
(add-to-list 'load-path  "~/.emacs.d/lisp")

(require 'init-packages)

(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(electric-indent-mode t)
(setq inhibit-splash-screen t)

;;激活缩写模式
(abbrev-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)


;; 细条状的光标
(setq-default cursor-type 'bar)
(setq make-backup-files nil)



;;支持最近文件
(require 'recentf)
(recentf-mode 1)
;; 用Ctrl-x Ctrl-r打开最近文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 全屏

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(setq auto-save-default nil)

(setq make-backup-files nil)



;; highlight match

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

;;高亮显示当前行
(global-hl-line-mode t)

(global-auto-revert-mode t)

;;Plugin setting
(require 'hungry-delete)
(global-hungry-delete-mode)


(require 'smex)
;;(global-set-key (kbd "M-x") 'smex)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 4)
 '(package-selected-packages (quote (smex hungry-delete monokai-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
