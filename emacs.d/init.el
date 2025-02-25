;;; Commentary
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(require 'airline-themes)
(require 'monokai-pro-theme)
(require 'helm)
(use-package helm)
(use-package ivy)
(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;;(package-install 'use-package)

;; TAGS tree
(add-to-list 'load-path "~/.emacs.d/vendor/")
(load "tags-tree.el")	     
(autoload 'tags-tree "tags-tree" "TAGS tree" t)
(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
(defun create-tags (dir-name)
    "Create tags file."
    (interactive "DDirectory: ")
    (shell-command
     (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
    )

;;(use-package flycheck
;;  :ensure t
;;  :init (global-flycheck-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c3542d6868bbdac1667fd1a7d751fd41520ca63f155b043ffbc4f9b9effb1783" "4ed20d30a768c1a9032cf63aa8980723c21589c68838cd972f79e7ca2a414b9d" "5eed5311ae09ed84cb2e4bf2f033eb4df27e7846a68e4ea3ab8d28f6b017e44a" "27b3336b6115451a340275d842de6e8b1c49ce0bba45210ed640902240f8961d" "067667cad7f89dd5fc4ff72b7b8d994376de57ff3c67a1d506bf6d223e49c485" "2ed177de0dfc32a6a32d6109ddfd1782a61bcc23916b7b967fa212666d1aa95c" "6b234feec8db588ad5ec2a9d9d7b935f7a155104b25ccfb94d921c45a2ff7d22" "9b88b8c64dc30188514f19d1be732ee71cc905b04b0c2c7eb1194528fcebbea4" "ea066684e9ace1e618719fab683b24a0fbcd3de82692190b1fe54e6b1b2a29bc" "fb83a50c80de36f23aea5919e50e1bccd565ca5bb646af95729dc8c5f926cbf3" "e3a1b1fb50e3908e80514de38acbac74be2eb2777fc896e44b54ce44308e5330" "24168c7e083ca0bbc87c68d3139ef39f072488703dcdd82343b8cab71c0f62a7" "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "9abe2b502db3ed511fea7ab84b62096ba15a3a71cdb106fd989afa179ff8ab8d" default)))
 '(package-selected-packages
   (quote
    (tree-mode ivy helm tango-plus-theme espresso-theme projectile company package+ lsp-dart cl-format dockerfile-mode smart-mode-line-powerline-theme smart-mode-line spaceline airline-themes monokai-theme monokai-pro-theme web-mode lsp-ui use-package ruby-test-mode flycheck atomic-chrome))))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(require 'atomic-chrome)
(atomic-chrome-start-server)

(require 'lsp-mode)

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

;; Projectile
(setq projectile-completion-system 'ivy)

;; Hide Evil and buffer state on inactive buffers.
;; Valid Values: t (hidden), nil (shown)
(setq airline-hide-state-on-inactive-buffers t)

;; ;; "Hide eyebrowse indicator on inactive buffers.
;; ;; Valid Values: t (hidden), nil (shown)"
(setq airline-hide-eyebrowse-on-inactive-buffers t)

;; ;; Hide vc branch on inactive buffers:
;; ;; Valid Values: t (hidden), nil (shown)
(setq airline-hide-vc-branch-on-inactive-buffers nil)

;; ;; Set eshell prompt colors to match the airline theme.
;; ;; Valid Values: t (enabled), nil (disabled)
 (setq airline-eshell-colors t)

;; ;; Set helm colors to match the airline theme.
;; ;; Valid Values: t (enabled), nil (disabled)
 (setq airline-helm-colors t)

;; ;; Set the cursor color based on the current evil state.
;; ;; Valid Values: t (enabled), nil (disabled)
 (setq airline-cursor-colors t)

;; ;; Display the currend directory along with the filename.
;; ;; Valid Values: 'airline-directory-full
;; ;;               'airline-directory-shortened
;; ;;               nil (disabled)
(setq airline-display-directory nil)

;; ;; Max directory length to display when using 'airline-directory-shortened
;; (setq airline-shortened-directory-length 30)

;; ;; Unicode character choices
 (setq airline-utf-glyph-separator-left #xe0b0
       airline-utf-glyph-separator-right #xe0b2
       airline-utf-glyph-subseparator-left #xe0b1
       airline-utf-glyph-subseparator-right #xe0b3
       airline-utf-glyph-branch #xe0a0
       airline-utf-glyph-readonly #xe0a2
       airline-utf-glyph-linenumber #x2630)


(require 'monokai-pro-theme)
(load-theme 'airline-ayu_mirage t)
(load-theme 'tango t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "White" :background "Orange" :box nil))))
 '(mode-line-inactive ((t (:foreground "White" :background "DarkGreen" :box nil)))))



