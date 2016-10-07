
(setq ring-bell-function 'ignore)
(global-auto-revert-mode t)
(global-linum-mode t)
;;激活缩写模式
(abbrev-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(electric-indent-mode t)


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
	   '(("\\.html\\'" . web-mode))
	   auto-mode-alist))

;; web-mode
  (defun my-web-mode-indent-setup ()
    (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
    (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
    )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)


;;js2-refactor

  (defun js2-imenu-make-index ()
    (interactive)
    (save-excursion
      ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
      (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
                                 ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
                                 ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                 ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
                                 ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
                                 ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
                                 ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
          (lambda ()
            (setq imenu-create-index-function 'js2-imenu-make-index)))

(defun occur-dwim ()
"Call `occur' with a sane default."
(interactive)
(push (if (region-active-p)
        (buffer-substring-no-properties
          (region-beginning)
          (region-end))
        (let ((sym (thing-at-point 'symbol)))
          (when (stringp sym)
            (regexp-quote sym))))
      regexp-history)
(call-interactively 'occur))

(defun tracyone/insert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (insert (tracyone/retrieve-chrome-current-tab-url)))

(defun tracyone/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
                 (concat
                  "set frontmostApplication to path to frontmost application\n"
                  "tell application \"Google Chrome\"\n"
                  "	set theUrl to get URL of active tab of first window\n"
                  "	set theResult to (get theUrl) \n"
                  "end tell\n"
                  "activate application (frontmostApplication as text)\n"
                  "set links to {}\n"
                  "copy theResult to the end of links\n"
                  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

(provide 'init-better-default)
