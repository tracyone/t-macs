 (require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  )

(defvar tracyone/packages '(
                            company
                            monokai-theme
                            hungry-delete
                            smex
                            swiper
                            smartparens
                            exec-path-from-shell
                            counsel
                            popwin
                            reveal-in-osx-finder
                            js2-mode
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


(global-hungry-delete-mode)

(smartparens-global-mode t)
;;一些情况下不要出现两个单引号
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

;;支持最近文件
(require 'recentf)
(recentf-mode 1)

;;Plugin setting
(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smex)

(require 'dired)
(require 'dired-x)
;;(global-set-key (kbd "M-x") 'smex)


(provide 'init-packages)
