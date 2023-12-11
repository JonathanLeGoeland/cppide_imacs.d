;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Text mode customisation is done here      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package flycheck)
(require 'flycheck)

(add-hook 'text-mode-hook (lambda ()
                            (flyspell-mode)
                            ))

(provide 'setup-text)
