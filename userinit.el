;; Redefined for spacemacs

(add-to-list 'package-directory-list "~/.spacemacs.d/packages")

(defvar custom-settings-dir "~/.spacemacs.d/conf")

(defun load-custom-settings ()
  "Load all settings files from custom-settings-files"
  (interactive)
  (let ((files (-filter #'(lambda (f)
                            (not (string-prefix-p "." f)))
                        (directory-files custom-settings-dir))))
    (mapc #'(lambda (file)
              (load (concat custom-settings-dir "/" file)))
          files)))


;; Exec path setup? Why is this not in spacemacs already...
(use-package exec-path-from-shell)

(exec-path-from-shell-initialize)

;; Load other settings

(load-custom-settings)
