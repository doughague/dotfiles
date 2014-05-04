;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; \file      .emacs
;; \brief     GNU emacs configuration
;; \author    Doug Hague
;; \date      03.05.2014
;; \copyright GPLv3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; local include
;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(add-to-list 'load-path "~/.emacs.d")                              ;; local path
(add-to-list 'load-path "~/.emacs.d/plugins")                      ;; local plugins
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")    ;; color-theme
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")  ;; auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/cedet-1.0.1/")         ;; CEDET
(add-to-list 'load-path "~/.emacs.d/plugins/ecb-2.40/")            ;; ECB

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Functions
;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(defun insert-date-string ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "%d.%m.%Y")))
(defun toggle-fullscreen (&optional f)
  "Toggle full screen mode."
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))
(defun arrange-frame (w h x y)
  "Set the width, height, and x/y position of the current frame"
  (let ((frame (selected-frame)))
    (delete-other-windows)
    (set-frame-position frame x y)
    (set-frame-size frame w h)))

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Environment    
;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(setq inhibit-startup-message t)                  ;; Don't show the startup message
(arrange-frame 160 50 2 22)                       ;; frame size
(setq visible-bell t)                             ;; remove anoying bell
(column-number-mode 1)                            ;; column numbers
(line-number-mode 1)                              ;; line numbers
(setq scroll-step 1)                              ;; scoll by single line
(show-paren-mode 1)                               ;; show paren-matching
(setq frame-title-format                          ;; default to better frame titles
      (concat  "%b @ " (system-name)))
;; (menu-bar-mode -1)                                ;; remove menu bar with -1
;; (tool-bar-mode -1)                                ;; remove tool bar with -1
;; (cua-mode t)                                      ;; ctrl x/c/v cut/copy/paste

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; packages
;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; color themes
(require 'color-theme)
(color-theme-initialize)
;; tango theme
(require 'color-theme-tango)
(color-theme-tango)
;; auto-pair parens, etc.
(require 'autopair)
(autopair-global-mode) 
;; Flyspell specials
(add-hook 'latex-mode-hook
	  (lambda ()(flyspell-mode 1))) 
(add-hook 'text-mode-hook 'flyspell-mode-on) 
;; markdown mode
(autoload 'markdown-mode "markdown-mode.el" 
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
;; cmake mode
(setq load-path (cons (expand-file-name "~/.emacs.d/plugins/cmake-mode") load-path))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))
;; yasnippet
(require 'yasnippet-bundle)
;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/haguejd/.emacs.d/ac-dict")
(ac-config-default)
;; cedet
(load-file "~/.emacs.d/plugins/cedet-1.0.1/common/cedet.el")
;; emacs code browser
(require 'ecb)
  (setq ecb-tip-of-the-day nil)
  (custom-set-variables '(ecb-options-version "2.40"))
  (custom-set-faces)

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Keyboard shortcuts 
;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(global-set-key       "\M-g"  'goto-line)          ;; Alt-g goto line
(global-set-key (kbd "C-c i") 'insert-date-string) ;; C-c i insert-date-string  
(global-set-key (kbd "C-c m") 'toggle-fullscreen)  ;; C-c m full screen  
(global-set-key (kbd "C-c e") 'ecb-activate)       ;; C-c e activates ecb  


;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; end 
;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
