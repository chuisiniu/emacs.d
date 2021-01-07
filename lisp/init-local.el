;;; code:
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

(require-package 'elpy)
(require 'elpy nil t)

(when (require 'elpy nil t)
  (elpy-enable)
  (add-hook 'python-mode-hook 'elpy-mode))
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))
;; org-mode GTD setting
(setq org-directory "~/doc/org/")
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq my-org-todo-file (concat org-directory "/todo.org"))
(setq my-org-note-file (concat org-directory "/note.org"))
(setq my-org-project-file (concat org-directory "/project.org"))
(setq org-agenda-files (list org-default-notes-file
                             my-org-todo-file
                             my-org-project-file
                             ))

(setq org-capture-templates
      `(("c" "Collect" entry (file org-default-notes-file)  ; "" => `org-default-notes-file'
         "\n* %? %T\n\n" :clock-resume t)
        ("t" "Todo" entry (file+headline my-org-todo-file "Todos")
         "\n** TODO %?\n\n" :clock-resume t)
        ("i" "Idea" entry (file+headline my-org-todo-file "Ideas")
         "\n** %? %T\n\n" :clock-resume t)
        ("n" "Note" entry (file my-org-note-file)
         "\n* %? %T\n\n" :clock-resume t)
        ("p" "Project")
        ("pt" "TSA" entry (file+headline my-org-project-file "TSA")
         "\n** TODO %?\n\n" :clock-resume t)
        ("pi" "威胁情报" entry (file+headline my-org-project-file "威胁情报")
         "\n** TODO %?\n\n" :clock-resume t)
        )
      )

(color-theme-sanityinc-tomorrow-bright)
(setq org-export-backends (quote (ascii html icalendar latex md)))
(provide 'init-local)
;;; init-local.el ends here
