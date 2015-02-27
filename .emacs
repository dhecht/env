;;; .emacs

;; dhecht@cloudera
;; (setenv "SHELL" "/bin/tcsh")	; bad stty with linux csh/tcsh

;; dhecht@cloudera
;;(load-library "xcscope")

;; dhecht@cloudera
;;(load-library "p4")

;; dhecht@cloudera
(add-to-list 'load-path "~/.emacs.d/cc-mode")
(add-to-list 'load-path "~/.emacs.d/google")

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

;;(require 'color-theme)
;; dhecht@cloudera
(load-library "color-theme")
(color-theme-initialize)
(color-theme-dark-laptop)
;;(color-theme-standard-ediff)

;(defvar compile-command "build")
;(defvar compilation-scroll-output 1)

;; dhecht 
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))

;; dhecht
(setq auto-mode-alist (cons '("/*/linux.*/.*\\.[ch]$" . linux-c-mode)
			auto-mode-alist))

(setq cscope-do-not-update-database t)
(setq column-number-mode t)
;; M-g is now the same as M-x goto-line
(global-set-key "\eg" 'goto-line)

;; get VMWare indenting right, taken from jeffshel's .emacs
;(c-add-style "vmware"
;             '((c-basic-offset . 3)
;               (c-comment-only-line-offset . 0)
;               (c-hanging-braces-alist . ((substatement-open before after)))
;               (c-offsets-alist . ((topmost-intro        . 0)
;                                   (topmost-intro-cont   . 0)
;                                   (substatement         . 3)
;                                   (substatement-open    . 0)
;                                   (statement-case-open  . 3)
;                                   (statement-cont       . 3)
;                                   (access-label         . -3)
;                                   (inclass              . 3)
;                                   (inline-open          . 3)
;                                   ))))
;; dhecht@cloudera
;;(defun c-mode-setup ()
;;  (c-set-style "vmware")
;;  (setq indent-tabs-mode nil))
;;(defun c++-mode-setup ()
;; (c-set-style "vmware")
;;  (setq indent-tabs-mode nil))
;(custom-set-variables
; '(c-hanging-comment-ender-p nil)
; '(c-hanging-comment-starter-p nil)
; '(load-home-init-file t t))

(setq ediff-split-window-function 'split-window-horizontally)

;; dhecht
;;(defun make-backup-file-name (file)
;;(concat "~/.emacs.backups/" (file-name-nondirectory file) "~"))
(setq make-backup-files nil)
;;(server-start)

(setq split-height-threshold nil)

(require 'xcscope)
(require 'google-c-style)

;; using set-my-cc-style instead.
;(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; C tweaks for Impala
(defconst my-cc-style
  '("Google" (c-offsets-alist .
                           ((innamespace . [0])
                            (arglist-cont-nonempty . 4)
                            (arglist-intro . 4)
                            (access-label . -1)
                            (member-init-intro . 4))
                           )))
(c-add-style "my-cc-style" my-cc-style)
(defun set-my-cc-style () (interactive) (google-set-c-style) (c-set-style "my-cc-style"))
(add-hook 'c-mode-common-hook 'set-my-cc-style)

;; dhecht
;(defun my-indent-setup ()
;  (c-set-offset 'arglist-intro  '(c-lineup-arglist-operators 0))
;  (c-set-offset 'arglist-cont   '(c-lineup-arglist-operators 0))
;  (c-set-offset 'arglist-cont-nonempty '(c-lineup-arglist-operators 0))
;  (c-set-offset 'arglist-close  '(c-lineup-arglist-operators 0)))
;(add-hook 'c-mode-common-cook 'my-indent-setup)


(defun my-ediff-hook ()
  (color-theme-standard-ediff))

(add-hook 'ediff-startup-hook 'my-ediff-hook)

(setq kill-whole-line t)
(setq-default fill-column 87)
