;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org mode customisation is done            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'org)
(use-package flycheck)
(require 'flycheck)


(setq org-todo-keywords
      '((sequence "TODO" "DELEGATED" "STOPPED" "WAITING" "DONE" )))

(add-hook 'org-mode-hook (lambda ()
                           ;; (ispell-change-dictionary "en")
                           (flyspell-mode)
                           (set-fill-column 80)
                           (auto-fill-mode)
                           ;; (bline-minor-mode)
                           ))
(ispell-change-dictionary "en")

(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c C-x t") #'ispell-change-dictionary)))


;; (if window-system
;;     (progn
;;       ;; We try to beautify org mode only when windowing is availabel.
;;       ;; Hide the style marks
;;       ;;(setq org-hide-emphasis-markers t)
;;       ;; Better bulltets
;;       (font-lock-add-keywords 'org-mode
;;                               '(("^ +\\([-*]\\) "
;;                                  (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;       ;; Better header bullets
;;       (require 'org-bullets)
;;       (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;       ;; Better headers
;;       (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                                    ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                                    ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                                    ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                                    (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;              (base-font-color     (face-foreground 'default nil 'default))
;;              (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;         (custom-theme-set-faces 'user
;;                                 `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;                                 `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;                                 `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;                                 `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;                                 `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                                 `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;                                 `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;                                 `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;                                 `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

;;       (set-face-attribute 'org-meta-line nil :height 1.0 :slant 'normal :background "gray")
;;       (setq org-src-fontify-natively t)
;;       ))


;; Keep ?
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-document-title ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.5 :underline nil))))
;;  '(org-level-1 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.75))))
;;  '(org-level-2 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.5))))
;;  '(org-level-3 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.25))))
;;  '(org-level-4 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.1))))
;;  '(org-level-5 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif"))))
;;  '(org-level-6 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif"))))
;;  '(org-level-7 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif"))))
;;  '(org-level-8 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif"))))
;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "red" :weight bold))))
;;  '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :weight bold))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "cyan" :weight bold))))
;;  '(rainbow-delimiters-depth-4-face ((t (:foreground "green" :weight bold))))
;;  '(rainbow-delimiters-depth-5-face ((t (:foreground "blue" :weight bold))))
;;  '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :weight bold))))
;;  '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :weight bold))))
;;  '(rainbow-delimiters-depth-8-face ((t (:foreground "black" :weight bold))))
;;  '(rainbow-delimiters-unmatched-face ((t (:background "red" :weight bold)))))

        (custom-theme-set-faces 'user
                                `(org-level-1 ((t (:background nil :extend t :weight bold :foreground "red" :underline t))))
                                `(org-level-2 ((t (:background nil :extend t :weight bold :foreground "orange" :underline t))))
                                `(org-level-3 ((t (:background nil :extend t :weight bold :foreground "blue" :underline t))))
                                `(org-level-4 ((t (:background nil :extend t :weight bold :foreground "SpringGreen" :underline t))))
                                `(org-level-5 ((t (:background nil :extend t :weight bold :foreground "cyan" :underline t))))
                                `(org-level-6 ((t (:background nil :extend t :weight bold :foreground "DarkViolet" :underline t))))
                                `(org-level-7 ((t (:background nil :extend t :weight bold :foreground "DarkTurquoise" :underline t))))
                                `(org-level-8 ((t (:background nil :extend t :weight bold :foreground "CadetBlue" :underline t)))))
                                ;;`(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil)))))



;;(set-face-attribute 'org-meta-line nil :height 1.0 :slant 'normal :background "gray")
(setq org-src-fontify-natively t)

(custom-set-faces
 '(org-block-begin-line
   ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF" :extend t))))
 '(org-block
   ((t (:background "#EFF0F1" :extend t))))
 '(org-block-end-line
   ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF" :extend t))))
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-babel configuration
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
                             (shell . t)
                             (ditaa .t)
                             (plantuml .t)
                             (awk . t)
                             (python .t)
                             (perl . t)
                             (emacs-lisp . t)))

;; Use 'plantuml' command to generate UML diagram:
(setq org-plantuml-exec-mode 'plantuml)
(setq org-babel-python-command "python3")


(setq org-confirm-babel-evaluate nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Export self contained html files

(defun org-html--format-image (source attributes info)
  (format "<img src=\"data:image/%s;base64,%s\"%s />"
          (or (file-name-extension source) "")
          (base64-encode-string
           (with-temp-buffer
	         (insert-file-contents-literally source)
	         (buffer-string)))
          (file-name-nondirectory source)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My custom functions are here:

(defun org-get-text-in-src ()
  (save-excursion
  (let* ((start-point (progn
                        ;; Search begin_src
                        (search-backward "#+begin_src")
                        (line-move 1)
                        (point)))
         (end-point (progn
                      ;; Search end_src
                      (search-forward "#+end_src")
                      (line-move -1)
                      (end-of-line)
                      (point))))
    ;; Return the sub string:
    (buffer-substring-no-properties start-point end-point))))

(defun org-send-src-to-vterm ()
  "In Org mode buffer, send the content of the source, if it is
found, where the cursor is on to a vterm buffer, it it exists.

The source is the text contained in the two delimieters:
#+begin_src
#+end_src"

  (interactive)
  (save-excursion
  (let* ((sub-str (org-get-text-in-src)))

    ;; Insert the stuff in vterm buffer, if possible.
    (condition-case nil
        (progn
          (set-buffer "*vterm*")
          (term-send-raw-string (concat sub-str "\n")))
      (error
         (message "Cannot copy content to *vterm*")
         ))
    )))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c C-x j s") #'org-send-src-to-vterm)))

(defun org-send-src-to-vterm-as-expect ()
  "In Org mode buffer, send the content of the source, if it is
found, where the cursor is on to a vterm buffer, as epect commands. Internally the content is sent like this: expectp -c '<src>'

The source is the text contained in the two delimieters:
#+begin_src
#+end_src"

  (interactive)
  (save-excursion
    (let ((sub-str (org-get-text-in-src)))

      ;; Insert the stuff in vterm buffer, if possible.
      (condition-case nil
          (progn
            (set-buffer "*vterm*")
            (term-send-raw-string
             (format "expect -c '%s'\n" sub-str))

        (error
         (message "Cannot copy content to *vterm*")
         ))
      ))))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c C-x j e") #'org-send-src-to-vterm-as-expect)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make beautiful check list with this-command
(defun fill-dots ()
  (let* ((start-idx (search-forward "..." (line-end-position)))
         (end-idx (progn (end-of-line) (current-column)))
         (size (-  fill-column end-idx )))
    (message (format "size=%d" size))
    (goto-char start-idx)
    (dotimes (idx size)
      (insert ".")
      )))
(defun remove-extra-dots ()
  ;; 1 -- Find the dotes
  (search-forward "..." (line-end-position))
  ;; 2 -- Remove the trailing dots
  (while (= (char-after) ?.)
    (delete-char 1))
  )

(defun update-dots ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (remove-extra-dots)
    (beginning-of-line)
    (fill-dots)))

(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c C-x j d") #'update-dots)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-roam
  ;; :straight t
  ;; :hook
  ;; (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/MF_org/")
  (org-roam-completion-everywhere t)
  (org-roam-completion-system 'default)
  ;; (org-roam-capture-templates
  ;;   '(("d" "default" plain
  ;;      #'org-roam-capture--get-point
  ;;      "%?"
  ;;      :file-name "%<%Y%m%d%H%M%S>-${slug}"
  ;;      :head "#+title: ${title}\n"
  ;;      :unnarrowed t)
  ;;     ("ll" "link note" plain
  ;;      #'org-roam-capture--get-point
  ;;      "* %^{Link}"
  ;;      :file-name "Inbox"
  ;;      :olp ("Links")
  ;;      :unnarrowed t
  ;;      :immediate-finish)
  ;;     ("lt" "link task" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* TODO %^{Link}"
  ;;      :file-name "Inbox"
  ;;      :olp ("Tasks")
  ;;      :unnarrowed t
  ;;      :immediate-finish)))
  ;; (org-roam-dailies-directory "Journal/")
  ;; (org-roam-dailies-capture-templates
  ;;   '(("d" "default" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %?"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
  ;;     ("t" "Task" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* TODO %?\n  %U\n  %a\n  %i"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :olp ("Tasks")
  ;;      :empty-lines 1
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
  ;;     ("j" "journal" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %<%I:%M %p> - Journal  :journal:\n\n%?\n\n"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :olp ("Log")
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
  ;;     ("l" "log entry" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %<%I:%M %p> - %?"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :olp ("Log")
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
  ;;     ("m" "meeting" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %<%I:%M %p> - %^{Meeting Title}  :meetings:\n\n%?\n\n"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :olp ("Log")
  ;;      :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")))
  :bind (:map org-roam-mode-map
          (("C-c n l"   . org-roam)
           ("C-c n f"   . org-roam-node-find)
           ("C-c n d"   . org-roam-dailies-find-date)
           ("C-c n c"   . org-roam-dailies-capture-today)
           ("C-c n C r" . org-roam-dailies-capture-tomorrow)
           ("C-c n t"   . org-roam-dailies-find-today)
           ("C-c n y"   . org-roam-dailies-find-yesterday)
           ("C-c n r"   . org-roam-dailies-find-tomorrow)
           ("C-c n g"   . org-roam-graph))
         :map org-mode-map
         (("C-c n f" . org-roam-node-find))
         (("C-c n i" . org-roam-node-insert))
         (("C-c n I" . org-roam-insert-immediate))))


(provide 'setup-org)
