;; FNAME: ~/.emacs.d/init.el
;; =========================
;; easy and fast way to load file       :: M-x load-file  RET
;;                                      ~/.emacs.d/init.el RET
;; Disable tool-bar, menu-bar, scroll bar
;;;; (tool-bar-mode -1)
;; Splash Screen
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)
(menu-bar-mode -1)
;;(scroll-bar-mode -1)
;; Do not show the startup screen.
(setq inhibit-startup-message t)
;; Highlight current line.
(global-hl-line-mode t)
;; =============================
;; disable C-z emacs' suspension
(global-set-key (kbd "C-z") 'nil)
;; add occur shortcut
;;(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c o") 'multi-occur)
;; auto-refresh all buffers when files have changed on disk
(global-auto-revert-mode t)
;;
;; kill this buffer - So I don't need to wait
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;; removing whitespace in every buffer
(add-hook 'before-save-hook 'whitespace-cleanup)
;;  highlight brackets
;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
;; =========================
;; Auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)
;; define alias Yes and No
(defalias 'yes-or-no-p 'y-or-n-p)
;; vertical border
;; change the character composing the Emacs vertical border
;; Reverse colors for the border to have nicer line
(set-face-inverse-video 'vertical-border nil)
(set-face-background 'vertical-border (face-background 'default))
;; Set symbol for the border
(set-display-table-slot standard-display-table
			'vertical-border
			(make-glyph-code ?|))
;; rebind M-o as C-x o move between windows
(global-set-key (kbd "M-o") 'other-window)
;; winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))
;; ============
;;  use-package
;; Update package-archive lists
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(package-initialize)
;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'bind-key)                ;; if you use any :bind variant
;;(add-to-list 'load-path "~/.emacs.d/macros/";;)
;;( load "mym" )
;; Emacs Lisp source code files that are not part of any package
;;(add-to-list 'load-path "~/.emacs.d/elisp/")
;;(add-to-list 'load-path "~/.emacs.d/elisp/IOS-config-mode")
;;( load "ios-config-mode" )
;;  :load-path "~/.emacs.d/elisp/IOS-config-mode"
;;  gnu-elpa-keyring-update
(use-package gnu-elpa-keyring-update
  :ensure t  )
;; zoom-window
(use-package zoom-window
  :ensure t
  :bind ("C-z" . zoom-window-zoom)
  )
;; theme
(use-package doom-themes
  :ensure t
  :init
  ;;; Settings (defaults)
  (setq doom-themes-enable-bold nil    ; if nil, bold is universally disabled
	doom-themes-enable-italic nil)  ; if nil, italics is universally disabled
  :config
  (customize-set-variable 'frame-background-mode 'dark)
  ;;  (load-theme 'doom-city-lights t))
  (load-theme 'doom-peacock t))
;;  (load-theme 'doom-molokai t))
;; powerline
(use-package powerline
  :ensure t
  :config
  ;;  (powerline-vim-theme))
  ;;  (powerline-center-theme))
  (powerline-default-theme))
;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  )
;; which key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
;; ;; ace-window - jumping between frames
;; (use-package ace-window
;;   :ensure t
;;   :bind ("M-p" . ace-window)
;;   )
;; relative line numbers
(use-package nlinum-relative
  :ensure t
  :config
  ;; something else you want
  ;;ini(nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))
;; auto complete
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

;; ivy =========
(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
	 ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))
(use-package counsel
  :after ivy
  :config (counsel-mode))
(use-package swiper
    :bind (("M-s" . counsel-grep-or-swiper)))
(use-package counsel-projectile
  :ensure t
  :bind
  (("C-x p" . counsel-projectile)))
(global-set-key (kbd "C-c r") 'counsel-rg)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'counsel-ibuffer)
(global-set-key (kbd "C-x C-b") nil)
;; (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c b") 'counsel-bookmark)
(global-set-key (kbd "C-c d") 'counsel-descbinds)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c o") 'counsel-outline)
(global-set-key (kbd "C-c t") 'counsel-load-theme)
(global-set-key (kbd "C-c F") 'counsel-org-file)

;; ====
;; org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (shell . t)
   (lisp . t)
   ))
(require 'org)
(setq org-confirm-babel-evaluate nil)
;; The last variable removes the annoying "Do you want to execute"
;; your code when you type: C-c C-c
(setq org-confirm-babel-evaluate nil)
;; define pasth for org-capture file
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
	"* TODO %?\n  %i\n  %a")
   ("j" "Journal" entry (file+olp+datetree "~/org/journal.org")
	"* %?\nEntered on %U\n  %i\n  %a")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(doom-gruvbox))
 '(custom-safe-themes
   '("d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" default))
 '(fci-rule-color "#5B6268")
 '(frame-background-mode 'dark)
 '(jdee-db-active-breakpoint-face-colors (cons "#2b2a27" "#ff5d38"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#2b2a27" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#2b2a27" "#3f444a"))
 '(objed-cursor-color "#ff5d38")
 '(package-selected-packages
   '(markdown-mode+ markdown-preview-mode counsel-projectile auto-complete use-package))
 '(pdf-view-midnight-colors (cons "#ede0ce" "#2b2a27"))
 '(rustic-ansi-faces
   ["#2b2a27" "#ff5d38" "#98be65" "#bcd42a" "#51afef" "#c678dd" "#46D9FF" "#ede0ce"])
 '(vc-annotate-background "#2b2a27")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#a4c551")
    (cons 60 "#b0cc3d")
    (cons 80 "#bcd42a")
    (cons 100 "#c1a623")
    (cons 120 "#c5781c")
    (cons 140 "#cb4b16")
    (cons 160 "#c95a58")
    (cons 180 "#c7699a")
    (cons 200 "#c678dd")
    (cons 220 "#d96fa6")
    (cons 240 "#ec666f")
    (cons 260 "#ff5d38")
    (cons 280 "#cf563c")
    (cons 300 "#9f5041")
    (cons 320 "#6f4a45")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
