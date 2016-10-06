(with-eval-after-load 'org)

(setq org-agenda-files '("~/.emacs.d"))

(setq org-src-fontify-natively t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "Workspace")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("n" "notes" entry (file+headline "~/.emacs.d/notes.org" "Quick notes")
         "* %?\n  %i\n %U"
         :empty-lines 1)
        ("b" "Blog Ideas" entry (file+headline "~/.emacs.d/notes.org" "Blog Ideas")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("s" "Code Snippet" entry
         (file "~/.emacs.d/snippets.org")
         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
        ("c" "Chrome" entry (file+headline "~/.emacs.d/notes.org" "Quick notes")
         "* TODO [#C] %?\n %(tracyone/retrieve-chrome-current-tab-url)\n %i\n %U"
         :empty-lines 1)
        ("l" "links" entry (file+headline "~/.emacs.d/notes.org" "Quick notes")
         "* TODO [#C] %?\n  %i\n %a \n %U"
         :empty-lines 1)
        ("j" "Journal Entry"
         entry (file+datetree "~/.emacs.d/journal.org")
         "* %?"
         :empty-lines 1)))


(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)
