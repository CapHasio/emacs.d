;;; init-local.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;;;; 路径设置

;;(setenv "PATH" "C:\\msys64\\mingw64\\bin;C:\\msys64\\usr\\local\\bin;C:\\msys64\\usr\\bin;C:\\Windows\\System32;C:\\Windows")
;;;; 编码格式设置
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-locale-environment "utf-8")
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)

(set-language-environment 'utf-8)
(set-locale-environment "utf-8")
(set-default-coding-systems 'utf-8)
;;;; 系统设置

;; (defun set-font (english chinese english-size chinese-size)
;;   (set-face-attribute 'default nil :font
;;                       (format   "%s:pixelsize=%d"  english english-size))
;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font) charset
;;                       (font-spec :family chinese :size chinese-size))))



;; Make sure that the bash executable can be found
(setq explicit-shell-file-name "c:/msys64/usr/bin/bash.exe")
;;(setq shell-file-name explicit-shell-file-name)
;;(add-to-list 'exec-path "c:/msys64/usr/bin")
;;(setq shell-file-name "c:/msys64/usr/bin/bash.exe")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;; set open multi shell
(defun wcy-shell-mode-auto-rename-buffer (text)
  (if (eq major-mode 'shell-mode)
      (rename-buffer  (concat "shell:" default-directory) t)))
(add-hook 'comint-output-filter-functions'wcy-shell-mode-auto-rename-buffer)

;;(global-set-key (kbd "C-c z") 'shell)
;;(global-set-key (kbd "<f10>") 'rename-buffer)


;; emacs平滑滚动
(setq mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
(delete-selection-mode 1)
(setq confirm-kill-emacs 'y-or-n-p)
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'org-mode-hook
          (lambda ()
            (variable-pitch-mode 1)
            visual-line-mode))


;;(set-font   "Source Code Pro" "SourceHanSerifCN-Regular" 20 20)

;; 中文字体的设置，同时解决中英文字体宽度不一致的问题（org-mode的表格可以中英文对齐）。
;; 而且解决了中文字体导致emacs卡的现象。
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
                    (font-spec :family "思源宋体 CN" :size 20)))




( custom-theme-set-faces
  'user
  '(variable-pitch ((t (:family "Source Code Pro" :height 100 :weight normal))))
  '(fixed-pitch ((t ( :family "Ubuntu Mono" :slant normal :weight normal :height 1.0 :width normal)))))

(custom-theme-set-faces
 'user
 ;; '(org-block                 ((t (:inherit fixed-pitch))))
 '(org-link                 ((t (:inherit fixed-pitch))))
 '(org-table                 ((t (:inherit fixed-pitch))))
 '(calendar                 ((t (:inherit fixed-pitch))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-property-value        ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold))))
 '(org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
 )



(require-package 'zenburn-theme)
(require-package 'nord-theme)
(require-package 'solarized-theme)
(require-package 'srcery-theme)
(require-package 'spacemacs-theme)
(require-package 'molokai-theme)
(require-package 'monokai-theme)
(require-package 'dracula-theme)
(require-package 'leuven-theme)
(require-package 'rand-theme)


;;(setq org-fontify-whole-heading-line nil)
;;(setq leuven-scale-outline-headlines nil)
;;(setq leuven-scale-org-agenda-structure nil)

;; Themes I *only* want to be selected
(setq rand-theme-wanted '(leuven-dark zenburn sanityinc-tomorrow-bright nord solarized-zenburn srcery sanityinc-solarized-dark spacemacs-dark dracula molokai monokai lazycat-dark))

;;(rand-theme)
(load-theme 'zenburn)

(require-package 'all-the-icons)

(setq inhibit-compacting-font-caches t)

(when (maybe-require-package  'org-bullets)
  (add-hook 'org-mode-hook 'org-bullets-mode)
  ;;(setq org-bullets-bullet-list '(":whale:" ":tropical_fish:" ":dolphin:" ":fish:"))
  )

;;(setq org-bullets-bullet-list '("☰" "☷" "☯"))
;;(setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))

;;setq-default cursor-type 'bar)

;;;; org基础设置
(setq org-agenda-span 'week)
(setq-default org-default-notes-file "~/org-notes/inbox.org")
(setq-default org-agenda-dir "~/org-notes")
(setq org-agenda-files (list org-agenda-dir))

(require 'org-habit)

(setq org-support-shift-select t)

;; Various preferences
(setq org-log-done t
      org-edit-timestamp-down-means-later t
      org-hide-emphasis-markers t
      org-hide-leading-stars t
      org-odd-level-only nil
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

(setq Org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archived Tasks")

;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
;; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
;; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

(setq org-refile-use-cache nil)

;; Targets include this file and any file contributing to the agenda - up to 5 levels deep
;;(setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-stuck-projects (quote ("" nil nil "")))
;; Use sticky agenda's so they persist
(setq org-agenda-sticky t)
(setq org-enforce-todo-dependencies t)
(setq org-cycle-separator-lines 0)
(setq org-blank-before-new-entry (quote ((heading)
                                         (plain-list-item . auto))))
(setq org-insert-heading-respect-content nil)
(setq org-deadline-warning-days 30)


                                        ; Enable habit tracking (and a bunch of other modules)
(setq org-modules (quote (org-bbdb
                          org-bibtex
                          org-crypt
                          org-gnus
                          org-id
                          org-info
                          ;;org-jsinfo
                          org-habit
                          org-inlinetask
                          org-irc
                          ;;org-mew
                          org-mhe
                          org-protocol
                          org-rmail
                          ;;org-vm
                          org-pomodoro
                          org-alert
                          org-habit
                          ;;org-wl
                          org-w3m)))

;;position the habit graph on the agenda to the right of the default
(setq org-habit-graph-column 50)
(run-at-time "06:00" 86400 '(lambda () (setq org-habit-show-habits t)))


;; Agenda clock report parameters
(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))
                                        ; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

                                        ; global Effort estimate values
                                        ; global STYLE property values for completion

;;(setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
;;                                    ("STYLE_ALL" . "habit"))))
;;(setq org-use-speed-commands t)
;; (setq org-structure-template-alist
;;       (quote (("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")
;;               ("e" "#+begin_example\n?\n#+end_example" "<example>\n?\n</example>")
;;               ("q" "#+begin_quote\n?\n#+end_quote" "<quote>\n?\n</quote>")
;;               ("v" "#+begin_verse\n?\n#+end_verse" "<verse>\n?\n</verse>")
;;               ("c" "#+begin_center\n?\n#+end_center" "<center>\n?\n</center>")
;;               ("l" "#+begin_latex\n?\n#+end_latex" "<literal style=\"latex\">\n?\n</literal>")
;;               ("L" "#+latex: " "<literal style=\"latex\">?</literal>")
;;               ("h" "#+begin_html\n?\n#+end_html" "<literal style=\"html\">\n?\n</literal>")
;;               ("H" "#+html: " "<literal style=\"html\">?</literal>")
;;               ("a" "#+begin_ascii\n?\n#+end_ascii")
;;               ("A" "#+ascii: ")
;;               ("i" "#+index: ?" "#+index: ?")
;;               ("I" "#+include %file ?" "<include file=%file markup=\"?\">"))))
;;
;;;; org进阶设置（latex，python，uml，beamer，cut, etc）
(setenv "PATH" (concat "C:/texlive/2020/bin/win32;" (getenv "PATH")))



;; (add-hook 'LaTeX-mode-hook (lambda()
;;                              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;;                              (setq TeX-global-PDF-mode t TeX-engine 'xelatex)
;;                              ;;重新定义pdfviewer，我设定为了SumatraPDF。
;;                              (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"))
;;                              (setq TeX-command-default "XeLaTeX")
;;                              (setq TeX-save-query  nil )
;;                              (setq TeX-show-compilation t)
;;                              (setq TeX-view-program-list '(("SumatraPDF" "SumatraPDF %o")))
;;                              (setq TeX-view-program-selection '((output-pdf "SumatraPDF")))
;;                              ))

(add-hook 'LaTeX-mode-hook (lambda()
                             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                             (setq TeX-global-PDF-mode t TeX-engine 'xelatex)
                             ;;重新定义pdfviewer，我设定为了SumatraPDF。
                             (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"))
                             (setq TeX-command-default "XeLaTeX")
                             (setq TeX-save-query  nil )
                             (setq TeX-show-compilation t)
                             (setq TeX-view-program-list '(("SumatraPDF" "SumatraPDF %o")))
                             (setq TeX-view-program-selection '((output-pdf "SumatraPDF")))
                             ))

(setq org-latex-compiler "xelatex")
(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("org-article"
               "
             \\documentclass{ctexart}
             \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black,CJKbookmarks=True]{hyperref}
             \\usepackage{graphicx}
             \\usepackage{xcolor}
             %\\usepackage[T1]{fontenc}
             %\\usepackage{aecompl}
             \\usepackage{xeCJK}
             \\setmainfont{Source Code Pro}
             \\setCJKfamilyfont{songti}{SourceHanSerifCN-Regular.otf}
             %为中文和英文设置特定字体
             \\setCJKsansfont[Path=Fonts/]{SourceHanSerifCN-Regular.otf}
             %\\setsansfont{Source Code Pro}
             \\setCJKmainfont[Path=Fonts/]{SourceHanSerifCN-Regular.otf}
             \\setCJKmonofont[Path=Fonts/]{SourceHanSansCN-Regular.otf}
             %\\setCJKsansfont[Path=Fonts/]{SourceHanSerifCN-Regular.otf}
             %\\setCJKseriffont[Path=Fonts/]{SourceHanSerifCN-Regular.otf}
             \\usepackage{fixltx2e}
             \\usepackage{longtable}
             \\usepackage{float}
             \\usepackage{tikz}
             \\usepackage{wrapfig}
             \\usepackage{latexsym,amssymb,amsmath}
             \\usepackage{textcomp}
             \\usepackage{listings}
             \\usepackage{marvosym}
             \\usepackage{textcomp}
             \\usepackage{latexsym}
             \\usepackage{natbib}
             \\usepackage{geometry}
             \\usepackage{epstopdf}
             \\usepackage{epsfig}
             \\usepackage{times}
             \\geometry{a4paper,centering,scale=0.8}
             \\CTEXsetup[format={\\Large\\bfseries}]{section}
             \\usepackage{tocbibind}
             [NO-DEFAULT-PACKAGES]
             [PACKAGES]
             [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 导出Beamer的设置
;; allow for export=>beamer by placing #+LaTeX_CLASS: beamer in org files
;;-----------------------------------------------------------------------------
(add-to-list 'org-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt,professionalfonts]{beamer}
             %\\mode
             %\\usetheme{Antibes}
             %\\usecolortheme{beamercolortheme}
             %\\beamertemplateballitem
             \\setbeameroption{show notes}
             %\\usepackage[utf8]{inputenc}
             \\usepackage{graphicx}
             \\usepackage{tikz}
             \\usepackage{xcolor}
             \\usepackage{fontspec, xunicode, xltxtra, graphicx, subfig}
             \\usepackage{xeCJK}
             \\setmainfont{Source Code Pro}
             \\setCJKfamilyfont{songti}{SourceHanSerifCN-Regular.otf}
             %为中文和英文设置特定字体
             \\setCJKsansfont[Path=Fonts/]{SourceHanSerifCN-Regular.otf}
             %\\setsansfont{Source Code Pro}
             \\setCJKmainfont[Path=Fonts/]{SourceHanSerifCN-Regular.otf}
             \\setCJKmonofont[Path=Fonts/]{SourceHanSansCN-Regular.otf}
             %\\setCJKsansfont[Path=Fonts/]{SourceHanSerifCN-Regular.otf}
             %\\setCJKseriffont[Path=Fonts/]{SourceHanSerifCN-Regular.otf}
             \\usepackage{amsmath}
             %\\usepackage{lmodern}
             \\usepackage{polyglossia}
             \\usepackage{times}
             \\usepackage{verbatim}
             \\usepackage{listings}
             \\subject{{{{beamersubject}}}}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))

(require-package 'yasnippet)
(eval-after-load 'yasnippet
  '(yas/define-snippets
    'org-mode
    '(("beamer" "#+startup: beamer
             #+LaTeX_CLASS: beamer
             #+BEAMER_FRAME_LEVEL: 2
             #+OPTIONS: ^:{}
             #+TITLE: $1
             #+AUTHOR: Wang Liang

             #+latex_header: \\usepackage{lmodern}
             #+latex_header: \\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue}
             #+latex_header: \\mode<beamer>{\\usetheme{Boadilla}}
             #+latex_header: \\AtBeginSection[]{\\begin{frame}<beamer>\\frametitle{Topic}\\tableofcontents[currentsection]\\end{frame}}

             * $0" "beamer presentation")
      ("ditaa" "#+begin_src ditaa :file $1 :cmdline ${2:-S -E -r}
             $0\n#+end_src" "ditaa diagram"))))
(eval-after-load 'yasnippet
  '(yas/define-snippets
    'org-mode
    '(;; ("beamer" "
      ;; #+LaTeX_CLASS: beamer
      ;; #+BEAMER_FRAME_LEVEL: 2
      ;; #+OPTIONS: ^:{}
      ;; #+TITLE: $1
      ;; #+AUTHOR: Rick Zheng

      ;; #+latex_header: \\usepackage{lmodern}
      ;; #+latex_header: \\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue}
      ;; #+latex_header: \hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue}
      ;; #+latex_header: \mode<beamer>{\usetheme{Boadilla}}%Antibes %crane
      ;; #+latex_header: \mode<beamer>{\usecolortheme{default}}%Antibes %Madrid %Boadilla
      ;; #+latex_header: \setbeamertemplate{navigation symbols}~{} %\setbeamertemplate{footline}[frame number]
      ;; #+latex_header: \\AtBeginSection[]{\\begin{frame}<beamer>\\frametitle{Topic}\\tableofcontents[currentsection]\\end{frame}}
      ;; #+latex_header: \institute{亿纬锂能}
      ;; * $0" "beamer presentation")
      ("beamer" "#+startup: beamer
#+LaTeX_CLASS: beamer
#+BEAMER_FRAME_LEVEL: 2
#+OPTIONS: ^:{}
#+TITLE: $1
#+AUTHOR: Wang Liang

#+latex_header: \\usepackage{lmodern}
#+latex_header: \\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue}
#+latex_header: \\mode<beamer>{\\usetheme{Boadilla}}
#+latex_header: \\AtBeginSection[]{\\begin{frame}<beamer>\\frametitle{Topic}\\tableofcontents[currentsection]\\end{frame}}

* $0" "beamer presentation")
      ("ditaa" "#+begin_src ditaa :file $1 :cmdline ${2:-S -E -r}
$0\n#+end_src" "ditaa diagram"))))

(setq org-todo-keywords

      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")))
      org-todo-repeat-to-state "NEXT")

(setq org-todo-keyword-faces
      (quote (("NEXT" :inherit warning)
              ("PROJECT" :inherit font-lock-string-face))))
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))


(require 'org-protocol)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file+headline "" "Inbox")
               "** TODO %?\n - why？\n %U" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "")
               "** NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file+headline "" "Notes")
               "** %? :NOTE:\n%U" :clock-in t :clock-resume t)
              ("s" "ScreenShots" entry (file+headline "" "ScreenShots")
               "** %? \n%U" :clock-in t :clock-resume t)
              ;; ("w" "org-protocol" entry (file "");;safari
              ;;  "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "")
               "** MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("j" "Journal"
               entry (file+datetree "~/org-notes/Journal.org")
               "** 工作日报\n - [ ] "
               :empty-lines 1)
              ("k" "Phone call" entry (file "")
               "** PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ;; ("w" "Web site" entry
              ;;  (file+headline "" "Bookmarks")
              ;;  "* %a :website:\n\n%U %?\n\n%:initial")
              ("B" "Tidbit: quote, zinger, one-liner or textlet"
               entry(file+headline "" "Tidbits")
               (file "~/org-notes/tidbit.orgcaptmpl"))
              ("w"
               "Web Site"
               entry
               (file+headline  "" "Bookmarks")
               "* %^{Title}\n\n  Source: %u, %c\n\n  %i"
               :empty-lines 1)
              ("h" "Habit" entry (file+headline "" "Habits")
               "** NEXT %?\n%U\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
              )))

;; (add-to-list 'org-capture-templates
;;              `("b" "Blog" plain (file ,(concat "~/org-notes/blog/"
;;                                                (format-time-string "%Y-%m-%d.org")))
;;                ,(concat "#+startup: showall\n"
;;                         "#+options: toc:t\n"
;;                         "#+begin_export html\n"
;;                         "---\n"
;;                         "layout     : post\n"
;;                         "title      : %^{标题}\n"
;;                         "categories : %^{类别}\n"
;;                         "tags       : %^{标签}\n"
;;                         "---\n"
;;                         "#+end_export\n"
;;                         "#+TOC: headlines 2\n")))


;; (define-key global-map (kbd "C-c x")
;;   (lambda () (interactive) (org-capture nil "x")))


(require-package 'ox-hugo)
(with-eval-after-load 'ox
  (require 'ox-hugo))
;; Hugo orgmode exporter
;;(require 'ox-hugo-auto-export) ;If you want the auto-exporting on file saves

;; Populates only the EXPORT_FILE_NAME property in the inserted headline.
(with-eval-after-load 'org-capture
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
    (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(
                   ,(concat "* TODO " title "       :BLOG:" )
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_FILE_NAME: " fname)
                   ":END:"
                   "%?\n")              ;Place the cursor here finally
                 "\n")))

  (add-to-list 'org-capture-templates
               '("b"                    ;`org-capture' binding + h
                 "Blog"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has a "Blog Ideas" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+olp "~/org-notes/myblog.org" "My Blog")
                 (function org-hugo-new-subtree-post-capture-template):clock-in t :clock-resume t)))


(setenv "PATH" (concat "E:/Rick/Emacs/emacs-26.3/.emacs.d/site-lisp/IrfanView;" (getenv "PATH")))
(setenv "PATH" (concat "e:/Rick/Emacs/emacs-26.3/.emacs.d/site-lisp/PicPick;" (getenv "PATH")))


;;https://www.jianshu.com/p/77841e0aba46
;; screenshot
(defun rick/cut ()
  "Take a screenshot into a unique-named file in the current buffer file
   directory and insert a link to this file."
  (interactive)
  (lower-frame) ;; 把emacs最小化
  (setq filename
        (concat (make-temp-name "img-") ".png"))
  ;; (shell-command (format "boxcutter e:/Rick/Emacs/emacs-26.3/org-notes/Pics/\"%s\"" filename))
  (shell-command (concat "i_view64 /capture=4 /convert=" "\"e:\\Rick\\Emacs\\emacs-26.3\\org-notes\\Pics" (format "\\%s\"" filename)))
  (insert (concat "[[~/org-notes/Pics/" filename "]]"))
  (shell-command (format "picpick e:/Rick/Emacs/emacs-26.3/org-notes/Pics/\"%s\"" filename))
  )

(define-key org-mode-map (kbd "C-c r") 'rick/cut)
;;end


;;windows setenv PATH
;;(setenv "PATH" "C:/texlive/2020/bin/win32;")
;;(setenv "PATH" "C:/msys64/mingw64/bin;")
(setenv "PATH" (concat "C:/msys64/mingw64/bin;" (getenv "PATH")))
(setenv "PATH" (concat "c:/msys64/usr/bin;" (getenv "PATH")))
;;(setq shell-file-name (executable-find "zsh.exe"))

;;;; org-agenda设置
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("P" "Printed agenda"
               ((agenda "" ((org-agenda-span 7) ;; overview of appointments
                            (org-agenda-start-on-weekday nil) ;; calendar begins today
                            (org-agenda-repeating-timestamp-show-all t)
                            (org-agenda-entry-types '(:timestamp :sexp))))
                (agenda "" ((org-agenda-span 1) ; daily agenda
                            (org-deadline-warning-days 7) ; 7 day advanced warning for deadlines
                            (org-agenda-todo-keyword-format "[ ]")
                            (org-agenda-scheduled-leaders '("" ""))
                            (org-agenda-prefix-format "%t%s")))
                (todo "TODO" ;; todos sorted by context
                      ((org-agenda-prefix-format "[ ] %T: ")
                       (org-agenda-sorting-strategy '(tag-up priority-down))
                       (org-agenda-todo-keyword-format "")
                       (org-agenda-overriding-header "\nTasks by Context\n------------------\n"))))
               ((org-agenda-with-colors nil)
                (org-agenda-compact-blocks t)
                (org-agenda-remove-tags t)
                (ps-number-of-columns 2)
                (ps-landscape-mode t))
               ("~/agenda.ps"))
              ("x" "With deadline columns" todo ""
               ((org-agenda-overriding-columns-format "%ITEM %DEADLINE")
                (org-agenda-view-columns-initially t))
               ((org-agenda-compact-blocks t)))
              ("d" "Daily Task List"
               ((agenda "" ((org-agenda-span 3)))
                ;; limits the agenda display to a single day
                ;;(tags-todo "+PRIORITY=\"A\"")
                ;;(tags-todo "computer|office|phone")
                ;;(tags "project+CATEGORY=\"elephants\"")
                ;;(tags "review" ((org-agenda-files '("~/org/circuspeanuts.org"))))
                ;; limits the tag search to the file circuspeanuts.org
                (todo "NEXT"))
               ((org-agenda-compact-blocks t)))))) ;; options set here apply to the entire block
(when (and *is-a-mac* (file-directory-p "/Applications/org-clock-statusbar.app"))
  (add-hook 'org-clock-in-hook
            (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e"
                                (concat "tell application \"org-clock-statusbar\" to clock in \"" org-clock-current-task "\""))))
  (add-hook 'org-clock-out-hook
            (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e"
                                "tell application \"org-clock-statusbar\" to clock out"))))

(when (maybe-require-package 'org-pomodoro)
  (setq org-pomodoro-keep-killed-pomodoro-time t)
  (after-load 'org-agenda
    (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro))
  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (interactive)
              (org-pomodoro '(25))))
  )

(setq org-agenda-skip-deadline-prewarning-if-scheduled t)
(setq org-agenda-skip-scheduled-delay-if-deadline t)

(after-load 'org-agenda
  (add-hook 'org-agenda-mode-hook
            (lambda () (add-hook 'window-configuration-change-hook 'org-agenda-align-tags nil t))))


;;set transparent effect
(global-set-key [(f12)] 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )
;;;; org编程
(require 'ob-C)
(require 'ob-python)

(setq org-structure-template-alist
      (quote(("a" . "export ascii")
             ("c" . "center")
             ("C" . "comment")
             ("e" . "example")
             ("E" . "export")
             ("h" . "export html")
             ("l" . "export latex")
             ("q" . "quote")
             ("s" . "src")
             ("v" . "verse"))))
;;Org babel
(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((R . t)
     (ditaa . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . nil)
     (latex . t)
     (ledger . t)
     (ocaml . nil)
     (octave . t)
     (plantuml . t)
     (C . t)
     (python . t)
     (ruby . t)
     (screen . nil)
     (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     (sql . t)
     (sqlite . t))))




;;;; 系统增强
;;放到load-path中，配置文件中添加
(require-package 'undo-tree)
(global-undo-tree-mode)

(require-package 'darkroom)

(when (maybe-require-package 'calfw-org)
  ;;(setq cfw:org-agenda-schedule-args '(:timestamp))
  )

(add-to-list 'org-agenda-custom-commands
             `("k" . "Calendar...") t)

;; Calendar view for org-agenda.
(when (locate-library "calfw-org")

  (autoload 'cfw:open-org-calendar "calfw-org"
    "Open an Org schedule calendar." t)
  (add-to-list 'org-agenda-custom-commands
               `("km" "Calendar for current month"gun
                 (lambda (&rest ignore)
                   (cfw:open-org-calendar))) t)
  )

(require-package 'cal-china-x)
(setq mark-holidays-in-calendar t)
;; (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
;; (setq cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")))
;; (setq other-holidays '((holiday-lunar 1 18 "梦丽生日")
;;                        (holiday-lunar 6 4 "我的生日")))
;; ;;(setq other-holidays '())
;; ;;(setq other-holidays '( (holiday-lunar 1 18 "女神生日")))
;; (setq calendar-holidays
;;       (append cal-china-x-important-holidays
;;               cal-china-x-general-holidays
;;               other-holidays))

(defun reset-frame()
  (interactive)
  ;;设置窗口位置为屏库左上角(0,0)
  (set-frame-position (selected-frame) 1290 0)
  ;;设置宽和高
  (set-frame-width (selected-frame) 50)
  (set-frame-height (selected-frame) 44))



(defun my/copy-idlink-to-clipboard() "Copy an ID link with the
headline to killring, if no ID is there then create a new unique
ID.  This function works only in org-mode or org-agenda buffers.

The purpose of this function is to easily construct id:-links to
org-mode items. If its assigned to a key it saves you marking the
text and copying to the killring."
       (interactive)
       (when (eq major-mode 'org-agenda-mode) ;switch to orgmode
         (org-agenda-show)
         (org-agenda-goto))
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
         (setq mytmphead (nth 4 (org-heading-components)))
         (setq mytmpid (funcall 'org-id-get-create))
         (setq mytmplink (format "[[id:%s][%s]]" mytmpid mytmphead))
         (kill-new mytmplink)
         (message "Copied %s to killring (clipboard)" mytmplink)
         ))

;;cscope
;; (require-package 'xcscope)
;; (add-to-list 'load-path "~/.emacs.d/site-lisp")
;; (require 'xcscope+)
;; (setq cscope-do-not-update-database t)

;; (require-package 'org-alert)
;; (setq alert-default-style 'libnotify)

(setenv "PATH" (concat "e:/Rick/Emacs/emacs-26.3/.emacs.d/site-lisp;" (getenv "PATH")))

(defun org-pomodoro-notify (title message)
  "Temporary replacement for function of the same name which uses
the buggy alert.el package.  TITLE is the title of the MESSAGE."
  (let*
      ((toast "toast")
       (t-title (concat " -t \"" title))
       (t-message (concat "\" -m \"" message "\""))
       (t-image (concat " -p \"e:\\Rick\\Emacs\\emacs-26.3\\.emacs.d\\site-lisp\\org-icon.png\""))
       (t-wait " -w nil")
       (my-command (concat toast t-title t-message t-image t-wait)))
    (call-process-shell-command my-command)))

;;(setq confirm-kill-emacs
;;(lambda (prompt) (y-or-n-p-with-timeout "Whether to quit Emacs:" 10 "y")))

(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
        (end (line-beginning-position 2)))
    (if (eq last-command 'quick-copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end))))
  (beginning-of-line 2)
  (message "Line appended to kill-ring."))


(defun load-journal-file ()
  (interactive)
  (find-file "~/org-notes/journal.org"))
(defun load-local-init-file ()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-local.el"))
(defun load-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun load-gtd-file ()
  (interactive)
  (find-file "~/org-notes/inbox.org"))

(require-package 'cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode

(require-package 'neotree)
(global-set-key [f2] 'neotree-toggle)

;;;; 配置备份和维护记录

(require-package 'outline-magic)
(eval-after-load 'outline
  '(progn
     (require 'outline-magic)
     (define-key outline-minor-mode-map (kbd "<C-tab>") 'outline-cycle)))


(defun rick/orgfile-export ()
  (interactive)
  (save-buffer)
  (save-some-buffers t)
  (call-process-shell-command "C:Users/066063/AppData/Local/Programs/Git/bin/bash.exe -c \"cd e:/Rick/Emacs/emacs-26.3/org-notes;
                         git pull;
                         git add .;
                         git commit -am '- daily commit';
  ;;                       git push origin master;
                                            \" " nil 0 )
  (message "orgfile export done."))

(defun rick/config-export ()
  (interactive)
  (save-buffer)
  (save-some-buffers t)
  (call-process-shell-command "C:Users/066063/AppData/Local/Programs/Git/bin/bash.exe -c \"cd e:/Rick/Emacs/emacs-26.3/.emacs.d;
                         git pull;
                         git add .; git commit -am '- daily commit';
  ;;                       git push origin master;
                                            \"" nil 0 )
  (message "config export done."))



(setenv "PATH" (concat "C:/Graphviz2.38/bin;" (getenv "PATH")))
;;(load "graphviz-dot-mode.el" nil t t)
(require-package 'graphviz-dot-mode)

;; (add-hook 'find-file-hook (lambda()
;;                             (if (string= "dot" (file-name-extension
;;                                                 buffer-file-name))
;;                                 (progn
;;                                   (message "Enabling Setings for dot-mode")
;;                                   (setq fill-column 1000)
;;                                         ;(base-auto-pair)
;;                                   (linum-mode)
;;                                   )
;;                               )))



(defun random-alphanum ()
  (let* ((charset "abcdefghijklmnopqrstuvwxyz0123456789")
         (x (random 36)))
    (char-to-string (elt charset x))))

(defun create-password ()
  (let ((value ""))
    (dotimes (number 16 value)
      (setq value (concat value (random-alphanum))))))


(defun get-or-create-password ()
  (setq password (read-string "Password: "))
  (if (string= password "")
      (create-password)
    password))

(add-to-list 'org-capture-templates
             '("P" "Passwords" entry (file+headline "~/org-notes/inbox.org" "PassWords";; "~/org-notes/passwords.org.gpg"
                                                    )
               "* %U - %^{title} \n  - 用户名: %^{用户名}\n  - 密码: %(get-or-create-password)"
               :empty-lines 1 :kill-buffer t))

(defun org-capture-template-goto-link ()
  (org-capture-put :target (list 'file+headline
                                 (nth 1 (org-capture-get :target))
                                 (org-capture-get :annotation)))
  (org-capture-put-target-region-and-position)
  (widen)
  (let ((hd (nth 2 (org-capture-get :target))))
    (goto-char (point-min))
    (if (re-search-forward
         (format org-complex-heading-regexp-format (regexp-quote hd)) nil t)
        (org-end-of-subtree)
      (goto-char (point-max))
      (or (bolp) (insert "\n"))
      (insert "* " hd "\n"))))
(add-to-list 'org-capture-templates '("p" "Protocol"))
(add-to-list 'org-capture-templates
             '("pa" "Protocol Annotation" plain
               (file+function "" org-capture-template-goto-link)
               "  %U - %?\n\n  %:initial" :empty-lines 1))
(add-to-list 'org-capture-templates
             '("pb" "Protocol Bookmarks" entry
               (file+headline "" "Bookmarks")
               "* %U - %:annotation %i" :immediate-finish t :kill-buffer t))


;; (defun sanityinc/grab-ditaa (url jar-name)
;;   "Download URL and extract JAR-NAME as `org-ditaa-jar-path'."
;;   ;; TODO: handle errors
;;   (message "Grabbing %s for org." jar-name)
;;   (let ((zip-temp (make-temp-name "emacs-ditaa")))
;;     (unwind-protect
;;         (progn
;;           (when (executable-find "unzip")
;;             (url-copy-file url zip-temp)
;;             (shell-command (concat "unzip -p " (shell-quote-argument zip-temp)
;;                                    " " (shell-quote-argument jar-name) " > "
;;                                    (shell-quote-argument org-ditaa-jar-path)))))
;;       (when (file-exists-p zip-temp)
;;         (delete-file zip-temp)))))

;; (after-load 'ob-ditaa
;;   (unless (and (boundp 'org-ditaa-jar-path)
;;                (file-exists-p org-ditaa-jar-path))
;;     (let ((jar-name "ditaa0_9.jar")
;;           (url "http://jaist.dl.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip"))
;;       (setq org-ditaa-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
;;       (unless (file-exists-p org-ditaa-jar-path)
;;         (sanityinc/grab-ditaa url jar-name)))))
;;*** plantuml
(after-load 'ob-plantuml
  (let ((jar-name "plantuml.jar")
        (url "http://jaist.dl.sourceforge.net/project/plantuml/plantuml.jar"))
    (setq org-plantuml-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
    (unless (file-exists-p org-plantuml-jar-path)
      (url-copy-file url org-plantuml-jar-path))))
;;;; 系统冲突修正
(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'org-mode-hook 'hide-ctrl-M)



;;解决emacsclient打开路径中包含中文会乱码的问题
(when (eq system-type 'windows-nt)
  (setq locale-coding-system 'gb18030)  ;此句保证中文字体设置有效
  (setq w32-unicode-filenames 'nil)       ; 确保file-name-coding-system变量的设置不会无效
  (setq file-name-coding-system 'gb18030) ; 设置文件名的编码为gb18030
  )





;;;; 快捷键设置
(global-set-key (kbd "C-z") 'reset-frame)
(global-set-key (kbd "C-c z") 'aweshell-toggle)
(global-set-key (kbd "<f1>") 'rand-theme-iterate)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)


(global-set-key (kbd "<f2>") 'my/copy-idlink-to-clipboard)
(global-set-key (kbd "<f6>") 'load-journal-file)
(global-set-key (kbd "<f4>") 'load-init-file)
(global-set-key (kbd "<f5>") 'load-gtd-file)
(global-set-key (kbd "<f3>") 'load-local-init-file)

(global-set-key (kbd "<f7>") 'org-pomodoro)
(global-set-key (kbd "C-f") 'eval-buffer)
;;(global-set-key (kbd "C-e") 'toggle-truncate-lines)
(global-set-key (kbd "C-,") 'backward-page) ;文件首
(global-set-key (kbd "C-.") 'forward-page);文件尾
(define-key global-map (kbd "C-M-c") 'quick-copy-line)


(require-package 'ox-ioslide)
(require-package 'makey)
(require 'ox-ioslide-helper)

;;(require-package 'pdf-tools)
;;(require-package 'rg-pdfview)
;;(require-package 'org-pdftools)

;;(require-package 'openwith)
;;(setq openwith-associations '(("\\.pdf\\'" "Adobe Reader" (file))))

;;(setq pomodoro-add-to-mode-line nil)
;; Emacs 启动时所在的位置
;;(setq default-frame-alist '((right . 0) (bottom . 0) (width . 50) (height . 50)))


;; (custom-set-variables
;;  '(org-pomodoro-format "•%s")
;;  '(org-pomodoro-short-break-format "•%s") )

;; (setq terminal-notifier-command
;;       "~/.emacs.d/site-lisp/toast.exe")
;; (defun mukhali/terminal-notifier-notify (title message)
;;   (shell-command-to-string
;;    (concat terminal-notifier-command
;;            " -t" title
;;            " -p" "~/.emacs.d/site-lisp/org-icon.png"
;;            " -m" message
;;            " -w" nil)))
;; (add-hook 'org-pomodoro-finished-hook
;;           (lambda ()
;;             (mukhali/terminal-notifier-notify "Pomodoro" "time-for-relax")))
;; (add-hook 'org-pomodoro-short-break-finished-hook
;;           (lambda ()
;;             (mukhali/terminal-notifier-notify "Break-Completed" "ready-for-another?")))
;;(openwith-mode t)


(setenv "PATH" (concat "C:/Program Files/Java/jre1.8.0_181/bin;" (getenv "PATH")))




;;emacs的界面效果增强
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/awesome-tray"))
(require 'awesome-tray)
(awesome-tray-mode 1)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/lazycat-theme"))
(require 'lazycat-theme)
;;(lazycat-theme-load-dark)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/awesome-tab"))

(require 'awesome-tab)

(awesome-tab-mode t)

(setq awesome-tab-display-icon nil)

(setq awesome-tab-height 120)
;; (setq-default mode-line-format (remove 'mode-line-buffer-identification mode-line-format))


;;awesome-tray效果适配，隐藏mode-line
;;(setq mode-line-format nil)
(setq-default mode-line-format nil)

;;eshell功能增强
(require-package 'eshell-prompt-extras)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/aweshell"))
(require 'aweshell)



(provide 'init-local)

;; Local Variables:
;; mode: outline-minor-mode
;; outline-regexp: ";;;"
;; coding: utf-8
;; no-byte-compile: t
;; End:

;;; init-local.el ends here
