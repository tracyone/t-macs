
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

(fset 'yes-or-no-p 'y-or-n-p)
;;允许直接递归删除而不询问
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;; do not auto generate dir buf
(setq dired-dwim-target t)


  (put 'dired-find-alternate-file 'disabled nil)

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

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

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
	   auto-mode-alist))

(provide 'init-better-default)
