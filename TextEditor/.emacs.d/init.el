;;; init.el --- Load the full configuration -*- lexical-binding: t -*-

;;;使用代理(23-5-14没有作用？？)
;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; 不加这一句可能有问题，建议读者尝试一下
;(setq url-proxy-services '(("no_proxy" . "^\\(192\\.168\\..*\\)")
;                           ("http" . "127.0.0.1:1080")
;      			   ("https" . "127.0.0.1:1080")))


;;; Melpa 插件仓库,包管理
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;;use-package 进行管理插件
(eval-when-compile
  (require 'use-package))

;;;DOOM THEMES
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  (load-theme 'doom-one t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
;;; doom theme


;(setq confirm-kill-emacs #'yes-or-no-p)      ; 在关闭 Emacs 前询问是否确认关闭，防止误触
(electric-pair-mode t)                       ; 自动补全括号

(column-number-mode t)                       ; 在 Mode line 上显示列号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面
(setq make-backup-files nil)                 ; 关闭文件自动备份

(global-display-line-numbers-mode 1)         ; 在 Window 显示行号
;(tool-bar-mode -1)                           ; （熟练后可选）关闭 Tool bar
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条

(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(setq display-line-numbers-type 'relative)   ; （可选）显示相对行号
(add-to-list 'default-frame-alist '(width . 90))  ; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 55)) ; （可选）设定启动图形界面时的初始 Frame 高度（字符数）


(setq tool-bar-open nil)
(setq menu-bar-open nil)

(add-hook 'text-mode-hook 'flyspell-mode );Text mode 检查拼写

(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号

;;; 自定义函数
;; Faster move cursor
(defun next-ten-lines()
  "move cursor to next 10 lines"
  (interactive)
  (next-line 10))
(defun previous-ten-lines()
  "move cursor to previous 10 lines"
  (interactive)
  (previous-line 10))
;; 绑定到快捷键
(global-set-key (kbd "M-n") 'next-ten-lines)     ; 光标向下移动 10 行
(global-set-key (kbd "M-p") 'previous-ten-lines) ; 光标向上移动 10 行

;;; ~/.emacs.d/lisp, user lisp code
(add-to-list 'load-path "~/.emacs.d/lisp/")


;;;test hello
;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;(require 'hello)


;;;setup ido mode: ido 改变了在 minibuffer 中操作文件操方式
;;ido 会让文件的工作变得很简单.通常，你在 Emacs 中处理文件不需要使用一个单独的访达或文件资源管理器的窗口.相反，你可以用编辑器的命令来创建、打开和保存文件.
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; set up fonts for different OSes. OSX toggles to full screen.
;(setq myfont "InputSerif")
;(cond
;((string-equal system-name "Sampo.local")
; (set-face-attribute 'default nil :font myfont :height 144)
; (toggle-frame-fullscreen))
;((string-equal system-name "Morpheus.local")
; (set-face-attribute 'default nil :font myfont :height 144))
;((string-equal system-name "ILMARINEN")
; (set-face-attribute 'default nil :font myfont :height 106))
;((string-equal system-name "UKKO")
; (set-face-attribute 'default nil :font myfont :height 104)))



(provide 'init)
;;;init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" default))
 '(package-selected-packages '(go-mode doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
