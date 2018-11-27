;;; .emacs --- my Emacs Init File

;; Copyright (C) 1988-2018 J.M. Ottley

;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;


(setq gc-cons-threshold 64000000)
(add-hook 'after-init-hook
          (lambda ()
            ;; restore after startup
            (setq gc-cons-threshold 800000)))

;; Load package
(require 'package)
(setq package-check-signature nil)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("elpy" . "https://jorgenschaefer.github.io/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

(setq inhibit-startup-screen t                    ;; Disable startup-screen
      initial-scratch-message ""
      garbage-collection-messages t               ;; Garbage Collector - show when working
      load-prefer-newer t                         ;; Always load newest byte code
      large-file-warning-threshold 200000000      ;; warn when opening files bigger than 200MB
      gnutls-min-prime-bits 4096                  ;; remove the warnings from the GnuTLS library when using HTTPS
      global-auto-revert-non-file-buffers t       ;; Also auto refresh dired, but be quiet about it
      auto-revert-verbose nil
      require-final-newline t                     ;; Newline at end of file
      sentence-end-double-space nil               ;; Don't assume that sentences should have two spaces after periods. This ain't a typewriter.
      global-subword-mode t                       ;;  Treat CamelCase subwords as unique
      confirm-kill-emacs 'y-or-n-p                ;; Don't ask `yes/no?', ask `y/n?'.
      history-length 1000
      savehist-save-minibuffer-history t
      savehist-autosave-interval nil ; save on kill only
      show-trailing-whitespace t
      show-paren-delay 0                          ;; small delay before showing a matching parenthesis
      visible-bell t                              ;; When you perform a problematic operation, flash the screen instead of ringing the terminal bell.
      version-control t                           ;; Version control
      vc-follow-symlinks t                        ;; don't ask for confirmation when opening symlinked file
      delete-old-versions t                       ;; delete excess backup versions silently
      vc-make-backup-files t                      ;; make backups file even when in version controlled dir
      create-lockfiles nil
      sentence-end-double-space nil               ;; sentence SHOULD end with only a point.
      fill-column 80                              ;; toggle wrapping text at the 80Th character
      enable-recursive-minibuffers t              ;; Allow recursive minibuffers
      default-directory "~/"                      ;; When opening a file, start searching at the user's home directory.
      ;;savehist-file "~/.emacs.d/configs/savehist" ;; Save minibuffer history
      ;;save-place-file "~/.emacs.d/configs/saveplace"
      bookmark-default-file "~/.emacs.d/configs/bookmarks" ;; bookmark
      backup-directory-alist `(("." . "~/.emacs.d/backups"))      ;; ; which directory to put backups file
      ;; auto-save-file-name-transforms '((".*" "~/.emacs.d/configs/auto-save-list/"
      ;; t))   ;;transform backups file name
      dired-recursive-deletes (quote top)         ;; ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œtopÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â means ask once
      dired-dwim-target t
      dired-recursive-deletes t                   ;; Dired can delete nonempty directories including all their contents
      dired-hide-details-mode t
      eldoc-idle-delay 0.1                        ;; eldoc-mode
      eldoc-echo-area-use-multiline-p nil         ;; eldoc-mode
      ;; text-scale-mode-step 0.8
      text-quoting-style 'grave                   ;; Quoting style for warnings
      ring-bell-function 'ignore                  ;; disable the annoying bell ring
      ;; scroll-step 1                               ;; keyboard scroll one line at a time
      scroll-conservatively 101                   ;; automatic scrolling never centers point, no matter how far point moves;
      scroll-preserve-screen-position t           ;; scroll commands to keep point at the same screen position, so that scrolling back to the same screen conveniently returns point to its original position
      line-number-mode t
      suggest-key-bindings t                      ;; message says that command has a key binding
      column-number-mode t
      buffer-file-coding-system 'utf-8            ;; UTF8
      coding-system-for-read 'utf-8
      coding-system-for-write 'utf-8
      make-pointer-invisible t                    ;; hide cursor while typing
      display-time-day-and-date t                 ;; date - hours - day(name/number)
      display-time-24hr-format t                  ;; display time in the mini-buffer
      display-time-default-load-average nil
      electric-indent-mode nil                    ;; No electric indent
      save-interprogram-paste-before-kill t       ;; Save clipboard data of other programs in the kill ring when possible
      apropos-sort-by-scores t                    ;; sort results by relevancy
      ediff-diff-options "-w"                     ;; A saner ediff
      delete-by-moving-to-trash t                 ;; affected files or directories into the operating system's Trash, instead of deleting them outright
      ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain
      ;; split-width-threshold nil                   ;; never split the window (nice for rtags and compile errors).
      ;; split-height-threshold nil
      browse-url-browser-function 'browse-url-xdg-open ;; Open URLs with xdg-open
      register-separator ?+                       ;; separate individual collected pieces using a separator
      user-full-name "gazbit"
      user-mail-address "jeremy.ottley@gmail.com")



;; Disabling warnings

(progn
  ;; (put 'scroll-left 'disabled nil)
  ;; (put 'dired-find-alternate-file 'disabled nil)
  ;; stop warning prompt for some commands. There's always undo.
  (put 'narrow-to-region 'disabled nil)
  (put 'narrow-to-page 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'erase-buffer 'disabled nil)
  (put 'downcase-region 'disabled nil)            ;; Downcase Region
  (put 'dired-find-alternate-file 'disabled nil)
  )

;; Yet another useful variables

;; When something changes a file, automatically refresh the buffer containing that file so they can't get out of sync.
(global-auto-revert-mode t)

(size-indication-mode t)

;; No blinking
(blink-cursor-mode 0)

;; delete the selection with a keypress
(delete-selection-mode t)

;; Turn on transient-mark-mode.
(transient-mark-mode t)

;; (save-place-mode 1)
(savehist-mode t)

;; Register separator
;; (set-register register-separator "\n\n")

;; Turn on syntax highlighting whenever possible.
(global-font-lock-mode t)

;; Visually indicate matching pairs of parentheses.
(show-paren-mode 1)

;; Time
(display-time-mode)

;; Undo/Redo
;; (winner-mode 1)
;; (remove-hook 'minibuffer-setup-hook 'winner-save-unconditionally)



;; Hooks


  (add-hook 'prog-mode-hook #'hs-minor-mode) ;; folding
  (add-hook 'before-save-hook 'delete-trailing-whitespace)  ;; Delete trail
  (add-hook 'focus-out-hook #'garbage-collect) ;; Garbage-collect on focus-out, Emacs should feel snappier.
  ;; (add-hook 'window-setup-hook #'delete-other-windows) ;; Don't open with splits
  (add-hook 'dired-mode-hook
            (lambda ()
              (define-key dired-mode-map (kbd "^")
                (lambda () (interactive) (find-alternate-file "..")))
                                          ; was dired-up-directory
              ))
              
  ;; Built-in packages
;; It is somewhat surprising the amount of built-in packages are bundled with emacs. Lets enhance them!

;; Recentf

(use-package recentf
  :ensure nil
  :init
  (recentf-mode 1)
  (run-at-time nil (* 5 60) 'recentf-save-list)
  (setq
   ;; recentf-save-file (expand-file-name "recentf" prelude-savefile-dir)
   recentf-max-saved-items 1000
   recentf-max-menu-items 60
   ;; disable recentf-cleanup on Emacs start, because it can cause
   ;; recentf-auto-cleanup 'never ;; problems with remote files
   recentf-auto-cleanup 600  ;; clean up the recent files
   ;; exclude ** from recentfiles buffer
   recentf-exclude '("^/var/folders\\.*"
                     "COMMIT_MSG"
                     "[0-9a-f]\\{32\\}-[0-9a-f]\\{32\\}\\.org"
                     "github.*txt$"
                     "COMMIT_EDITMSG\\'"
                     ".*-autoloads\\.el\\'"
                     "recentf"
                     ".*pang$" ".*cache$"
                     "[/\\]\\.elpa/")))


;; emacs daemon
(server-start)

;; Display on frame title the name of the file, host and some information
(setq frame-title-format
'("emacs%@" (:eval (system-name)) ": " (:eval (if (buffer-file-name)
(abbreviate-file-name (buffer-file-name))
"%b")) " [%*]"))

;; remove toolbar
(tool-bar-mode -1)

;; disable to scroll bar
(scroll-bar-mode -1)

;; make cursor the width of the character it is under
;; i.e. full width of a TAB
(setq x-stretch-cursor t)

;; keep a list of recently opened files, available using F7
(recentf-mode 1)
(global-set-key (kbd "<f7>") 'recentf-open-files)

;; to have a smart C-a navigation
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))
;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)


;; Turn on font-lock mode to color text in certain modes 
(global-font-lock-mode t)

;; Show line and column position of cursor
(column-number-mode 1)

;; Make sure spaces are used when indenting code
(setq-default indent-tabs-mode nil)

;; Using single space after dots to define the end of sentences
(setq sentence-end-double-space nil)

;; Add proper word wrapping
(global-visual-line-mode t)

;; C-home goes to the start, C-end goes to the end of the file
(global-set-key (kbd "<C-home>")
  (lambda()(interactive)(goto-char(point-min))))
(global-set-key (kbd "<C-end>")
  (lambda()(interactive)(goto-char(point-max))))

;; save cursor position between sessions
(require 'saveplace)
(setq-default save-place t)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Toggles between horizontal and vertical layout of two windows
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))
(global-set-key (kbd "C-c m") 'toggle-window-split)

;; For searching and replacing
(setq search-highlight t                 ;; highlight when searching... 
  query-replace-highlight t)             ;; ...and replacing
(setq completion-ignore-case t           ;; ignore case when completing...
  read-file-name-completion-ignore-case t) ;; ...filenames too

;; key board / input method settings
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")       ; prefer utf-8 for language settings
(set-input-method nil)                   ; no funky input for normal editing;
(setq read-quoted-char-radix 10)         ; use decimal, not octal

;; Word count in selected region
(defun count-words-region ()
  (interactive)
  (message "Word count: %s" (how-many "\\w+" (point) (mark))))

;; To put deleted files in trash can
(setq delete-by-moving-to-trash t)

;; Backup and file versions
;; to save the backups on .emacs.d
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backup/")))
      tramp-backup-directory-alist backup-directory-alist)
;; to keep some old versions of all files edited with Emacs
(setq delete-old-versions t
  kept-new-versions 20
  kept-old-versions 20
  version-control t) ;;to also backup files under version control


;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
  
  (use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (progn
    (color-theme-sanityinc-tomorrow-blue)
    ))
  

(use-package evil
  :ensure t
  :init
  (evil-mode 1))
(use-package evil-surround
  :ensure t
  :init
  (progn
    (global-evil-surround-mode 1)
    (global-set-key [(meta z)] 'undo-tree-undo)
    (global-set-key [(meta shift z)] 'undo-tree-redo)))
;; this one bugs for js?
(use-package evil-matchit
  :ensure t
  :init
  (global-evil-matchit-mode 1))
(use-package evil-nerd-commenter
  :ensure t
  :init
  (progn
    (evilnc-default-hotkeys)
    ;; default binding is M-;
    (global-set-key (kbd "M-/") 'evilnc-comment-or-uncomment-lines)))
(use-package evil-leader
  :ensure t
  :init
  (progn
    (global-evil-leader-mode 1)
    (evil-leader/set-leader "SPC")))
(use-package ace-jump-mode
  :ensure t
  :init
  (progn
    (evil-leader/set-key "SPC" 'evil-ace-jump-char-mode)))

;; TODO: check evil-exchange, evil-snipe, evil-lisp-state, evil-escape

;;

(use-package org
  :ensure org-plus-contrib
  :pin org
  :defer 4
  :diminish org-mode-hook
  :bind ("C-c x c" . org-capture)
  ("C-c x l" . org-store-link)
  ("C-c x a" . org-agenda)
  ("C-c x b" . org-switchb)
  :config
  ;; (define-key global-map "\C-c xl" 'org-store-link)
  ;; (defbine-key global-map "\C-c xa" 'org-agenda)
  (setq org-log-done t)
  ;; make tab act as if it were issued in a buffer of the languageâ€™s major mode.
  (setq org-src-tab-acts-natively t)
  ;; enable spell-checking in org-mode.
  (add-hook 'org-mode-hook 'flyspell-mode))

;; bullets instead of a list of asterisks
(use-package org-bullets
  :defer 4
  :config
  ;; downward-pointing arrow instead of the usual ellipsis
  (setq org-ellipsis "⤵")
  (setq org-src-fontify-natively t)
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package toc-org
  :config (add-hook 'org-mode-hook 'toc-org-enable))

(use-package htmlize
  :defer 4)

(use-package ox-twbs
  :defer 4)

;; (use-package org-pdfview
;;  :defer 4
;;  :init
;;  (eval-after-load 'org '(require 'org-pdfview))
  ;;  (add-to-list 'org-file-apps '("\\.pdf\\'" . (lambda (file link) (org-pdfview-open link))))
;;  )


;; --------------------------------------------------
;; Definitions
;; --------------------------------------------------

(setq org-src-fontify-natively t
      org-default-notes-file "~/dots/emacs/.emacs.d/organize.org"  ;; tell Org where to put captured notes.
      org-src-window-setup 'current-window
      org-src-strip-leading-and-trailing-blank-lines t
      org-src-preserve-indentation t
      org-src-tab-acts-natively t)


(add-hook 'org-mode-hook
          '(lambda ()
             (visual-line-mode 1)))
;; (let*
;;     ((variable-tuple (cond
;;                       ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                       ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                       ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                       ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                       (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;      (base-font-color     (face-foreground 'default nil 'default))
;;      (headline           `(:inherit default :weight normal :foreground ,base-font-color)))

;;   (custom-theme-set-faces 'user
;;                           `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-4 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-document-title ((t (,@headline ,@variable-tuple :height 1.33 :underline nil))))))

;; (setq org-startup-indented 'f)
;; (setq org-directory "~/org")
;; (setq org-special-ctrl-a/e 't)
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
;; (define-key global-map "\C-c xc" 'org-capture)
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-src-fontify-natively 't)
;; (setq org-src-tab-acts-natively t)
;; (setq org-src-window-setup 'current-window)

;; Improved version of org narrow block. It loads a temporary file in the given major mode
;;--------------------------------------------------

(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
                Intelligently means: region, org-src-block, org-subtree, or defun,
                whichever applies first.
                Narrowing to org-src-block actually calls `org-edit-src-code'.
                With prefix P, don't widen, just narrow even if buffer is already
                narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing command.
         ;; Remove this first conditional if you don't want it.
         (cond ((org-in-src-block-p)
                (org-edit-src-code)
                (delete-other-windows))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun))))
(define-key ctl-x-map "n b" #'narrow-or-widen-dwim)
(eval-after-load 'org-src
  '(define-key org-src-mode-map
     "\C-x\C-s" #'org-edit-src-exit))

;;; Put emacs in org-mode everytime you open a file in .org, .ref, .notes, or an encrypted version of it.

(setq auto-mode-alist
  '(
    ("\\.org$" . org-mode)  
    ("\\.org.gpg$" . org-mode)  
    ("\\.ref$" . org-mode)
    ("\\.ref.gpg$" . org-mode)
    ("\\.notes$" . org-mode)
))

;;

; Terminal in emacs
(use-package multi-term
  :defer 2
  :diminish
  :commands multi-term)

(use-package eshell-prompt-extras
  :defer 2
  :diminish eshell-mode
  :config
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda)))

(use-package eshell-z
  :defer 2
  :diminish
  :config
  (add-hook 'eshell-mode-hook
            (defun my-eshell-mode-hook ()
              (require 'eshell-z))))

(use-package esh-help
  :defer 2
  :diminish
  :config (setup-esh-help-eldoc)  ;; To use eldoc in Eshell
  )

(use-package eshell-bookmark
  :defer 2
  :diminish
  :config
  (add-hook 'eshell-mode-hook 'eshell-bookmark-setup))

(use-package eshell-did-you-mean
  :defer 2
  :config (eshell-did-you-mean-setup))

(use-package eshell-git-prompt
  :defer 2
  :config (eshell-git-prompt-use-theme 'git-radar))

;; (use-package esh-autosuggest
;;   :hook (eshell-mode . esh-autosuggest-mode)
;;   ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
;;   ;; line below instead:
;;   ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
;;   )

(use-package exec-path-from-shell
  :diminish
  :defer 2
  :config
  (exec-path-from-shell-initialize))
  
  ;;
  
  (use-package fancy-battery
  :ensure t
  (fancy-battery-mode))
  
  ;;
  
  (use-package flyspell
  :diminish flyspell-mode
  :init
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode))
  
  ;;
  
  (use-package nov
  :diminish
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  :config
  (setq nov-text-width most-positive-fixnum)
  (add-hook 'nov-mode-hook 'visual-line-mode)
  (add-hook 'nov-mode-hook 'visual-fill-column-mode)
  (setq nov-text-width 120
        visual-fill-column-center-text t))
        
        ;;
        
    (use-package try
  :diminish
  :defer 2)

(use-package image-file                 ; Visit images as images
  :init (auto-image-file-mode))

(use-package launch                     ; Open files in external programs
  :defer t)
  
  ;;
  
  ;; meaningful names for buffers with the same name
(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'reverse
        uniquify-after-kill-buffer-p t                   ;; rename after killing uniquified
        uniquify-separator "/"
        uniquify-ignore-buffers-re "^\\*"                ;; don't muck with special buffers
        ))
        
        ;;
        
    (use-package pdf-tools
  :defer 4
  :diminish pdf-tools-modes
  :init (pdf-tools-install)
  :bind ( :map pdf-view-mode-map
               ("n" . pdf-view-next-line-or-next-page)
               ("p" . pdf-view-previous-line-or-previous-page)
               ("C-n" . pdf-view-next-page-command )
               ("C-p" . pdf-view-previous-page-command)))

;; workaround for pdf-tools not reopening to last-viewed page of the pdf:
;; https://github.com/politza/pdf-tools/issues/18#issuecomment-269515117
(defun brds/pdf-set-last-viewed-bookmark ()
  (interactive)
  (when (eq major-mode 'pdf-view-mode)
    (bookmark-set (brds/pdf-generate-bookmark-name))))

(defun brds/pdf-jump-last-viewed-bookmark ()
  (bookmark-set "fake") ; this is new
  (when
      (brds/pdf-has-last-viewed-bookmark)
    (bookmark-jump (brds/pdf-generate-bookmark-name))))

(defun brds/pdf-has-last-viewed-bookmark ()
  (assoc
   (brds/pdf-generate-bookmark-name) bookmark-alist))

(defun brds/pdf-generate-bookmark-name ()
  (concat "PDF-LAST-VIEWED: " (buffer-file-name)))

(defun brds/pdf-set-all-last-viewed-bookmarks ()
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (brds/pdf-set-last-viewed-bookmark))))

(add-hook 'kill-buffer-hook 'brds/pdf-set-last-viewed-bookmark)
(add-hook 'pdf-view-mode-hook 'brds/pdf-jump-last-viewed-bookmark)
(unless noninteractive  ; as `save-place-mode' does
  (add-hook 'kill-emacs-hook #'brds/pdf-set-all-last-viewed-bookmarks))

;; Display page numbers
(define-pdf-cache-function pagelabels)

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (setq-local mode-line-position
                        '(" ["
                          (:eval (nth (1- (pdf-view-current-page))
                                      (pdf-cache-pagelabels)))
                          "/"
                          (:eval (number-to-string (pdf-view-current-page)))
                          "/"
                          (:eval (number-to-string (pdf-cache-number-of-pages)))
                          "]"))))

;; [PDFTOOLS End]
