(autoload 'js2-jsx-mode "js2-jsx-mode"
  "Load JS2 JSX mode on .jsx files" t)
(add-to-list 'auto-mode-alist
             '("\\.jsx\\'" . js2-jsx-mode))

(with-eval-after-load 'js2-mode
  (setq-default js2-basic-offset 2
                js-indent-level 2
                js2-bounce-indent-p t)
)
