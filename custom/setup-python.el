(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package flycheck)
(require 'flycheck)
(add-hook 'python-mode-hook 'flycheck-mode)

(defun customize-python-mode ()
  (set-fill-column 79)
  (display-fill-column-indicator-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-jedi
  :ensure t)

(setq lsp-jedi-workspace-extra-paths
  (vconcat lsp-jedi-workspace-extra-paths
           ["/home/jonathan/.pyenv/versions/3.8.20/envs/transmet-python/lib/python3.8/site-packages"]))

(provide 'setup-python)
