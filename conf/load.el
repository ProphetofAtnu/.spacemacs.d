;; (when (file-exists-p "~/.roswell/lisp/quicklisp/slime-helper.el")
;;   (load (expand-file-name "~/.roswell/lisp/quicklisp/slime-helper.el")))

;; (when (file-exists-p "~/.roswell/helper.el")
;;   (load (expand-file-name "~/.roswell/helper.el")))

;; (setq inferior-lisp-program "ros -Q run")

(when (file-exists-p "~/quicklisp/clhs-use-local.el")
  (load "~/quicklisp/clhs-use-local.el" t))

(when (file-exists-p "~/quicklisp/slime-helper.el")
  (load "~/quicklisp/slime-helper.el" t))
