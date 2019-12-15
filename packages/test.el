;;; -*- lexical-binding: t; -*-

(load (expand-file-name "./scratchy.el"))

;; Test the schy-gen methods:

(let ((gentest (schy-gen-create "test" "test-lang")))
  (progn
    (minibuffer-message gentest)
    (let ((outpath (schy-gen-init gentest)))
      (with-output-to-temp-buffer "*output*"
        (princ (format "Initialized in %s\n" outpath))
        ;; See what was created
        (princ (shell-command-to-string (format "ls -laR %s" outpath)))
        ;; Cleanup test files
        (dolist (d (directory-files schy-dir t directory-files-no-dot-files-regexp))
          (delete-directory d t))))))
