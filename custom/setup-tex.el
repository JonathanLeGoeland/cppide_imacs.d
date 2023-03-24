;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Latex mode customisation is done here     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package flycheck)
(require 'flycheck)

;;(require 'tex-site) ; incoke the AUCTEX package

(add-hook 'LaTeX-mode-hook (lambda ()
                           ;; (ispell-change-dictionary "en")
                           (flyspell-mode)
                           (set-fill-column 80)
                           (auto-fill-mode)
                           (bline-minor-mode)
                           ))
(ispell-change-dictionary "en")

(provide 'setup-tex)
