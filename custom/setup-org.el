;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org mode customisation is done            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(if window-system
    (progn
      ;; We try to beautify org mode only when windowing is availabel.
      ;; Hide the style marks
      (setq org-hide-emphasis-markers t)
      ;; Better bulltets
      (font-lock-add-keywords 'org-mode
                              '(("^ +\\([-*]\\) "
                                 (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

      ;; Better header bullets
      (require 'org-bullets)
      (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

      ;; Better headers
      (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                                   ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                                   ((x-list-fonts "Verdana")         '(:font "Verdana"))
                                   ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                                   (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
             (base-font-color     (face-foreground 'default nil 'default))
             (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

        (custom-theme-set-faces 'user
                                `(org-level-8 ((t (,@headline ,@variable-tuple))))
                                `(org-level-7 ((t (,@headline ,@variable-tuple))))
                                `(org-level-6 ((t (,@headline ,@variable-tuple))))
                                `(org-level-5 ((t (,@headline ,@variable-tuple))))
                                `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                                `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
                                `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
                                `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
                                `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

      ;; ;; Customize checkboxes:
      ;; (add-hook 'org-mode-hook (lambda ()
      ;;                            "Beautify Org Checkbox Symbol"
      ;;                            (push '("[ ]" .  "☐") prettify-symbols-alist)
      ;;                            (push '("[X]" . "☑" ) prettify-symbols-alist)
      ;;                            (push '("[-]" . "❍" ) prettify-symbols-alist)
      ;;                            (prettify-symbols-mode)))
      ;; (defface org-checkbox-done-text
      ;;   '((t (:foreground "#71696A" :strike-through t)))
      ;;   "Face for the text part of a checked org-mode checkbox.")

      ;; (font-lock-add-keywords
      ;;  'org-mode
      ;;  `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
      ;;     1 'org-checkbox-done-text prepend))
      ;;  'append)

      ;; Make the source blocks prettier
      ;; (set-face-attribute 'org-block-begin-line nil :foreground "#000000")
      ;; (set-face-attribute 'org-block-end-line nil :foreground "#000000")

      (set-face-attribute 'org-meta-line nil :height 0.6 :slant 'normal)
      (setq org-src-fontify-natively t)
      ))
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My custom functions are here:

(defun org-send-src-to-vterm ()
  "In Org mode buffer, send the content of the source, if it is
found, where the cursor is on to a vterm buffer, it it exists.

The source is the text contained in the two delimieters:
#+begin_src
#+end_src"

  (interactive)
  (let* ((old-buf (current-buffer))
        (start-point (progn
                       ;; Search begin_src
                       (search-backward "#+begin_src")
                       (line-move 1)
                       (point)))
        (end-point (progn
                     ;; Search end_src
                     (search-forward "#+end_src")
                     (line-move -1)
                     (end-of-line)
                     (point)))
        (sub-str (buffer-substring-no-properties start-point end-point)))

    ;; Insert the stuff in vterm buffer, if possible.
    (condition-case nil
        (progn
          (set-buffer "*vterm*")
          (term-send-raw-string (concat sub-str "\n")))
      (error
         (message "Cannot copy content to *vterm*")
         ))
    ))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c C-x s") #'org-send-src-to-vterm)))

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
           ("C-c n f"   . org-roam-find-file)
           ("C-c n d"   . org-roam-dailies-find-date)
           ("C-c n c"   . org-roam-dailies-capture-today)
           ("C-c n C r" . org-roam-dailies-capture-tomorrow)
           ("C-c n t"   . org-roam-dailies-find-today)
           ("C-c n y"   . org-roam-dailies-find-yesterday)
           ("C-c n r"   . org-roam-dailies-find-tomorrow)
           ("C-c n g"   . org-roam-graph))
         :map org-mode-map
         (("C-c n i" . org-roam-insert))
         (("C-c n I" . org-roam-insert-immediate))))


(provide 'setup-org)
