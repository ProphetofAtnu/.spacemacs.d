;;; packages.el --- js-addon layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Jacob Scaggs <jacsc@Shangri-La>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `js-addon-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `js-addon/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `js-addon/pre-init-PACKAGE' and/or
;;   `js-addon/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst js-addon-packages
  '(nodejs-repl
    mmm-mode
    web-mode
    vue-mode))

(defun js-addon/init-nodejs-repl ()
  (use-package nodejs-repl
    :init
    (progn
      (spacemacs/declare-prefix-for-mode 'js2-mode "mn" "Node")
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ne" 'nodejs-repl-send-last-expression)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nj" 'nodejs-repl-send-line)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nr" 'nodejs-repl-send-region)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "nl" 'nodejs-repl-load-file)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "n'" 'nodejs-repl-switch-to-repl)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ns" 'nodejs-repl-switch-to-repl))))

(defun js-addon/init-vue-mode ()
  (use-package vue-mode
    :init
    (progn
      (require 'company)
      (require 'company-tern)
      (add-to-list 'company-backends 'company-tern))
    :config
    (add-to-list 'vue-mode-hook (lambda ()
                                  (company-mode t)
                                  (tern-mode t)
                                  (add-to-list 'company-backends 'company-tern))
                 )))

(defun js-addon/post-init-mmm-mode ()
  (use-package mmm-mode
    :config
    (progn
      (setq mmm-js-mode-exit-hook (lambda () (setq tern-mode nil)))
      (setq mmm-js-mode-enter-hook (lambda () (setq tern-mode t))))))

(defun js-addon/post-init-web-mode ()
  (use-package web-mode))
;;; packages.el ends here
