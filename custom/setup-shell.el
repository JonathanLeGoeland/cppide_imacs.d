;;----------------------------------------------------------
;; vterm: To have a good interaction with terminals.
;; (use-package vterm
;;   :ensure t)
;; multi-vterm
(use-package multi-vterm)
(define-key global-map (kbd "C-c t o") 'multi-vterm)




(use-package shell-pop
  ;; :bind automatically sets up the keybinding AND tells Emacs to lazy-load the
  ;; package the moment the key is pressed.
  :bind (("C-c t p" . shell-pop))
  :custom
  ;; The key sequence used to toggle the shell window.
  (shell-pop-universal-key "C-c t p")

  ;; Sets the screen position where the shell popup appears.
  ;; You can choose "bottom", "top", "right", "left", or "full".
  (shell-pop-window-position "bottom")

  ;; If non-nil, the window stretches across the entire frame width.
  (shell-pop-full-span nil)

  ;; The path to the shell executable used by the terminal emulator
  ;; (e.g., "/usr/bin/env bash").
  (shell-pop-term-shell shell-file-name)

  ;; The height or width of the window as a percentage of the frame.
  (shell-pop-window-size 30)

  ;; Defines the terminal implementation and its initialization logic.
  (shell-pop-shell-type '("ansi-term" "*ansi-term*"
                          (lambda ()
                            (ansi-term shell-pop-term-shell))))

  ;; Setting this to non-nil sends commands to the shell. This is not always
  ;; desirable, as it can send commands to any prompt.
  (shell-pop-autocd-to-working-dir nil))

(with-eval-after-load 'shell-pop
  (setopt shell-pop-shell-type '("vterm" "*vterm*"
                                 (lambda ()
                                   (when (fboundp 'vterm)
                                     (let ((vterm-shell shell-pop-term-shell))
                                       (vterm)))))))
(provide 'setup-shell)
