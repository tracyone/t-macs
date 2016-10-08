
(setq ring-bell-function 'ignore)
(global-auto-revert-mode t)
;;激活缩写模式
(abbrev-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(electric-indent-mode t)

;;不询问是否编辑git文件的链接文件
(setq vc-follow-symlinks t)


(add-to-list 'exec-path "/usr/local/bin")


;;高亮显示当前行
(global-hl-line-mode t)
(delete-selection-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(fset 'yes-or-no-p 'y-or-n-p)
;;允许直接递归删除而不询问
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;; do not auto generate dir buf
(setq dired-dwim-target t)

(set-language-environment "UTF-8")

  (put 'dired-find-alternate-file 'disabled nil)

    ;reveal-in-osx-finder   It is bound to RET, a.
    ;(indent-rSpacemacsegion (point-min) (point-max)))



;;光标放在文字中间的时候也高亮两边的括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
               "Highlight enclosing parens."
               (cond ((looking-at-p "\\s(") (funcall fn))
                     (t (save-excursion
                          (ignore-errors (backward-up-list))
                          (funcall fn)))))

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; config js2-mode for js files
(setq auto-mode-alist
	  (append
	   '(("\\.js\\'" . js2-mode))
	   '(("\\.html\\'" . web-mode))
	   auto-mode-alist))


(add-hook 'web-mode-hook 't-macs/my-web-mode-indent-setup)


(add-hook 'js2-mode-hook
          (lambda ()
            (setq imenu-create-index-function 't-macs/js2-imenu-make-index)))




(provide 'init-better-default)
