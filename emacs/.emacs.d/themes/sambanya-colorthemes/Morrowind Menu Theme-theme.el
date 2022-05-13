(deftheme Morrowind Menu Theme
  "Created 2022-02-19.")

(custom-theme-set-faces
 'Morrowind Menu Theme
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#735229" :foreground "#c9a557" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "SRC" :family "Hack"))))
 '(cursor ((t (:background "#000000"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:inherit bold :foreground "#c9a557"))))
 '(highlight ((t (:foreground "#b2b2b2" :background "#222"))))
 '(region ((t (:extend t :background "#212a63"))))
 '(shadow ((t (:foreground "#704e29"))))
 '(secondary-selection ((t (:extend t :background "#100a14"))))
 '(trailing-whitespace ((t (:background "#9d3115"))))
 '(font-lock-builtin-face ((t (:foreground "#283bb4"))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:background "#292e34" :foreground "#12249a" :slant normal))))
 '(font-lock-constant-face ((t (:foreground "#0f6331"))))
 '(font-lock-doc-face ((t (:foreground "#9f8766"))))
 '(font-lock-function-name-face ((t (:foreground "#027731" :inherit bold))))
 '(font-lock-keyword-face ((t (:slant normal :foreground "#c9a557" :inherit bold))))
 '(font-lock-negation-char-face ((t (:foreground "#0f6331"))))
 '(font-lock-preprocessor-face ((t (:foreground "#0a803a"))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "#2d9574"))))
 '(font-lock-type-face ((t (:inherit bold :foreground "#a48954"))))
 '(font-lock-variable-name-face ((t (:foreground "#5a6cdd"))))
 '(font-lock-warning-face ((t (:background "#292b2e" :foreground "#e85100"))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:foreground "#12249a" :underline t))))
 '(link-visited ((t (:foreground "#128c43" :underline t))))
 '(fringe ((t (:foreground "#b2b2b2" :background "#292b2e"))))
 '(header-line ((t (:background "#212026"))))
 '(tooltip ((t (:background "#212a63" :foreground "#c9a557" :underline nil :slant normal :weight normal))))
 '(mode-line ((t (:box (:line-width 1 :color "#5d4d7a" :style nil) :foreground "#b2b2b2" :background "#222226"))))
 '(mode-line-buffer-id ((t (:foreground "#027731" :inherit bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:box (:line-width 1 :color "#5d4d7a" :style nil) :foreground "#b2b2b2" :background "#292b2e"))))
 '(isearch ((t (:background "#058535" :foreground "#292b2e"))))
 '(isearch-fail ((t (:background "#9d3115"))))
 '(lazy-highlight ((t (:background "#004316" :weight normal))))
 '(match ((t (:background "#444155" :foreground "#06a81b"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'Morrowind Menu Theme)