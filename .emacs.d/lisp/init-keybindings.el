;; siwper 覆盖原有搜索
(global-set-key "\C-s" 'swiper)

;; 
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; M-x 增强
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 打开init文件
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 打开最近的文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 打开git仓库
;;(global-set-key (kbd "C-c p f") 'counsel-git)

;; org mode
(global-set-key (kbd "C-c r") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; 选中buffer
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 改变company的模式
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(global-set-key (kbd "M-s o") 'occur-dwim)
;; imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)
;;
(global-set-key (kbd "M-s e") 'iedit-mode)

(provide 'init-keybindings)
