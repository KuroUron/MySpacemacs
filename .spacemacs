; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; @ List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     ;; html
     ;; javascript
     ;; markdown
     (markdown :variables markdown-live-preview-engine 'vmd)
     csv
     windows-scripts
     python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     imenu-list
     git
     ;; markdown
     org
     ;; shell
     gtags
     (shell :variables
            ;; shell-default-height 30
            shell-default-position 'full
            ;; shell-default-full-span nil
            )
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; @ List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      hemisu-theme
                                      outline-magic
                                      helm-swoop
                                      google-c-style
                                      ag
                                      ack
                                      pt
                                      realgud
                                      google-this
                                      yatex
                                      migemo
                                      cmake-mode
                                      ;; irony
                                      ;; company-irony

                                      ;; For Language Server Protocol
                                      lsp-mode
                                      lsp-ui
                                      company-lsp
                                      ;; cquery

                                      ;; vmd-mode
                                      ;; ein
                                      ;; markdown-preview-mode
                                      ;; dashboard
                                      ;; jedi
                                      ;; ggtags
                                      ;; realgud-lldb
                                      ;; zen-mode
                                      ;; writeroom-mode
                                      ;; minimap
                                      ;; ddskk
                                      ;; imenu-list
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
 ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         hemisu-dark
                         spacemacs-dark
                         spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.

   dotspacemacs-default-font '("Migu 1M"
                               :size 19
                               :weight regular
                               :width regular
                               :powerline-scale 1.0)

   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 17
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc.
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'nil
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Theme
  ;; (load-theme 'hemisu-dark t)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Linum
  (require 'linum)

  ;; Describe just after line movement
  (defvar linum-line-number 0)
  (declare-function linum-update-current "linum" ())
  (defadvice linum-update-current
      (around linum-update-current-around activate compile)
    (unless (= linum-line-number (line-number-at-pos))
      (setq linum-line-number (line-number-at-pos))
      ad-do-it
      ))

  ;; Delay configulation
  (defvar linum-delay nil)
  (setq linum-delay t)
  (defadvice linum-schedule (around linum-schedule-around () activate)
    (run-with-idle-timer 1.0 nil #'linum-update-current))

  ;; Format
  (defvar linum-format nil)
  (setq linum-format "%5d")
  (global-linum-mode t)
  (set-face-attribute 'linum nil :height 0.75)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Org
  (require 'org)
  ;; (autoload 'org "org" nil t)
  (add-hook 'org-mode-hook
            '(lambda ()
               (org-bullets-minor-mode nil)
               ))
  (define-key evil-motion-state-map (kbd "C-o") 'nil)
  ;; (define-key org-mode-map (kbd "C-o") 'outline-cycle)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Helm

  ;; Helm-mimi by C-@
  (define-key global-map (kbd "C-@") 'helm-mini)

  ;; Activate C-k, and add it to the kill-ring
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents
      (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))

  ;; Treatment for the following error:
  ;; Error (use-package): helm/:config: Helm-mode enabled \
  ;;   (Ido is incompatible with Helm-mode, disabling it)
  (ido-mode nil)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Helm-swoop
  (require 'helm-swoop)
  (global-set-key (kbd "C-S-s") 'helm-swoop)
  (require 'org)
  (define-key org-mode-map (kbd "C-S-s") 'helm-occur)

  ;; Boost invoke speed
  (setq helm-swoop-speed-or-color nil)

  ;; Disable auto-complement
  (setq helm-swoop-pre-input-function
        (lambda () ""))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Shell

  ;; '((shell :variables shell-default-full-span nil))

  ;; (defun cmd ()
  ;;   (interactive)
  ;;   (shell)
  ;;   (set-buffer-process-coding-system 'cp932 'cp932)
  ;;   (set-buffer-file-coding-system 'cp932)
  ;;   ;; (set-terminal-coding-system 'cp932)
  ;;   )

  ;; (require 'shell)
  ;; (setq shell-command-switch "-ic")
  ;; (setq shell-file-name
  ;;       ;; "C:\\gnupack_devel-13.06-2015.11.08\\app\\cygwin\\cygwin\\bin\\bash.exe"
  ;;       ;; "C:\\Program Files\\Git\\bin\\bash.exe"
  ;;       ;; "C:\\cygwin64\\bin\\bash.exe"
  ;;       "C:\\msys64\\usr\\bin\\bash.exe"
  ;;       )
  ;; ;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  ;; (setq explicit-shell-file-name "C:\\msys64\\usr\\bin\\bash.exe")
  ;; (setq shell-file-name "bash")
  ;; (setq explicit-bash.exe-args '(
  ;;                                ;; "--login"
  ;;                                "-i"))
  ;; ;; <- Have also tried -c, and without "--login"
  ;; (setenv "SHELL" shell-file-name)
  ;; (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

  ;; (setq shell-file-name "bash")
  ;; (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
  ;; (setenv "SHELL" shell-file-name)
  ;; (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

  ;; (setq explicit-shell-file-name "C:\\msys64\\usr\\bin\\bash.exe")

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Google-c-style
  (add-hook 'c-mode-common-hook 'google-set-c-style)

  ;; If you want the RETURN key to go to the next line and space over
  ;; to the right place, add this to your .emacs right after the load-file:
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Pt
  (require 'pt)

  ;; Get file path
  (defun my-get-file-path ()
    (interactive)
    (let* ((file-name (buffer-file-name))
           (file-path (file-name-directory file-name)))
      (kill-new file-path)))

  (defun my-pt-regexp (regexp directory &optional args)
    "Run a pt search with REGEXP rooted at DIRECTORY."
    (interactive (list (read-from-minibuffer "Pt search for: "
                                             ;; (thing-at-point 'symbol)
                                             "")
                       (my-get-file-path)))
    (let ((default-directory (file-name-as-directory directory)))
      (compilation-start
       (mapconcat 'identity
                  (append (list pt-executable)
                          pt-arguments
                          args
                          '("-e" "--nogroup" "--color" "--")
                          (list (shell-quote-argument regexp) ".")) " ")
       'pt-search-mode)))

  (global-set-key (kbd "C-S-g") 'my-pt-regexp)

  ;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; @ Skk
  ;; (global-set-key (kbd "C-\\") 'skk-mode)

  ;; ;; About kutouten
  ;; ;; (setq-default skk-kutouten-type 'en)
  ;; ;; (setq-default skk-kutouten-type 'jp)
  ;; (skk-mode -1)
  ;; (define-key evil-normal-state-map (kbd "<escape>") '(lambda ()
  ;;                                            (interactive)
  ;;                                            (skk-mode -1)
  ;;                                            (evil-force-normal-state)))
  ;; (define-key evil-hybrid-state-map (kbd "<escape>") '(lambda ()
  ;;                                                       (interactive)
  ;;                                                       (skk-mode -1)
  ;;                                                       (evil-force-normal-state)))


  ;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; @ Auto-completion

  ;; (require 'auto-complete)
  ;; (global-auto-complete-mode)

  ;; (require 'auto-complete-config)

  ;; ;; Calling this function enables ac-mode for several modes, including c++-mode
  ;; (ac-config-default)

  ;; ;; (add-to-list 'ac-modes 'c-mode)
  ;; ;; (add-to-list 'ac-modes 'c++-mode)
  ;; ;; (add-to-list 'ac-modes 'yatex-mode)
  ;; ;; (add-to-list 'ac-modes 'python-mode)

  ;; ;; Completion selection by C-n/C-p
  ;; (setq ac-use-menu-map t)

  ;; ;; Yasnippet is also included in completion
  ;; (setq-default ac-sources (push 'ac-source-yasnippet ac-sources))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ lsp-mode

  (use-package lsp-mode
    :commands lsp)
  (use-package company-lsp)
  (use-package lsp-ui
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))

  ;; company の backend に追加
  (use-package company
    :config
    (global-company-mode)
    (push 'company-lsp company-backends))

  ;; python-mode の使用時に起動
  (use-package python
    :config
    (add-hook 'python-mode-hook #'lsp))

  ;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; @ cquery

  ;; (require 'cquery)
  ;; ;; (setq cquery-executable "cquery.exe")

  ;; ;; To turn on cquery for all C/C++ modes:
  ;; (defun cquery//enable ()
  ;;   (condition-case nil
  ;;       (lsp)
  ;;     (user-error nil)))

  ;; (use-package cquery
  ;;   :commands lsp-cquery-enable
  ;;   :init (add-hook 'c-mode-hook #'cquery//enable)
  ;;   (add-hook 'c++-mode-hook #'cquery//enable))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Company

  (require 'company)
  (global-company-mode t)

  (setq company-idle-delay 0.2)
  ;; (define-key company-active-map (kbd "C-h") 'nil)  ; for backspace
  (define-key company-active-map (kbd "C-S-h") 'company-show-doc-buffer)  ; for doc

  ;; Appearance
  (set-face-attribute 'company-tooltip nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil
                      :foreground "white" :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil
                      :foreground "black" :background "steelblue")
  (set-face-attribute 'company-preview-common nil
                      :background nil :foreground "white" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
                      :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
                      :background "gray40")


  ;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; @ irony-mode

  ;; ;; NOTE How to build irony-server
  ;; ;; Require:
  ;; ;;   (1) irony has been installed by ELPA
  ;; ;;   (2) clang has been installed by msys2
  ;; ;; > cd c:/Users/shimizu_s/.emacs.d/elpa/irony-20181030.834/server/
  ;; ;; > mkdir build & cd build
  ;; ;; > cmake -DLIBCLANG_INCLUDE_DIR=c:/msys64/mingw64/include/llvm/ -DLIBCLANG_LIBRARY=c:/msys64/mingw64/lib/libclang.dll.a -DCMAKE_INSTALL_PREFIX=c:/Users/shimizu_s/.emacs.d/irony/ -DCMAKE_CXX_COMPILER=clang++ -G "MSYS Makefiles" ..
  ;; ;; > cmake --build . --use-stderr --config Release --target install
  ;; ;; or simply
  ;; ;; 1. M-x irony-install-server
  ;; ;; 2. "cmake" "-DCMAKE_INSTALL_PREFIX=c:/Users/shimizu_s/.emacs.d/irony/" "-DLIBCLANG_INCLUDE_DIR=c:/msys64/mingw64/include/llvm/" "-DLIBCLANG_LIBRARY=c:/msys64/mingw64/lib/libclang.dll.a" -G "MSYS Makefiles" "c:/Users/shimizu_s/.emacs.d/elpa/irony-20181030.834/server" && "cmake" --build . --use-stderr --config Release --target install

  ;; ;; NOTE 2018-11-26 We use company-mode for irony front-end instead of
  ;; ;; ac-irony, because (i) company-mode is the default front-end, and
  ;; ;; (ii) cooperation of ac-irony and yasnippet seems not good.
  ;; (require 'irony)
  ;; (add-hook 'c-mode-hook 'irony-mode)
  ;; (add-hook 'c++-mode-hook 'irony-mode)
  ;; (add-to-list 'company-backends 'company-irony) ; Add back-end
  ;; ;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)  ; for cmake

  ;; ;; Windows performance tweaks
  ;; (when (boundp 'w32-pipe-read-delay)
  ;;   (setq w32-pipe-read-delay 0))
  ;; ;; Set the buffer size to 64K on Windows (from the original 4K)
  ;; (when (boundp 'w32-pipe-buffer-size)
  ;;   (setq irony-server-w32-pipe-buffer-size (* 64 1024)))


  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Yatex
  (setq auto-mode-alist  (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
  (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

  ;; Typeset command
  (defun my-typeset-and-dvi2pdf ()
    (interactive)
    (let ((mycommand (concat "platex.exe "
                             (file-name-base) ".tex "
                             ;; "&& " "platex.exe " (file-name-base) ".tex "
                             "&& " "dvipdfmx.exe " (file-name-base) ".dvi")))
      (save-buffer)
      (async-shell-command mycommand "*Async Shell Command (TeX typeset)*")))

  ;; Display PDF
  (defun my-display-pdf ()
    (interactive)
    (let* ((mycommand (concat "SumatraPDF.exe " (file-name-base) ".pdf")))
      (async-shell-command mycommand)
      (delete-other-windows)))

  ;; Key-bind
  (eval-after-load 'yatex
    `(evil-define-key 'normal YaTeX-mode-map (kbd "C-j") 'my-typeset-and-dvi2pdf))
  (eval-after-load 'yatex
    `(evil-define-key 'normal YaTeX-mode-map (kbd "C-S-j") 'my-display-pdf))

  ;; Input label (generated by date and time)
  (defun input-label()
    (interactive)
    (insert (format-time-string "%Y%m%d%H%M%S" (current-time))))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ flyspell
  (add-hook 'yatex-mode-hook 'flyspell-mode)


  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Yasnippet

  ;; Insert snippet
  (define-key yas-minor-mode-map (kbd "C-c i i") 'yas-insert-snippet)
  ;; Create snippet
  (define-key yas-minor-mode-map (kbd "C-c i n") 'yas-new-snippet)
  ;; Edit snippet
  (define-key yas-minor-mode-map (kbd "C-c i v") 'yas-visit-snippet-file)
  ;; Expand snippet
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Org

  ;; State of todo
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)" "UNKN(u)")))

  (set-default-coding-systems 'utf-8-unix)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Python
  (require 'python)
  (defun my-python-run-env ()
    (interactive)
    (let ((command (concat "python " (file-name-base) ".py")))
      (save-buffer)
      (setq popwin:special-display-config '(()))
      ;; XXX I don't check this value go back to the original value
      ;; after python-mode end.
      (async-shell-command command)))
  (defun my-python-async-shell-command (command &optional output-buffer error-buffer)
    (interactive
     (list
      (read-shell-command "Async shell command: "
                          (concat "python " (file-name-base) ".py ")
                          nil
                          (let ((filename
                                 (cond
                                  (buffer-file-name)
                                  ((eq major-mode 'dired-mode)
                                   (dired-get-filename nil t)))))
                            (and filename (file-relative-name filename))))
      current-prefix-arg
      shell-command-default-error-buffer))
    (save-buffer)
    (unless (string-match "&[ \t]*\\'" command)
      (setq command (concat command " &")))
    (shell-command command output-buffer error-buffer))
  (eval-after-load 'python
    `(evil-define-key 'normal python-mode-map (kbd "C-j") 'my-python-run-env))
  (eval-after-load 'python
    `(evil-define-key 'normal python-mode-map (kbd "C-S-j") 'my-python-async-shell-command))
  (eval-after-load 'python
    `(evil-define-key 'normal python-mode-map (kbd "E") 'my-python-run-env))


  ;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; @ jedi
  ;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; cf. http://ksknw.hatenablog.com/entry/2016/05/07/171239

  ;; (jedi:setup)
  ;; (define-key jedi-mode-map (kbd "<C-tab>") nil) ;;C-tabはウィンドウの移動に用いる
  ;; (setq jedi:complete-on-dot t)
  ;; (setq ac-sources
  ;;       (delete 'ac-source-words-in-same-mode-buffers ac-sources)) ;;jediの補完候補だけでいい
  ;; (add-to-list 'ac-sources 'ac-source-filename)
  ;; (add-to-list 'ac-sources 'ac-source-jedi-direct)
  ;; (define-key python-mode-map "\C-ct" 'jedi:goto-definition)
  ;; (define-key python-mode-map "\C-cb" 'jedi:goto-definition-pop-marker)
  ;; (define-key python-mode-map "\C-cr" 'helm-jedi-related-names)


  ;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; @ Zen mode
  ;; (add-to-list 'load-path
  ;;              (expand-file-name
  ;;               "c:/Users/shimizu_s/.emacs.d/my_elisp/zen-mode-master"))
  ;; (require 'zen-mode)

  ;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ;; @ Minimap
  ;; (require 'minimap)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Coding

  ;; Textfile or new buffer coding
  (prefer-coding-system 'utf-8)

  ;; File name coding
  (set-file-name-coding-system 'utf-8)

  ;; Keyboard input coding
  (set-keyboard-coding-system 'utf-8)

  ;; Subprocess coding
  ;; (setq default-process-coding-system '(undecided-dos . sjis))
  ;; (setq default-process-coding-system '(undecided-dos . utf-8-unix))
  (setq default-process-coding-system '(sjis . sjis))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ IME
  (setq default-input-method "W32-IME")
  (setq-default w32-ime-mode-line-state-indicator "[--]")
  (setq w32-ime-mode-line-state-indicator-list '("[--]" "[JPN]" "[--]"))
  (w32-ime-initialize)

  ;; Color setting
  (add-hook 'w32-ime-on-hook '(lambda () (set-cursor-color "DarkGreen")))
  (add-hook 'w32-ime-off-hook '(lambda () (set-cursor-color "SkyBlue2")))

  ;; When move to minibuffer, deactivate input method
  (add-hook 'minibuffer-setup-hook 'deactivate-input-method)

  ;; ;; When move to isearch, deactivate input method
  ;; (add-hook 'isearch-mode-hook '(lambda ()
  ;;                                 (deactivate-input-method)
  ;;                                 (setq w32-ime-composition-window (minibuffer-window))))
  ;; (add-hook 'isearch-mode-end-hook '(lambda () (setq w32-ime-composition-window nil)))

  ;; ;; When using helm, deactivate input method
  ;; (advice-add 'helm :around '(lambda (orig-fun &rest args)
  ;;                              (let ((select-window-functions nil)
  ;;                                    (w32-ime-composition-window (minibuffer-window)))
  ;;                                (deactivate-input-method)
  ;;                                (apply orig-fun args))))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Macro

  ;; How to save a macro
  ;; 1. After making macro, M-x name-last-kbd-macro Enter MACRO-NAME Enter
  ;; 2. Open init.el, then M-x insert-kbd-macro Enter MACRO-NAME Enter

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Realgud

  ;; NOTE 2018-11-27 Aboud gdb.
  ;; Since realgud seems incompatible with msys2's gdb, using mingw64's
  ;; gdb is recommened.

  (require 'realgud)

  ;; For GDB
  (defun my-realgud-gdb ()
    (interactive)
    (delete-other-windows)
    (split-window-right)
    (realgud:gdb "gdb ./a.out" 1)
    (insert "break main")
    (realgud:send-input)
    (insert "r "))
  (require 'cc-mode)
  (define-key c++-mode-map (kbd "C-S-j") 'my-realgud-gdb)

  ;; Print Command in GDB
  (defun my-gdb-print ()
    (interactive)
    (let ((word (find-tag-default))
          (cmnd "print "))
      (other-window 1)
      (insert (concat cmnd word))
      (realgud:send-input)
      (other-window 1)))

  ;; (defun my-gdb-print ()
  ;;   (interactive)
  ;;   (let ((word (find-tag-default))
  ;;         (cmnd "print "))
  ;;     (save-excursion
  ;;       ;; (switch-to-buffer-other-window "*gdb a.exe shell*")
  ;;       ;; (set-buffer "*gdb a.exe shell*")
  ;;       (other-window 1)
  ;;       (insert (concat cmnd word))
  ;;       (realgud:send-input)
  ;;       (other-window 1))))

  ;; for 3-系
  (defun my-gdb-print ()
    (interactive)
    (let* ((word (find-tag-default))
           (cmnd (concat "print( " word " )")))
      (save-excursion
        ;; (switch-to-buffer-other-window "*gdb a.exe shell*")
        ;; (set-buffer "*gdb a.exe shell*")
        (other-window 1)
        (insert cmnd)
        (realgud:send-input)
        (other-window 1))))

  (define-key realgud:shortkey-mode-map (kbd "p") 'my-gdb-print)


  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Realgud-lldb
  ;; (add-to-list 'load-path
  ;;              (expand-file-name
  ;;               "c:/Users/shimizu_s/.emacs.d/my_elisp/realgud-lldb-master"))
  ;; (require 'realgud-lldb)


  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ migemo
  (require 'migemo)
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "C:/Users/shimizu_s/packages/migemo/cmigemo-default-win64-20110227/cmigemo-default-win64/dict/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (helm-migemo-mode 1)

  ;; Re-definition for evil search
  (defun evil-search-function (&optional forward regexp-p wrap)
    "Return a search function.
If FORWARD is nil, search backward, otherwise forward.
If REGEXP-P is non-nil, the input is a regular expression.
If WRAP is non-nil, the search wraps around the top or bottom
of the buffer."
    `(lambda (string &optional bound noerror count)
       (let ((start (point))
             (search-fun ',(if regexp-p
                               ;;   (if forward
                               ;;       're-search-forward
                               ;;     're-search-backward)
                               ;; (if forward
                               ;;     'search-forward
                               ;;   'search-backward)
                               ;; -------------------------------- patch
                               (if forward
                                   'migemo-forward
                                 'migemo-backward)
                             (if forward
                                 'migemo-forward
                               'migemo-backward)
                             ;; -------------------------------- patch end
                             ))
             result)
         (setq result (funcall search-fun string bound
                               ,(if wrap t 'noerror) count))
         (when (and ,wrap (null result))
           (goto-char ,(if forward '(point-min) '(point-max)))
           (unwind-protect
               (setq result (funcall search-fun string bound noerror count))
             (unless result
               (goto-char start))))
         result)))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ gtags

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ vmd-mode

  ;; (require 'vmd-mode)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Key-binding (keybinding)

  ;; C-h
  ;; (define-key global-map (kbd "C-h") (kbd "DEL"))
  (keyboard-translate ?\C-h ?\C-?)

  ;; M-h
  (define-key global-map (kbd "M-h") 'backward-kill-word)

  ;; C-S-h
  (define-key global-map (kbd "C-S-h") 'mark-whole-buffer)

  ;; C-S-k
  (define-key global-map (kbd "C-S-k") (lambda ()
                                         (interactive)
                                         (kill-buffer (current-buffer))))

  ;; C-<tag>
  (define-key global-map (kbd "C-<tab>") 'dabbrev-expand)
  ;; (define-key global-map (kbd "<tab>") 'dabbrev-expand)
  ;; (defi)

  ;; Large move
  (define-key evil-normal-state-map (kbd "J") 'nil)
  (define-key evil-normal-state-map (kbd "<insert>") 'nil)
  (define-key evil-normal-state-map (kbd "K") 'nil)
  (define-key evil-normal-state-map (kbd "<home>") 'nil)
  (define-key evil-normal-state-map (kbd "H") 'nil)
  (define-key evil-normal-state-map (kbd "L") 'nil)
  (define-key evil-motion-state-map (kbd "J") '(lambda ()
                                                 (interactive)
                                                 (evil-next-line 5)))
  (define-key evil-motion-state-map (kbd "K") '(lambda ()
                                                 (interactive)
                                                 (evil-previous-line 5)))
  (define-key evil-motion-state-map (kbd "H") '(lambda ()
                                                 (interactive)
                                                 (evil-backward-char 5)))
  (define-key evil-motion-state-map (kbd "L") '(lambda ()
                                                 (interactive)
                                                 (evil-forward-char 5)))
  (define-key global-map (kbd "<insert>") '(lambda ()
                                             (interactive)
                                             (next-line 5)))
  (define-key evil-motion-state-map (kbd "<home>") '(lambda ()
                                                      (interactive)
                                                      (evil-previous-line 5)))
  (define-key global-map (kbd "C-S-n") '(lambda ()
                                          (interactive)
                                          (next-line 5)))
  (define-key global-map (kbd "C-S-p") '(lambda ()
                                          (interactive)
                                          (previous-line 5)))
  (define-key global-map (kbd "C-S-b") '(lambda ()
                                          (interactive)
                                          (backward-char 5)))
  (define-key global-map (kbd "C-S-f") '(lambda ()
                                          (interactive)
                                          (forward-char 5)))

  ;; Scroll
  (define-key evil-motion-state-map (kbd "M-j") '(lambda ()
                                                   (interactive)
                                                   (evil-scroll-line-down 5)))
  (define-key evil-motion-state-map (kbd "M-k") '(lambda ()
                                                   (interactive)
                                                   (evil-scroll-line-up 5)))

  ;; Searcher
  (define-key evil-motion-state-map (kbd "s") 'nil)
  (define-key evil-normal-state-map (kbd "s") 'nil)
  (define-key evil-motion-state-map (kbd "s") 'helm-swoop)

  ;; Mark command
  (defun my-mark-1 ()
     "Mark a word around the cursor."
     (interactive)
     (let ((word (find-tag-default)))
       ;; For EOF
       (if (> (+ (point) (length word)) (point-max))
           (progn
             (goto-char (point-max))
             (message "Near EOF"))
         (forward-char (length word)))
       (word-search-backward word)
       (push-mark)
       (word-search-forward word)
       (backward-char 1)
       (message word)
       (activate-mark)))
  (defun my-mark-2 ()
    "Mark white words around the cursor"
    (interactive)
    (push-mark)
    (search-forward-regexp "[^ \t\n]")
    (backward-char 1)
    (activate-mark))
  (define-key evil-normal-state-map (kbd "m") 'my-mark-1)
  (define-key evil-normal-state-map (kbd "M") 'mark-whole-buffer)
  (define-key global-map (kbd "C-S-m") 'my-mark-1)
  (fset 'my-kill-white
        [?\M-x ?m ?y ?- ?m ?a ?r ?k ?- ?2 return ?\C-w])
  (define-key global-map (kbd "M-k") 'my-kill-white)

  ;; Window
  (define-key global-map (kbd "C-S-o") 'other-window)
  (defun my-window-commands (arg)
    (interactive "p")
    (case arg
      (4 (delete-other-windows))
      (16 (split-window-below))
      (64 (split-window-right))
      (t (outline-cycle))))
  (define-key evil-motion-state-map (kbd "C-u") 'nil)
  (define-key global-map (kbd "C-o") 'my-window-commands)
  (defun my-other-window ()
    (interactive)
    (other-window 1)
    (evil-normal-state))
  (define-key evil-normal-state-map (kbd "SPC o") 'my-other-window)

  ;; My original map
  (define-prefix-command 'my-original-map)
  (define-key evil-normal-state-map (kbd "u") 'my-original-map)
  (define-key my-original-map (kbd "o") 'delete-other-windows)
  (define-key my-original-map (kbd "uo") 'split-window-below)
  (define-key my-original-map (kbd "uuo") 'split-window-right)
  (define-key my-original-map (kbd "0") 'delete-window)
  (defun my-recenter ()
    (interactive)
    (let ((height (window-height)))
      (recenter-top-bottom (/ height 2))))
  (defun my-recenter-top ()
    (interactive)
    (recenter-top-bottom 5))
  (defun my-recenter-bottom ()
    (interactive)
    (let ((height (window-height)))
      (recenter-top-bottom (- height 7))))
  (define-key my-original-map (kbd "l") 'my-recenter-top)
  (define-key my-original-map (kbd "ul") 'my-recenter)
  (define-key my-original-map (kbd "uul") 'my-recenter-bottom)
  (define-key my-original-map (kbd "gg") 'helm-gtags-find-tag-other-window)
  (define-key my-original-map (kbd "gG") 'helm-gtags-find-rtag)
  (define-key my-original-map (kbd "gc") 'helm-gtags-create-tags)
  (define-key my-original-map (kbd "gu") 'helm-gtags-update-tags)
  (define-key my-original-map (kbd "gs") 'helm-gtags-find-symbol)

  ;; Change directory to the current file
  (defun my-cd-current-file-directory ()
    (interactive)
    (let* ((file-path (my-get-file-path))
           (command (concat "cd " file-path)))
      ;; (split-window-below)
      ;; (other-window 1)
      (shell)
      (end-of-buffer)
      (kill-new command)
      (yank)
      (comint-send-input)))
  (define-key evil-normal-state-map (kbd "SPC O") 'my-cd-current-file-directory)

  ;; Macro
  (global-set-key (kbd "C-8") 'start-kbd-macro)
  (global-set-key (kbd "C-9") 'end-kbd-macro)
  (global-set-key (kbd "C-0") 'call-last-kbd-macro)

  ;; ;; Move to insert mode
  ;; (define-key evil-normal-state-map (kbd "i") '(lambda ()
  ;;                                                (interactive)
  ;;                                                (evil-insert (point))
  ;;                                                (toggle-input-method)
  ;;                                                (toggle-input-method)))

  ;; Migemo search
  ;; (define-key evil-motion-state-map (kbd "/") 'isearch-forward)
  ;; (define-key evil-motion-state-map (kbd "?") 'isearch-backward)
  ;; (define-key evil-motion-state-map (kbd "n") 'isearch-forward)

  ;; Hook no-highlight to escape command
  (fset 'my-evil-force-normal-state
        [?\M-x ?e ?v ?i ?l ?- ?f ?o ?r ?c ?e ?- ?n ?o ?r ?m ?a ?l ?- ?s ?t ?a ?t ?e return ?: ?n ?o ?h return])
  (define-key evil-normal-state-map (kbd "<escape>") 'my-evil-force-normal-state)


  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ backup

  ;; Backup files for file-open (~) (enabled: t, disabled: nil)
  (setq make-backup-files   t)  ;; auto backup
  (setq version-control     t)  ;; id for backup file
  (setq kept-new-versions   5)  ;; number of the latest owned backup files
  (setq kept-old-versions   0)  ;; number of the oldest owned backup files
  (setq delete-old-versions t)  ;; deltetion of backup files

  ;; Directory of backup files for file-open (~)
  (setq backup-directory-alist
        (cons (cons "\\.*$" (expand-file-name "c:/tmp/emacsbk"))
              backup-directory-alist))

  ;; Backup files for editing (enabled: t, disabled: nil)
  (setq backup-inhibited t)

  ;; Delete auto backup files when finished (enabled: t, disabled: nil)
  (setq delete-auto-save-files nil)

  ;; Backup files for editing (enabled: t, disabled: nil)
  (setq auto-save-list-file-name nil)
  (setq auto-save-list-file-prefix nil)

  ;; Backup interval for editing file (sec)
  (setq auto-save-timeout 3)

  ;; Backup interval for editing file (key-stroke)
  (setq auto-save-interval 100)

  ;; Directory of backup files for editing (##)
  (setq auto-save-file-name-transforms
        `((".*" ,(expand-file-name "c:/tmp/emacsbk") t)))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ whitespace

  (require 'whitespace)

  (setq whitespace-style '(face           ; faceで可視化
                           trailing       ; 行末
                           tabs           ; タブ
                           ;; empty          ; 先頭/末尾の空行
                           ;; space-mark     ; 表示のマッピング
                           ;; tab-mark
                           ))

  ;; (setq whitespace-display-mappings
  ;;       '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

  (global-whitespace-mode 1)

  ;; タブの色
  ;; (set-face-foreground 'whitespace-tab "DarkRed")
  (set-face-foreground 'whitespace-tab "#222222")
  (set-face-underline  'whitespace-tab t)
  (set-face-background 'whitespace-tab nil)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Font

  ;; Default font
  (set-face-font 'default "Migu 1M-14:antialias=standard")

  ;; (set-face-font 'default "Fira Code-12:antialias=standard")

  ;; (w32-select-font)
  ;; (font-family-list)

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; @ Other

  (spaceline-define-segment buffer-encoding-abbrev
    "The line ending convention used in the buffer."
    (let ((buf-coding (format "%s" buffer-file-coding-system)))
      (list (replace-regexp-in-string "-with-signature\\|-unix\\|-dos\\|-mac" "" buf-coding)
            (concat (and (string-match "with-signature" buf-coding) "ⓑ")
                    (and (string-match "unix"           buf-coding) "ⓤ")
                    (and (string-match "dos"            buf-coding) "ⓓ")
                    (and (string-match "mac"            buf-coding) "ⓜ")
                    )))
    :separator " ")

  ;; ;; Mode line
  ;; (spaceline-define-segment buffer-encoding-abbrev
  ;;   "The line ending convention used in the buffer."
  ;;   (let ((buf-coding (format "%s" buffer-file-coding-system)))
  ;;     (list (replace-regexp-in-string "-with-signature\\|-unix\\|-dos\\|-mac" "" buf-coding)
  ;;           (concat
  ;;            (and (string-match "with-signature" buf-coding) ":???")  ; XXX Maybe
  ;;            (and (string-match "unix"           buf-coding) ":Unx")
  ;;            (and (string-match "dos"            buf-coding) ":Dos")
  ;;            (and (string-match "mac"            buf-coding) ":Mac")
  ;;            )))
  ;;   :separator "")

  ;; Disable command "o" in the title buffer
  ;; TODO

  ;; ;; Display time
  ;; (setq display-time-string-forms
  ;;       '((format "%s/%s/%s(%s) %s:%s"
  ;;                 year month day dayname 24-hours minutes)
  ;;         load
  ;;         (if mail " Mail" "")))
  ;; (setq display-time-kawakami-form t)
  ;; (setq display-time-24hr-format t)
  ;; (display-time)

  ;; Disable current line highlight
  (global-hl-line-mode -1)

  ;; Insert closing parenthesis automatically
  (electric-pair-mode 1)

  ;; Blink cursor
  (blink-cursor-mode 1)

  ;; ;; Show line numbers by default
  ;; (global-linum-mode)

  ;; Simplify queries
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; Open smp file as c++-mode
  (add-to-list 'auto-mode-alist '("\\.smp" . c++-mode))

  ;; Tab width
  ;; (setq defalt-tab-width 4)
  (setq-default tab-width 8)

  ;; Delete whitespace before a save
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; Enable to pop mark-ring repeatdly
  (setq set-mark-command-repeat-pop t)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (vmd-mode cquery lsp-ui company-lsp lsp-mode ht web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data markdown-preview-mode web-server ein websocket dashboard page-break-lines treepy graphql company-irony irony cmake-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode jedi jedi-core python-environment epc ctable concurrent deferred writeroom-mode visual-fill-column helm-gtags ggtags migemo smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub let-alist with-editor mmm-mode markdown-toc markdown-mode gh-md yatex google-this minimap realgud test-simple loc-changes load-relative org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ag csv-mode powershell imenu-list helm-company helm-c-yasnippet fuzzy company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete ddskk cdb ccc yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic pt ack google-c-style outline-magic hemisu-theme evil-unimpaired ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(realgud-safe-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:background "black" :foreground "#777777"))))
 '(org-level-1 ((t (:inherit (outline-2 outline-1)))))
 '(org-level-2 ((t (:inherit (outline-3 outline-2)))))
 '(org-level-3 ((t (:inherit (outline-5 outline-4 outline-3)))))
 '(org-level-4 ((t (:inherit (outline-5 outline-4)))))
 '(realgud-bp-line-enabled-face ((t (:underline "red")))))
