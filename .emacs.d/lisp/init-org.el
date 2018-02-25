(require 'org)

;; 重置有序列表序号
(setq org-src-fontify-natively t)

;; 
(setq org-capture-templates
      	'(("t" "Todo [inbox]" entry (file+headline "~/gtd/inbox.org" "Tasks")
	 "* TODO %i%?")
	("T" "Tickler" entry (file+headline "~/gtd/tickler.org" "Tickler")
                               "* %i%? \n %U")))

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files
            '("~/gtd/inbox.org"
	"~/gtd/gtd.org"
	"~/gtd/tickler.org"))

;;
(setq org-refile-targets
      '(("~/gtd/gtd.org" :maxlevel . 3)
       ("~/gtd/someday.org" :level . 1)
       ("~/gtd/tickler.org" :maxlevel . 2)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(provide 'init-org)
