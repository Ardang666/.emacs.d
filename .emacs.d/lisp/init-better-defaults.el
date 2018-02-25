;;;; defaults:

(setq ring-bell-function 'ignore)

;; 自动加载外部修改过的文件
(global-auto-revert-mode t)

(global-linum-mode t)

(abbrev-mode t)
 (define-abbrev-table 'global-abbrev-table '(
                                              ;; signature
                                              ("8zl" "zilongshanren")
                                              ;; Microsoft
                                              ("8ms" "Macrosoft")
                                              ))

(setq make-backup-files nil)

;; 关闭自动保存
(setq auto-save-default nil)

;; 最近打开的文档
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 删除配对
(delete-selection-mode t)

;; 
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

;; 格式化区域代码
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(setq hippie-expand-try-function-list
       '(     try-expand-debbrev
	try-expand-debbrev-all-buffers
	try-expand-debbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

;; dired
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; dired buffer
(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)

(setq dired-dwim-target t)

;; 隐藏^M
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; 删除^M
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 用于对当前buffer搜索
(defun occur-dwim ()
  "Call 'occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-begining)
	     (regiion-end))
	  (let (( sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

;; 显示符号配对
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 在函数中，高亮两边括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;;(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;;(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;; 也可以把上面两句合起来,对单引号不适用
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; helm-ag
(setq exec-path (cons "C:/Users/DAWIN/.babun/cygwin/bin" exec-path))

(provide 'init-better-defaults)
