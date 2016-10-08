 (require 'cl)

(setq package-enable-at-startup nil)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                           ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                          )))

     
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; plugin config and load ===============================

(use-package gruvbox-theme
 :ensure t
 )
(use-package badwolf-theme
 :ensure t
 )
(use-package molokai-theme
 :ensure t
 )
(use-package yoshi-theme
 :ensure t
 )
(use-package exec-path-from-shell
 :ensure t
 )
(use-package reveal-in-osx-finder
 :ensure t
 )
(use-package js2-mode
 :ensure t
 )
(use-package web-mode
 :ensure t
 )
(use-package js2-refactor
 :ensure t
 )

(use-package molokai-theme
 :ensure t
 )
(use-package org-pomodoro
 :ensure t
 )
(use-package auto-yasnippet
 :ensure t
 )
;;Plugin setting
(use-package hungry-delete
 :ensure t
  :config
  (global-hungry-delete-mode)
  )

(use-package smartparens
 :ensure t
  :config
  (smartparens-global-mode t)
  ;;一些情况下不要出现两个单引号
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
  )


(use-package ivy
 :ensure t
  :bind (
	 ("C-c C-r" . ivy-resume)
	 )
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  )


(use-package company
  :ensure t
  :init (global-company-mode)
  :defer t
  :config
  ;;用c-n和c-p来选择补全
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  :diminish company-mode
  )

;(use-package ycmd
 ;:ensure t
  ;:config
  ;(global-ycmd-mode t)
  ;(set-variable 'ycmd-server-command '("python" "~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd"))
  ;(set-variable 'ycmd-global-config "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/.ycm_extra_conf.py")
  ;)

;(use-package company-ycmd
 ;:ensure t
  ;:config
  ;(company-ycmd-setup)
  ;(global-company-mode t)  
  ;)


(use-package popwin
 :ensure t
  :config
  (popwin-mode t)
  )

;;支持最近文件
(use-package recentf
 :ensure t
  :bind (
	 ("\C-x\ \C-r" . recentf-open-files)
	 )
  :config
  (recentf-mode 1)
  )

(use-package smex
 :ensure t
  )

(use-package swiper
 :ensure t
  :bind (
	 ("\C-s" . swiper)
	 )
  )

(use-package dired)

(use-package dired-x)


(use-package yasnippet
 :ensure t
  :config
  (yas-global-mode 1)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  )

(use-package key-chord
  :ensure t
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-mode 1)
  )

(use-package evil
  :init
  (setq evil-want-C-u-scroll 1)
  (evil-mode 1)
  :ensure t
  :config
  (define-key evil-insert-state-map "\C-e" 'end-of-line)
  (define-key evil-insert-state-map "\C-a" 'beginning-of-line)
  (define-key evil-insert-state-map "\C-h" 'backward-delete-char)
  (define-key evil-insert-state-map "\C-u" 'kill-line)
  (define-key evil-insert-state-map "\C-n" 'evil-next-line)
  (define-key evil-insert-state-map "\C-p" 'evil-previous-line)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-r") 't-macs/evil-quick-replace)
  )

(use-package evil-magit
  :ensure t
  )

;; 用于lisp编程的
(use-package lispy
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 0)))
  )

(use-package evil-leader
 :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
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
  )

(use-package window-numbering
 :ensure t
  :config
  (window-numbering-mode)
  )

(use-package powerline
 :ensure t
  :config
  (powerline-default-theme)
  )

(use-package evil-surround
 :ensure t
  :config
  (global-evil-surround-mode)
  )

(use-package which-key
 :ensure t
  :config
  (which-key-mode 1)
  )

(use-package evil-easymotion
 :ensure t
  :config
  (evilem-define (kbd "W") 'evil-forward-word-begin)
  (evilem-define (kbd "B") 'evil-backward-word-begin)
  )

(use-package counsel
 :ensure t
  :bind (
	  ( "M-x" . counsel-M-x)
	  ( "C-x C-f" . counsel-find-file)
	  ( "<f1> f" . counsel-describe-function)
	  ("<f1> v" . counsel-describe-variable)
	  ("<f1> l" . counsel-load-library)
	  ("C-c g" . counsel-git)
	  ("C-c j" . counsel-git-grep)
	  ("C-c k" . counsel-ag)
	  ("C-x l" . counsel-locate)
	  ("C-S-o" . counsel-rhythmbox)
	  ("M-s i" . counsel-imenu)
	  )
  )

(use-package expand-region
 :ensure t
  :bind (
	 ;;expand region
	 ("C-=" . er/expand-region)
	 )
  )

(use-package iedit
 :ensure t
  :bind (
	 ;;iedit
	 ("C--" . iedit-mode)
	 )
  )

(use-package helm-ag
 :ensure t
  :bind (
	 ("C-c p s" . helm-do-ag-project-root)
	 )
  )

(use-package magit
 :ensure t
  :bind (
	 ("<f3>" . magit-status)
	 )

  )
(use-package relative-line-numbers
  :ensure t
  :config
  (global-relative-line-numbers-mode t)
  )

(use-package youdao-dictionary
  :ensure t
  :init
  (setq url-automatic-caching t)
  :bind (
	 ( "C-c y" . youdao-dictionary-search-at-point)
	 )

  )

(provide 'init-packages)


