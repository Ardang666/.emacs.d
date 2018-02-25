(require 'cl)

;; (when (>= emacs-major-version 24)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;   )

;; ;;add whatever packages you want here
;; (defvar zilongshanren/packages '(
;; 				 company
;; 				 monokai-theme
;; 				 color-theme-solarized
;; 				 hungry-delete
;; 				 swiper
;; 				 counsel
;; 				 smartparens
;; 				 js2-mode
;; 				 nodejs-repl
;; 				 exec-path-from-shell
;; 				 popwin
;; 				 expand-region
;; 				 iedit
;; 				 cnfonts
;; 				 helm-ag
;; 				 flycheck
;; 				 evil
;; 				 evil-leader
;; 				 evil-surround
;; 				 evil-nerd-commenter				 
;; 				 window-numbering
;; 				 which-key
;; 				 pallet
;; 				 )  "Default packages")

;; (setq package-selected-packages zilongshanren/packages)

;; (defun zilongshanren/packages-installed-p ()
;;   (loop for pkg in zilongshanren/packages
;; 	when (not (package-installed-p pkg)) do (return nil)
;; 	finally (return t)))

;; (unless (zilongshanren/packages-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg zilongshanren/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-hungry-delete-mode)

(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)

(load-theme 'monokai t)
;;(require 'solarized-theme)
;;(set-frame-parameter nil 'background-mode 'dark) ;;solarized dark
;;(enable-theme 'solarized)

(require 'popwin)    ;;when require, wh(setq company-minimum-prefix-length 1)en not require
(popwin-mode 1)

(global-set-key (kbd "C-=") 'er/expand-region)

(require 'cnfonts)
;; 让 cnfonts 随着 Emacs 自动生效。
(cnfonts-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;; (cnfonts-set-spacemacs-fallback-fonts)


(evil-mode 1)
;; remove all keybings from insert-state keymap
(setcdr evil-insert-state-map nil)
;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)


(global-evil-leader-mode 1)
(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":" 'counsel-M-x
  "wm" 'delete-other-windows
  "qq" 'save-buffers-kill-terminal
  )


;; 快捷键访问窗口
(window-numbering-mode 1)


;; evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; evil-nerd-commenter 用于注释
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)


;; 某些模式使用emacs模式
(dolist  (mode '(ag-mode
		 flycheck-error-list-mode
		 git-rebase-mode
		 ))
  (add-to-list 'evil-emacs-state-modes mode))

;;
(evilnc-default-hotkeys
 (add-hook 'occur-mode-hook
	   (lambda()
	     (evil-add-hjkl-bindings occur-mode-map 'emacs
	       (kbd "/")    'evil-search-forward
	       (kbd "n")    'evil-search-next
	       (kbd "N")    'evil-search-previous
	       (kbd "C-d")  'evil-scroll-down
	       (kbd "C-u")  'evil-scroll-up 
))))

(which-key-mode 1)

(provide 'init-packages)
