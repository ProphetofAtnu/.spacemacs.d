;; Globals
(spacemacs/set-leader-keys "hdi" 'helm-info)
(spacemacs/declare-prefix "y" "yasnippet")
(spacemacs/set-leader-keys "yy" #'yas-expand)
(spacemacs/set-leader-keys "ys" #'spacemacs/helm-yas)
(spacemacs/set-leader-keys "yn" #'yas-new-snippet)
(spacemacs/set-leader-keys "yr" #'yas-reload-all)

(spacemacs/declare-prefix "o" "user")
(spacemacs/set-leader-keys "oc" #'helm-company)
(spacemacs/set-leader-keys "oi" #'elisp-index-search)

(spacemacs/set-leader-keys-for-major-mode 'go-mode
  "hd" 'godoc
  "hg" 'go-goto-docstring
  "ha" 'go-goto-arguments
  "hf" 'go-goto-function
  "hr" 'go-goto-return-values
  )



;; Eww? Lets try...
;; (defun oleh-eww-hook ()
;;   ;; (define-key eww-mode-map "j" 'oww-down)
;;   (define-key eww-mode-map "j" 'eww-up)
;;   (define-key eww-mode-map "k" 'eww-up)
;;   (define-key eww-mode-map "l" 'forward-char)
;;   (define-key eww-mode-map "L" 'eww-back-url)
;;   (define-key eww-mode-map "h" 'backward-char)
;;   (define-key eww-mode-map "v" 'recenter-top-bottom)
;;   (define-key eww-mode-map "V" 'eww-view-source)
;;   (define-key eww-mode-map "m" 'eww-follow-link)
;;   (define-key eww-mode-map "a" 'move-beginning-of-line)
;;   (define-key eww-mode-map "e" 'move-end-of-line)
;;   (define-key eww-mode-map "o" 'ace-link-eww)
;;   (define-key eww-mode-map "y" 'eww))
;; (add-hook 'eww-mode-hook 'oleh-eww-hook)

