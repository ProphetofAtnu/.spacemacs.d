(setq org-todo-keywords '((type "TODO(t)"
                                "PROG(p)"
                                "HOLD(h)"
                                "ND(n)"
                                "|"
                                "CANNED(c)"
                                "DONE(d)")))
(setq org-todo-keyword-faces '(("TODO" . orange)
                               ("PROG" . blue)
                               ("HOLD" . yellow)
                               ("ND" . purple)
                               ("CANNED" . pink)
                               ("DONE" . green)))

(setq org-capture-templates
      '(("q" "Quick Capture" entry (file (concat org-directory "/globalrefile.org"))
         "TODO")
        ("r" "Reminders" entry (file (concat org-directory "/reminders.org"))
         "TODO")
        ("s" "Snippit" entry (file (concat org-directory "/snippits.org"))
         "TODO")
        ("n" "Note" entry (file (concat org-directory "/notes/notesrefile.org"))
         "TODO")
        ("j" "Journal" entry (file+olp+datetree (concat org-directory "/daily/journal.org"))
         "TODO")
        ("c" "Challenge" entry (file (concat org-directory "/reminders.org"))
         "TODO")
        ))

(setq org-hide-emphasis-markers t)

