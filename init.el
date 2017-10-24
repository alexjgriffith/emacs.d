;; (package-initialize)

(setq default-directory "~/")

(require 'cask "~/.cask/cask.el")

(cask-initialize)

(require 'pallet)
(pallet-mode t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages
   (quote
    (ag lex counsel-projectile projectile nodejs-repl web-mode neotree dirtree company-distel flycheck flycheck-tip distel-completion-lib erlang esup writeroom-mode smart-mode-line rope-read-mode rainbow-delimiters pallet openwith mode-icons markdown-mode magit impatient-mode flyspell-lazy ess-R-object-popup ess-R-data-view emojify elpy el-mock discover counsel company-jedi color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(mapc 'load (directory-files "~/.emacs.d/custom" t "^[0-9]+.*\.el$"))
