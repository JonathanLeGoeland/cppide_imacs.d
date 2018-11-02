
;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))
(put 'company-clang-arguments 'safe-local-variable (lambda (xx) t))


;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(use-package flycheck)
(require 'flycheck)
(add-hook 'c-mode-common-hook 'flycheck-mode)
(put 'flycheck-clang-args 'safe-local-variable (lambda (xx) t))
(use-package auto-highlight-symbol)
(require 'auto-highlight-symbol)
(add-hook 'c-mode-common-hook 'auto-highlight-symbol-mode)
;;(auto-highlight-symbol-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see belowlow)
;; “user”: When you want to define your own style
(setq c-default-style "linux")
(setq c-basic-offset 4) ;; set style to "linux"


(use-package cc-mode
  :init
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete))


;; Display function signature in minibuffer.
(global-semantic-idle-summary-mode)

(use-package srefactor)
    (require 'srefactor)
    (require 'srefactor-lisp)
    
    ;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++. 
    (semantic-mode 1) ;; -> this is optional for Lisp
    
    (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
    (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
    (global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
    (global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
    (global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
    (global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)

;; function arguments
(use-package function-args)
(require 'function-args)
(fa-config-default)


;;; ----------------------------------------------------------------------------
;;; Custom function
(defun insert-todo ()
    (interactive )
  (insert
   "printf(\"Implement '%s'.\\n\", __PRETTY_FUNCTION__);\n"
   "// TODO: Implement this."))

(global-set-key (kbd "C-c jit") 'insert-todo)


(provide 'setup-c)
