(use-package gptel)
(setq
 gptel-model "albert.openai/gpt-oss-120b"
 gptel-backend (gptel-make-openai "OpenWebUI"
                 :host "openwebui.s1.kube-sidev.meteo.fr"
                 :curl-args '("--insecure")
                 :key "sk-0253b5ab552048af8964eb4fbba0053a"
                 :endpoint "/api/chat/completions"
                 :stream t
                 ;;:models '("albert.mistralai/Mistral-Small-3.2-24B-Instruct-2506")))
                 :models '("albert.openai/gpt-oss-120b")))
(setq gptel-default-mode 'org-mode)
;; Cette option permet de lire les liens dans le buffer d'interaction.
(setq gptel-track-media t)

(use-package gptel-agent)

(provide 'setup-ai)
