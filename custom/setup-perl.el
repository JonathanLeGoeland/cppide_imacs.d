;; Use cperl-mode
(fset 'perl-mode 'cperl-mode)
;; Basic customisation
(setq cperl-invalid-face nil)
(setq cperl-indent-level 4)
(setq cperl-indent-parens-as-block t)
(setq cperl-close-paren-offset (- cperl-indent-level))

;; Flycheck for perl
(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq flycheck-display-errors-delay 0.1)

(add-hook 'cperl-mode-hook 'flycheck-mode)

;; Navigation
;; (require 'dumb-jump)
;; (setq dumb-jump-force-searcher 'ag)
;; (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; shell stuffs
;; (require 'shx) ; Je ne parviens pas à télécharger ce package.
;; (add-hook 'shell-mode-hook 'shx-mode)

;; (require 'shell-pop)
;; (setq shell-pop-autocd-to-working-dir t)
;; (global-set-key (kbd "C-c jsp") 'shell-pop)

;; auto highlight symbols-consed
(use-package auto-highlight-symbol)
(require 'auto-highlight-symbol)
(add-hook 'cperl-mode-hook 'auto-highlight-symbol-mode)

(use-package lsp-mode)
(require 'lsp-mode)
(add-hook 'cperl-mode-hook 'lsp)

(setq lsp-perl-perl-inc '("/home/jonathan/Work/Difmet/difmet/src/perl"))

(provide 'setup-perl)
