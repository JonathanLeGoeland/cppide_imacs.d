(use-package lsp-mode
  :ensure t)
(define-key lsp-mode-map (kbd "C-c C-l") lsp-command-map)
(use-package lsp-docker
  :ensure t)

;; (defvar lsp-docker-client-packages
;;     '(lsp-css lsp-clients lsp-bash lsp-go lsp-pylsp lsp-html lsp-typescript
;;       lsp-terraform lsp-clangd))

;; (setq lsp-docker-client-configs
;;     '((:server-id bash-ls :docker-server-id bashls-docker :server-command "bash-language-server start")
;;       (:server-id clangd :docker-server-id clangd-docker :server-command "clangd")
;;       (:server-id css-ls :docker-server-id cssls-docker :server-command "css-languageserver --stdio")
;;       ;;(:server-id dockerfile-ls :docker-server-id dockerfilels-docker :server-command "docker-langserver --stdio")
;;       (:server-id gopls :docker-server-id gopls-docker :server-command "gopls")
;;       (:server-id html-ls :docker-server-id htmls-docker :server-command "html-languageserver --stdio")
;;       (:server-id pylsp :docker-server-id pyls-docker :server-command "pylsp")
;;       ;;(:server-id ts-ls :docker-server-id tsls-docker :server-command "typescript-language-server --stdio")
;;       ))

;; (require 'lsp-docker)
;; (lsp-docker-init-clients
;;   :path-mappings '(("path-to-projects-you-want-to-use" . "/projects"))
;;   :client-packages lsp-docker-client-packages
;;   :client-configs lsp-docker-client-configs)

(provide 'setup-lsp)
