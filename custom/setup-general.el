;; Removing the tool bar, keeping the menu bar
;;(menu-bar-mode -1)
(tool-bar-mode -1)

;; Stop generating dummy files with ~ and #
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;(windmove-default-keybindings)

;; Which key mode
;; (require 'which-key)
;; (which-key-mode)


;; rainbow-delimiters mode
(use-package rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-faces
 ;; '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 ;; '(rainbow-delimiters-depth-2-face ((t (:foreground "black"))))
 ;; '(rainbow-delimiters-depth-3-face ((t (:foreground "black"))))
 ;; '(rainbow-delimiters-depth-4-face ((t (:foreground "red"))))
 ;; '(rainbow-delimiters-depth-5-face ((t (:foreground "black"))))
 ;; '(rainbow-delimiters-depth-6-face ((t (:foreground "black"))))
 ;; '(rainbow-delimiters-depth-7-face ((t (:foreground "red"))))
 ;; '(rainbow-delimiters-depth-8-face ((t (:foreground "black"))))
 ;; '(rainbow-delimiters-depth-9-face ((t (:foreground "black"))))
 ;; '(rainbow-delimiters-unmatched-face ((t (:background "cyan"))))
 ;; Very strong
 ;; '(rainbow-delimiters-depth-1-face ((t (:foreground "red" :height 2.0))))
 ;; '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :height 1.8))))
 ;; '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow" :height 1.6))))
 ;; '(rainbow-delimiters-depth-4-face ((t (:foreground "green" :height 1.4))))
 ;; '(rainbow-delimiters-depth-5-face ((t (:foreground "blue" :height 1.2))))
 ;; '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :height 1.1))))
 ;; '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :height 1.0))))
 ;; '(rainbow-delimiters-depth-8-face ((t (:foreground "black" :height 0.9))))
 ;; '(rainbow-delimiters-unmatched-face ((t (:background "cyan" :height 0.8))))
 ;; Tradeoff
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"    :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "cyan" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"  :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "blue"   :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "black"  :weight bold))))
 '(rainbow-delimiters-unmatched-face ((t (:background "red" :weight bold))))

 )

;;;-----------------------------------------------------------------------------
;;; Editing facilities
(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When called repeatedly, append copy subsequent lines.
When `universal-argument' is called first, copy whole buffer (respects `narrow-to-region').

URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2015-09-18"
  (interactive)
  (let (ξp1 ξp2)
    (if current-prefix-arg
        (progn (setq ξp1 (point-min))
               (setq ξp2 (point-max)))
      (progn
        (if (use-region-p)
            (progn (setq ξp1 (region-beginning))
                   (setq ξp2 (region-end)))
          (progn (setq ξp1 (line-beginning-position))
                 (setq ξp2 (line-end-position))))))
    (if (eq last-command this-command)
        (progn
          (kill-append "\n" nil)
          (forward-line 1)
          (end-of-line)
          (kill-append (buffer-substring-no-properties (line-beginning-position) (line-end-position)) nil)
          (message "Line copy appended"))
      (progn
        (kill-ring-save ξp1 ξp2)
        (if current-prefix-arg
            (message "Buffer text copied")
          (message "Text copied"))))))


(defun insert-comment (comment)
  (interactive "sEnter comment: ")
  (let (space-len)
    ;;(setq space-len (/ (- (- 77 (current-column)) (length comment)) 2))
    (setq space-len (- 80 5 (length comment)  (current-column)))
    (insert
     (concat  "// "
              ;;(make-string space-len ?\s)
              comment
              " "
              (make-string space-len ?\-)
              ":")
     )
    )
  )

(global-set-key (kbd "C-c jic") 'insert-comment)
(global-set-key (kbd "C-c jcl") 'xah-copy-line-or-region)

;; To switch between windows.
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; To have the full path of the visited file in the frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; ace-window-display-mode
(require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;; Allow fill-paragraph to work nicely on bullet list
(setq paragraph-start "\f\\|[ \t]*$\\|[ \t]*[-+*] +.+$"
      paragraph-separate "$")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; web-search
(require 'web-search)

(provide 'setup-general)
