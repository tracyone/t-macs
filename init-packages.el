 (require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                           ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                          )))

     

(defvar tracyone/packages '(
                            company
                            gruvbox-theme
                            badwolf-theme
                            molokai-theme
                            color-theme-solarized
                            yoshi-theme
                            molokai-theme
                            hungry-delete
                            smex
                            swiper
                            smartparens
                            exec-path-from-shell
                            counsel
                            popwin
                            reveal-in-osx-finder
                            js2-mode
                            web-mode
                            js2-refactor
                            expand-region
                            iedit ;;多光标编辑
			    org-pomodoro
			    helm-ag
			    ;;flycheck
			    auto-yasnippet
			    evil
			    evil-leader
			    evil-easymotion
			    evil-surround
			    magit
			    window-numbering
			    powerline
			    which-key;;实时显示按键提示
			    use-package
                            ) "Default packages" )

(defun tracyone/packages-installed-p ()
  (loop for pkg in tracyone/packages
        when (not (package-installed-p pkg)) do ( return nil)
        finally (return t )))

(unless (tracyone/packages-installed-p)
  (message "%s" "Refreshing package dadabase ... ")
  (package-refresh-contents)
  (dolist (pkg tracyone/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; plugin config and load ===============================

;;Plugin setting
(use-package hungry-delete
  :config
  (global-hungry-delete-mode)
  )

(use-package smartparens
  :config
  (smartparens-global-mode t)
  ;;一些情况下不要出现两个单引号
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
  )


(use-package ivy
  :bind (
	 ("C-c C-r" . ivy-resume)
	 )
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  )


(use-package company
  :config
  (global-company-mode t)
  ;;用c-n和c-p来选择补全
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  )

(load-theme 'molokai t)

(use-package popwin
  :config
  (popwin-mode t)
  )

;;支持最近文件
(use-package recentf
  :bind (
	 ("\C-x\ \C-r" . recentf-open-files)
	 )
  :config
  (recentf-mode 1)
  )


(use-package smex
  :bind (
	 ("\C-s" . swiper)
	 )
  )

(use-package dired)

(use-package dired-x)


(use-package yasnippet
  :config
  (yas-global-mode 1)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  )

(use-package evil
  :config
  (evil-mode 1)
  (setq evil-want-C-u-scroll 1)
  )

(use-package evil-leader
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
  :config
  (window-numbering-mode)
  )

(use-package powerline
  :config
  (powerline-default-theme)
  )

(use-package evil-surround
  :config
  (global-evil-surround-mode)
  )

(use-package which-key
  :config
  (which-key-mode 1)
  (setq which-key-side-window-location 'right)
  )

(use-package evil-easymotion
  :config
  (evilem-define (kbd "W") 'evil-forward-word-begin)
  (evilem-define (kbd "B") 'evil-backward-WORD-begin)
  )

(use-package counsel
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
  :bind (
	 ;;expand region
	 ("C-=" . er/expand-region)
	 )
  )

(use-package iedit
  :bind (
	 ;;iedit
	 ("M-s e" . iedit-mode)
	 )
  )

(use-package helm-ag
  :bind (
	 ("C-c p s" . helm-do-ag-project-root)
	 )
  )

(use-package magit
  :bind (
	 ("<f3>" . magit-status)
	 )

  )

(provide 'init-packages)

