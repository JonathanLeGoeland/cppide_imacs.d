;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org mode customisation is done            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-todo-keywords
      '((sequence "TODO" "DELEGATED" "STOPPED" "WAITING" "DONE" )))

(add-hook 'org-mode-hook (lambda ()
                           ;; (ispell-change-dictionary "en")
                           (flyspell-mode)
                           (set-fill-column 80)
                           (auto-fill-mode)
                           (bline-minor-mode)
                           ))


(provide 'setup-org)
