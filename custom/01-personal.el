(add-hook 'window-configuration-change-hook
          (lambda ()
            (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 1 0)))



(set-face-attribute 'mode-line nil
                    :foreground "White"
                    :background "gray12";"white"
                    :box '(:line-width 3 :color "gray12"))

(set-face-attribute 'mode-line-inactive nil
                    :foreground "White"
                    :background "grey5";"white"
                    :height 100
                    :box '(:line-width 3 :color "grey5")
                    :underline nil ;; (face-foreground 'vertical-border)
                    :overline nil ;; (face-foreground 'vertical-border)
                    ;;:height 200
                    :inverse-video nil)

(load-theme 'sanityinc-tomorrow-bright)


(setq-default mode-line-format
  (list
   ;; the buffer name; the file name as a tool tip
   ;; (second mode-line-modified)
   " "
   '(:eval (if (string= "*" (substring (buffer-name) 0 1) )
               (propertize "" 'face
                           'mode-line-folder-face)
            (propertize (shorten-directory default-directory 10) 'face
                        (if (buffer-modified-p)
                            'font-lock-warning-face
                          'font-lock-keyword-face))))
   '(:eval  (propertize "%b" 'face (if (buffer-modified-p)
                                       'font-lock-warning-face
                                     'font-lock-keyword-face)
        'help-echo (buffer-file-name)))
   " "
    (propertize "L%1l" 'face 'font-lock-type-face)


    " "

    '(:eval (propertize "%m" 'face 'font-lock-string-face
              'help-echo buffer-file-coding-system))

    '(:eval (when  vc-mode
              (concat " "(propertize
               (replace-regexp-in-string "Git-" "Git:"
               (replace-regexp-in-string "^ " "" vc-mode)) 'face 'warning))))

    '(:eval (replace-regexp-in-string "^ " " " (propertize (format-mode-line minor-mode-alist) 'face 'font-lock-preprocessor-face)))
    ))


(defalias 'yes-or-no-p 'y-or-n-p)
(setq user-full-name "Griffith, Alexander")
(setq user-email "griffitaj@gmail.com")
(add-hook 'before-save-hook 'whitespace-cleanup)
(setq auto-save-list-file-prefix "~/.emacs.d/autosaves/.saves-")
(setq auto-save-interval 100)
(setq backup-directory-alist '(("." .  "~/.emacs.d/.cache/backup/")))
(setq delete-by-moving-to-trash nil)
(setq version-control t)
(setq kept-old-versions 10)
(setq kept-new-versions 20)
(setq delete-old-versions t)
(setq backup-by-copying t)
(blink-cursor-mode -1)
(setq visible-bell t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(delete-selection-mode)
(electric-pair-mode t)
(setq-default indent-tabs-mode nil)

(global-auto-revert-mode 1)
(add-hook 'dired-mode-hook 'auto-revert-mode)

(require 'counsel)
(global-set-key (kbd "M-x") 'counsel-M-x)



(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat "" output)))
    output))

(defun scratch()
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*")))

(require 'erlang-start)

(defun erl-hook-fun ()
  ;;(setq inferior-erlang-machine-options
  ;;      '("-sname" "emacs" "-setcookie" "QBURHVADTLAULDSDNAOX" "-remsh" "test@dev"))
  (setq inferior-erlang-machine-options
        '("-sname" "engine2"))
  )

(add-hook 'erlang-mode-hook 'erl-hook-fun)

(push "/home/griffita/.emacs.d/distel/elisp/" load-path)
(require 'distel)
(distel-setup)

(require 'company-distel)


;; (with-eval-after-load 'company
 ;;  (add-to-list 'company-backends 'company-distel))

(add-hook 'erlang-mode-hook
          (lambda ()
            (setq company-backends '(company-distel))))



;;(require 'company-distel-frontend)
;; (require 'flycheck)

;; (flycheck-define-checker erlang-otp
;;                          "An Erlang syntax checker using the Erlang interpreter."
;;                          :command ("erlc" "-o" temporary-directory "-Wall"
;;                                    "-I" "../include" "-I" "../../include"
;;                                    "-I" "../../../include" source)
;;                          :error-patterns
;;                          ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
;;                           (error line-start (file-name) ":" line ": " (message) line-end)))

;; (add-hook 'erlang-mode-hook
;;           (lambda ()
;;             (flycheck-select-checker 'erlang-otp)
;;                         (flycheck-mode)))

;; (require 'flymake)
;; (defun flymake-erlang-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "/home/griffita/.emacs.d/bin/eflymake" (list local-file))))



;; (add-to-list 'flymake-allowed-file-name-masks
;;              '("\\.erl\\'" flymake-erlang-init))

;; (defun my-erlang-mode-hook ()
;;         (flymake-mode 1))
;; (add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

(setq httpd-port 11000)

;; (require 'neotree)

;; (defun neotree-currentdir()
;;   (interactive)
;;   (neotree-dir default-directory))

;; (global-set-key (kbd "C-c C-d") 'neotree-currentdir)
