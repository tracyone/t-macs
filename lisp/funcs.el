
(defun t-macs/evil-quick-replace (beg end )
  (interactive "r")
  (when (evil-visual-state-p)
    (evil-exit-visual-state)
    (let ((selection (regexp-quote (buffer-substring-no-properties beg end))))
      (setq command-string (format "%%s /%s//g" selection))
      (minibuffer-with-setup-hook
	  (lambda () (backward-char 2))
	(evil-ex command-string)))))


(defun t-macs/remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun t-macs/hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


(defun t-macs/insert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  ((defun t-macs/retrieve-chrome-current-tab-url()
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
       (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))insert (t-macs/retrieve-chrome-current-tab-url)))


(defun t-macs/occur-dwim ()
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


;; web-mode
  (defun t-macs/my-web-mode-indent-setup ()
    (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
    (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
    (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
    )


;;js2-refactor
  (defun t-macs/js2-imenu-make-index ()
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

(defadvice evil-search-next (after advice-for-evil-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-search-previous (after advice-for-evil-search-previous activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(provide 'funcs)
