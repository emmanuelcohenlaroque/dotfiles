;;; Commentary

(require 'use-package)

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-install 'use-package)

;;(use-package flycheck
;;  :ensure t
;;  :init (global-flycheck-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fb83a50c80de36f23aea5919e50e1bccd565ca5bb646af95729dc8c5f926cbf3" "e3a1b1fb50e3908e80514de38acbac74be2eb2777fc896e44b54ce44308e5330" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" default))
 '(package-selected-packages
   '(company package+ lsp-dart cl-format smart-mode-line-powerline-theme smart-mode-line spaceline airline-themes monokai-theme monokai-pro-theme web-mode lsp-ui use-package ruby-test-mode flycheck)))

(setq lsp-solargraph-autoformat t
      lsp-solargraph-use-bundler nil
      )
(defun lsp-clients-ruby-make-options ()
  `(:solargraph.diagnostics t))

;; Ruby
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("solargraph" "stdio"))
                  :major-modes '(ruby-mode enh-ruby-mode)
                  :priority -1
                  :multi-root t
                  :initialization-options #'lsp-clients-ruby-make-options
                  :server-id 'ruby-ls))

(add-hook 'after-init-hook 'global-company-mode)

;; Hide Evil and buffer state on inactive buffers.
;; Valid Values: t (hidden), nil (shown)
;; (setq airline-hide-state-on-inactive-buffers t)

;; ;; "Hide eyebrowse indicator on inactive buffers.
;; ;; Valid Values: t (hidden), nil (shown)"
;; (setq airline-hide-eyebrowse-on-inactive-buffers t)

;; ;; Hide vc branch on inactive buffers:
;; ;; Valid Values: t (hidden), nil (shown)
;; (setq airline-hide-vc-branch-on-inactive-buffers nil)

;; ;; Set eshell prompt colors to match the airline theme.
;; ;; Valid Values: t (enabled), nil (disabled)
;; (setq airline-eshell-colors t)

;; ;; Set helm colors to match the airline theme.
;; ;; Valid Values: t (enabled), nil (disabled)
;; (setq airline-helm-colors t)

;; ;; Set the cursor color based on the current evil state.
;; ;; Valid Values: t (enabled), nil (disabled)
;; (setq airline-cursor-colors t)

;; ;; Display the currend directory along with the filename.
;; ;; Valid Values: 'airline-directory-full
;; ;;               'airline-directory-shortened
;; ;;               nil (disabled)
;; (setq airline-display-directory nil)

;; ;; Max directory length to display when using 'airline-directory-shortened
;; (setq airline-shortened-directory-length 30)

;; ;; Unicode character choices
;; (setq airline-utf-glyph-separator-left #xe0b0
;;       airline-utf-glyph-separator-right #xe0b2
;;       airline-utf-glyph-subseparator-left #xe0b1
;;       airline-utf-glyph-subseparator-right #xe0b3
;;       airline-utf-glyph-branch #xe0a0
;;       airline-utf-glyph-readonly #xe0a2
;;       airline-utf-glyph-linenumber #x2630)


(add-to-list 'load-path "~/.emacs.d/vendor/emacs-monokai-pro-theme")
(require 'monokai-pro-theme)
(load-theme 'monokai-pro-spectrum t)


(custom-set-faces
 '(mode-line ((t (:foreground "White" :background "Orange" :box nil))))
 '(mode-line-inactive ((t (:foreground "White" :background "DarkGreen" :box nil)))))



