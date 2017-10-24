(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map (kbd "<up>") 'nil)))

(add-hook 'eshell-mode-hook
          '(lambda () (define-key eshell-mode-map (kbd "<down>") 'nil)))
