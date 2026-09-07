(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; elpy utilise occur pour afficher la structure, je veux aller là où je veux et supprimer le buffer donnant la structure.
(defun occur-mode-goto-occurence-and-close ()
  (interactive)

  (occur-mode-goto-occurrence)
  (kill-buffer "*Occur*")
  )
(keymap-set occur-mode-map "RET" 'occur-mode-goto-occurence-and-close)

(use-package flycheck)
(require 'flycheck)

(defun customize-python-mode ()
  (set-fill-column 79)
  (display-fill-column-indicator-mode)
  (flycheck-mode)
  (lsp-mode))

(add-hook 'python-mode-hook 'customize-python-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-jedi
  :ensure t)

(setq lsp-jedi-workspace-extra-paths
  (vconcat lsp-jedi-workspace-extra-paths
           ["/home/jonathan/.pyenv/versions/3.8.20/envs/transmet-python/lib/python3.8/site-packages"]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Commandes personelles

(defun open-transmet-python ()
"Permet d'ouvrir le readme de transmet-python et d'activer
l'environnement virtuel qui convient."
  (interactive)
  (pyvenv-activate "/home/jonathan/.pyenv/versions/transmet-python/")
  (find-file "/home/jonathan/Work/Transmet/transmet-python/readme.org"))


(provide 'setup-python)
