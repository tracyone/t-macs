;; emacs config
;; author:tracyone
;; email:tracyone@live.cn
;; project url:https://github.com/tracyone/t-macs
;; date:2016-10-7 00:15 in GuangZhou

(package-initialize)

;添加外部packages源
(add-to-list 'load-path  "~/.emacs.d/lisp")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-default)
(require 'init-org)
(require 'init-keybinding)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)


