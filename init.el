(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq url-http-proxy-basic-auth-storage
      (list (list "proxy.meteo.fr:11011"
                  (cons "Input your LDAP UID !"
                        (base64-encode-string (format "%s:%s" (getenv "win_usr") (getenv "win_pwd")))))))



(require 'package)
(setq package-check-signature nil) 
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
	     '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "/home/jonathan/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-c)
(require 'setup-org)
(require 'setup-tex)
(require 'setup-perl)
(require 'setup-python)
(require 'setup-text)
;;------------------------------------------------------------------------------
;; General config
;; Load the theme
(load-theme 'dichromacy)
;; show paren mode
(show-paren-mode)

;; Do not warn for safty.
(put 'flycheck-clang-args 'safe-local-variable (lambda (xx) t))
(put 'company-clang-arguments 'safe-local-variable (lambda (xxe) t))


;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.50")
 '(org-agenda-files '("~/MF_org/20230327102806-weekly_planning.org"))
 '(package-selected-packages
   '(ecb dockerfile-mode htmlize php-mode doom-modeline magit plantuml-mode vterm org-roam org-redmine org-bullets yasnippet-snippets elpy shell-pop shx ace-window yaml-mode markdown-mode zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))

;;----------------------------------------------------------
;; vterm: To have a good interaction with terminals.
(use-package vterm
  :ensure t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "#EFF0F1" :extend t))))
 '(org-block-begin-line ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF" :extend t))))
 '(org-block-end-line ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF" :extend t))))
 '(org-level-1 ((t (:background nil :extend t :weight bold :foreground "red" :underline t))))
 '(org-level-2 ((t (:background nil :extend t :weight bold :foreground "orange" :underline t))))
 '(org-level-3 ((t (:background nil :extend t :weight bold :foreground "blue" :underline t))))
 '(org-level-4 ((t (:background nil :extend t :weight bold :foreground "SpringGreen" :underline t))))
 '(org-level-5 ((t (:background nil :extend t :weight bold :foreground "cyan" :underline t))))
 '(org-level-6 ((t (:background nil :extend t :weight bold :foreground "DarkViolet" :underline t))))
 '(org-level-7 ((t (:background nil :extend t :weight bold :foreground "DarkTurquoise" :underline t))))
 '(org-level-8 ((t (:background nil :extend t :weight bold :foreground "CadetBlue" :underline t))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red" :weight bold))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :weight bold))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "cyan" :weight bold))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green" :weight bold))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "blue" :weight bold))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :weight bold))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :weight bold))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "black" :weight bold))))
 '(rainbow-delimiters-unmatched-face ((t (:background "red" :weight bold)))))

;;------------------------------------------------------------
;; doom modeline to have a synthetic mode line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
