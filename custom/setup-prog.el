;; Essentiellement pour respecter mes listes à points dans les
;; commentaires de mon code quand on fait M-q (fill-paragraph).
;; (use-package fancy-fill-paragraph
;;   :bind ("M-q" . fancy-fill-paragraph))

;; ============================================================================
;; Renumbering des listes dans le code
(defcustom number-regex "# [0-9]+ -" "Expression régulière de numérotation")
(defun renumber-region (start end)
  (interactive "r")
  (let ((count 1)
        (replacement (string-replace "[0-9]+" "%d" number-regex)))
    (save-excursion
      (goto-char start)
      ;; (message "-%s-" replacement)
      (while (re-search-forward number-regex end t)
        (replace-match (format replacement count))
        ;; (message "Replacement %d" count)
        (setq count (+ count 1))))))

(provide 'setup-prog)
