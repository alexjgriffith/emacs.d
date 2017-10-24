(require 'company)
(setq company-mode-idle-delay 0.1)
(setq company-minimum-prefix-length 2)

(require 'company-distel)
;; (add-to-list 'company-backends 'company-distel)
;; (setq company-distel-popup-help t)
;; (setq company-distel-popup-height 30)

;; (add-to-list 'company-backends 'company-elisp)


(setq company-backends
      '((company-files          ; files & directory
         company-keywords       ; keywords
         company-capf
         company-yasnippet
         )
        (company-abbrev company-dabbrev)
        ))

(defun my-company-erlang ()
  (add-to-list (make-local-variable 'company-backends) 'company-distel))


(defun my-company-elisp ()
  (message "elisp hook")
  (add-to-list (make-local-variable 'company-backends) 'company-elisp))

(add-hook 'erlang-mode-hook 'my-company-erlang)

(add-hook 'emacs-lisp-mode-hook 'my-company-elisp)




(global-set-key (kbd "M-/") 'company-manual-begin)
(add-hook 'after-init-hook 'global-company-mode)


;; (defun complete-or-indent ()
;;   (interactive)
;; (if (looking-at "\\_>")
;;      (company-manual-begin)
;;   (indent-according-to-mode)))

;; (global-set-key (read-kbd-macro "TAB") 'complete-or-indent)
