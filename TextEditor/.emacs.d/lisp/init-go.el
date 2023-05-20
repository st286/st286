;;;emacs golang配置
;;;在使用任何编辑器/IDE开发时，最核心的需求无非以下几点：
;;     括号的自动匹配
;;     代码的自动补全
;;     查找定义、引用
;;     静态检查
;;     在项目中模糊查找（文件/字符串）
;;; 参考： https://404cn.github.io/2021-08-13-Emacs-Golang-开发环境配置.html

;;;设置 major-mode https://github.com/dominikh/go-mode.el
(use-package go-mode
      :ensure t
      :mode (("\\.go\\'" . go-mode)))

;;;使用 goimports 代替 gofmt 在文件保存后自动格式化代码
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)

;;;代码补全、跳转. 安装 company-mode ，在补全时可以使用C-p C-n或者 TAB 进行选择，回车完成补全
;;; http://company-mode.github.io/
(use-package company
     :ensure t)
(add-hook 'prog-mode-hook #'company-mode)
(setq company-tooltip-limit 10
      company-tooltip-align-annotations t
      company-tooltip-width-grow-only t
      company-abort-manual-when-too-short t
      company-require-match nil
      company-backends '(company-capf)
      company-tooltip-margin 0)
(with-eval-after-load "company"
  (define-key company-active-map [tab] 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-n") #'company-select-next))

;;;安装 eglot ，一个 Emacs 中轻量级的 LSP 客户端，在 go-mode 中启用
;;; https://github.com/joaotavora/eglot
(use-package eglot
     :ensure t)
(add-hook 'go-mode-hook #'eglot-ensure)
(setq eglot-ignored-server-capabilites '(:documentHighlightProvider)
      read-process-output-max (* 1024 1024))


(use-package yasnippet
     :ensure t)
(add-hook 'prog-mode-hook #'yas-minor-mode)



(provide 'init-go)
