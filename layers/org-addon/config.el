;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook 'org-unison-sync nil t)))

(setq org-directory "~/org")
(setq org-agenda-files (list "~/org/"))
(if (eq system-type 'windows-nt)
    (setq org-mobile-directory "/plink:cultofatnu.org:/home/jacsc/mobile")
  (setq org-mobile-directory "/ssh:cultofatnu.org:/home/jacsc/mobile"))

(setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
                                        ; Refile on top of file max
(setq org-refile-use-outline-path 'file)
                                        ; use a depth level of 6 max
(setq org-refile-targets
      '((org-agenda-files . (:maxlevel . 4))))

(setq org-log-into-drawer t)

(setq org-outline-path-complete-in-steps nil)

(with-eval-after-load 'org
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "M-RET" 'org-meta-return))

;; Configure some variables
(setq diary-file "~/org/diary")
