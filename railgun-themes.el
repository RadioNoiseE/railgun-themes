;;; railgun-themes.el --- Kernel of the railgun theme -*- lexical-binding: t -*-

;; Copyright (C) 2015-2018  Nasser Alshammari
;; Copyright (C) 2025       Jing Huang

;; Author: Nasser Alshammari <designernasser@gmail.com>
;; Maintainer: Jing Huang <radionoisee@gmail.com>
;; URL: https://github.com/radionoisee/railgun-themes
;; Version: 1.0.0
;; Keywords: faces, theme, accessibility
;; Package-Requires: ((emacs "30.1"))

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;; This is a fork of the default color theme used in spacemacs.  It
;; comes with two variants, dark and light.  Both should work well
;; even in a 256 color terminal.

;;; Code:

(defgroup railgun-themes nil
  "Railgun-themes customizing options."
  :group 'faces)

(defcustom railgun-themes-comment-bg nil
  "Enable background for comment lines."
  :type 'boolean
  :group 'railgun-themes)

(defcustom railgun-themes-comment-italic nil
  "Enable italics for comments while disabling background."
  :type 'boolean
  :group 'railgun-themes)

(defcustom railgun-themes-keyword-italic nil
  "Enable italics for keywords."
  :type 'boolean
  :group 'railgun-themes)

(defcustom railgun-themes-custom-colors nil
  "Specify a list of custom colors."
  :type 'alist
  :group 'railgun-themes)

(defcustom railgun-themes-underline-parens nil
  "If non-nil, underline matching parens when using `show-paren-mode' or similar."
  :type 'boolean
  :group 'railgun-themes)

(defun true-color-p ()
  (or (display-graphic-p)
      (= (tty-display-color-cells) 16777216)))

(defun create-railgun-theme (variant theme-name)
  (let ((class '((class color) (min-colors 89)))

        (act1          (if (eq variant 'dark) (if (true-color-p) "#222226" "#121212") (if (true-color-p) "#e7e5eb" "#d7dfff")))
        (act2          (if (eq variant 'dark) (if (true-color-p) "#5d4d7a" "#444444") (if (true-color-p) "#d3d3e7" "#afafd7")))
        (base          (if (eq variant 'dark) (if (true-color-p) "#b2b2b2" "#b2b2b2") (if (true-color-p) "#655370" "#5f5f87")))
        (base-dim      (if (eq variant 'dark) (if (true-color-p) "#686868" "#585858") (if (true-color-p) "#a094a2" "#afafd7")))
        (bg1           (if (eq variant 'dark) (if (true-color-p) "#292b2e" "#262626") (if (true-color-p) "#fbf8ef" "#ffffff")))
        (bg2           (if (eq variant 'dark) (if (true-color-p) "#212026" "#1c1c1c") (if (true-color-p) "#efeae9" "#e4e4e4")))
        (bg3           (if (eq variant 'dark) (if (true-color-p) "#100a14" "#121212") (if (true-color-p) "#e3dedd" "#d0d0d0")))
        (bg4           (if (eq variant 'dark) (if (true-color-p) "#0a0814" "#080808") (if (true-color-p) "#d2ceda" "#bcbcbc")))
        (bg-alt        (if (eq variant 'dark) (if (true-color-p) "#42444a" "#353535") (if (true-color-p) "#efeae9" "#e4e4e4")))
        (border        (if (eq variant 'dark) (if (true-color-p) "#5d4d7a" "#111111") (if (true-color-p) "#b3b9be" "#b3b9be")))
        (cblk          (if (eq variant 'dark) (if (true-color-p) "#cbc1d5" "#b2b2b2") (if (true-color-p) "#655370" "#5f5f87")))
        (cblk-bg       (if (eq variant 'dark) (if (true-color-p) "#2f2b33" "#262626") (if (true-color-p) "#e8e3f0" "#ffffff")))
        (cblk-ln       (if (eq variant 'dark) (if (true-color-p) "#827591" "#af5faf") (if (true-color-p) "#9380b2" "#af5fdf")))
        (cblk-ln-bg    (if (eq variant 'dark) (if (true-color-p) "#373040" "#333333") (if (true-color-p) "#ddd8eb" "#dfdfff")))
        (cursor        (if (eq variant 'dark) (if (true-color-p) "#e3dedd" "#d0d0d0") (if (true-color-p) "#100a14" "#121212")))
        (const         (if (eq variant 'dark) (if (true-color-p) "#a45bad" "#d75fd7") (if (true-color-p) "#4e3163" "#8700af")))
        (comment       (if (eq variant 'dark) (if (true-color-p) "#2aa1ae" "#008787") (if (true-color-p) "#2aa1ae" "#008787")))
        (comment-light (if (eq variant 'dark) (if (true-color-p) "#2aa1ae" "#008787") (if (true-color-p) "#a49da5" "#008787")))
        (comment-bg    (if (eq variant 'dark) (if (true-color-p) "#292e34" "#262626") (if (true-color-p) "#ecf3ec" "#ffffff")))
        (comp          (if (eq variant 'dark) (if (true-color-p) "#c56ec3" "#d75fd7") (if (true-color-p) "#6c4173" "#8700af")))
        (err           (if (eq variant 'dark) (if (true-color-p) "#e0211d" "#e0211d") (if (true-color-p) "#e0211d" "#e0211d")))
        (func          (if (eq variant 'dark) (if (true-color-p) "#bc6ec5" "#d75fd7") (if (true-color-p) "#6c3163" "#8700af")))
        (head1         (if (eq variant 'dark) (if (true-color-p) "#4f97d7" "#268bd2") (if (true-color-p) "#3a81c3" "#268bd2")))
        (head1-bg      (if (eq variant 'dark) (if (true-color-p) "#293239" "#262626") (if (true-color-p) "#edf1ed" "#ffffff")))
        (head2         (if (eq variant 'dark) (if (true-color-p) "#2d9574" "#2aa198") (if (true-color-p) "#2d9574" "#2aa198")))
        (head2-bg      (if (eq variant 'dark) (if (true-color-p) "#293235" "#262626") (if (true-color-p) "#edf2e9" "#ffffff")))
        (head3         (if (eq variant 'dark) (if (true-color-p) "#67b11d" "#67b11d") (if (true-color-p) "#67b11d" "#5faf00")))
        (head3-bg      (if (eq variant 'dark) (if (true-color-p) "#293235" "#262626") (if (true-color-p) "#edf2e9" "#ffffff")))
        (head4         (if (eq variant 'dark) (if (true-color-p) "#b1951d" "#875f00") (if (true-color-p) "#b1951d" "#875f00")))
        (head4-bg      (if (eq variant 'dark) (if (true-color-p) "#32322c" "#262626") (if (true-color-p) "#f6f1e1" "#ffffff")))
        (highlight     (if (eq variant 'dark) (if (true-color-p) "#444155" "#444444") (if (true-color-p) "#d3d3e7" "#d7d7ff")))
        (highlight-dim (if (eq variant 'dark) (if (true-color-p) "#3b314d" "#444444") (if (true-color-p) "#e7e7fc" "#d7d7ff")))
        (keyword       (if (eq variant 'dark) (if (true-color-p) "#4f97d7" "#268bd2") (if (true-color-p) "#3a81c3" "#268bd2")))
        (lnum          (if (eq variant 'dark) (if (true-color-p) "#44505c" "#444444") (if (true-color-p) "#a8a8bf" "#af87af")))
        (mat           (if (eq variant 'dark) (if (true-color-p) "#86dc2f" "#86dc2f") (if (true-color-p) "#ba2f59" "#af005f")))
        (meta          (if (eq variant 'dark) (if (true-color-p) "#9f8766" "#af875f") (if (true-color-p) "#da8b55" "#df5f5f")))
        (str           (if (eq variant 'dark) (if (true-color-p) "#2d9574" "#2aa198") (if (true-color-p) "#2d9574" "#2aa198")))
        (suc           (if (eq variant 'dark) (if (true-color-p) "#86dc2f" "#86dc2f") (if (true-color-p) "#42ae2c" "#00af00")))
        (ttip          (if (eq variant 'dark) (if (true-color-p) "#9a9aba" "#888888") (if (true-color-p) "#8c799f" "#5f5f87")))
        (ttip-sl       (if (eq variant 'dark) (if (true-color-p) "#5e5079" "#333333") (if (true-color-p) "#c8c6dd" "#afafff")))
        (ttip-bg       (if (eq variant 'dark) (if (true-color-p) "#34323e" "#444444") (if (true-color-p) "#e2e0ea" "#dfdfff")))
        (type          (if (eq variant 'dark) (if (true-color-p) "#ce537a" "#df005f") (if (true-color-p) "#ba2f59" "#af005f")))
        (var           (if (eq variant 'dark) (if (true-color-p) "#7590db" "#8787d7") (if (true-color-p) "#715ab1" "#af5fd7")))
        (war           (if (eq variant 'dark) (if (true-color-p) "#dc752f" "#dc752f") (if (true-color-p) "#dc752f" "#dc752f")))

        (aqua          (if (eq variant 'dark) (if (true-color-p) "#2d9574" "#2aa198") (if (true-color-p) "#2d9574" "#2aa198")))
        (aqua-bg       (if (eq variant 'dark) (if (true-color-p) "#293235" "#262626") (if (true-color-p) "#edf2e9" "#ffffff")))
        (green         (if (eq variant 'dark) (if (true-color-p) "#67b11d" "#67b11d") (if (true-color-p) "#67b11d" "#5faf00")))
        (green-bg      (if (eq variant 'dark) (if (true-color-p) "#293235" "#262626") (if (true-color-p) "#edf2e9" "#ffffff")))
        (green-bg-s    (if (eq variant 'dark) (if (true-color-p) "#29422d" "#262626") (if (true-color-p) "#dae6d0" "#ffffff")))
        (cyan          (if (eq variant 'dark) (if (true-color-p) "#28def0" "#00ffff") (if (true-color-p) "#21b8c7" "#008080")))
        (red           (if (eq variant 'dark) (if (true-color-p) "#f2241f" "#d70000") (if (true-color-p) "#f2241f" "#d70008")))
        (red-bg        (if (eq variant 'dark) (if (true-color-p) "#3c2a2c" "#262626") (if (true-color-p) "#faede4" "#ffffff")))
        (red-bg-s      (if (eq variant 'dark) (if (true-color-p) "#512e31" "#262626") (if (true-color-p) "#eed9d2" "#ffffff")))
        (blue          (if (eq variant 'dark) (if (true-color-p) "#4f97d7" "#268bd2") (if (true-color-p) "#3a81c3" "#268bd2")))
        (blue-bg       (if (eq variant 'dark) (if (true-color-p) "#293239" "#262626") (if (true-color-p) "#edf1ed" "#d7d7ff")))
        (blue-bg-s     (if (eq variant 'dark) (if (true-color-p) "#2d4252" "#262626") (if (true-color-p) "#d1dcdf" "#d7d7ff")))
        (magenta       (if (eq variant 'dark) (if (true-color-p) "#a31db1" "#af00df") (if (true-color-p) "#a31db1" "#800080")))
        (yellow        (if (eq variant 'dark) (if (true-color-p) "#b1951d" "#875f00") (if (true-color-p) "#b1951d" "#875f00")))
        (yellow-bg     (if (eq variant 'dark) (if (true-color-p) "#32322c" "#262626") (if (true-color-p) "#f6f1e1" "#ffffff"))))

    (cl-loop for (cvar . val) in railgun-themes-custom-colors
             do (set cvar val))

    (custom-theme-set-faces
     theme-name

     `(completions-common-part      ((,class (:foreground ,keyword :weight bold))))
     `(cursor                       ((,class (:background ,cursor))))
     `(custom-button                ((,class (:foreground ,base :background ,bg2 :box (:line-width 2 :style released-button)))))
     `(default                      ((,class (:foreground ,base :background ,bg1))))
     `(default-italic               ((,class (:slant italic))))
     `(error                        ((,class (:foreground ,err))))
     `(eval-sexp-fu-flash           ((,class (:foreground ,bg1 :background ,suc))))
     `(eval-sexp-fu-flash-error     ((,class (:foreground ,bg1 :background ,err))))
     `(font-lock-builtin-face       ((,class (:foreground ,keyword))))
     `(font-lock-comment-face       ((,class (:foreground ,(if railgun-themes-comment-italic comment-light comment) :background ,(if railgun-themes-comment-bg comment-bg 'unspecified) :slant ,(if railgun-themes-comment-italic 'italic 'normal)))))
     `(font-lock-constant-face      ((,class (:foreground ,const))))
     `(font-lock-doc-face           ((,class (:foreground ,meta))))
     `(font-lock-function-name-face ((,class (:foreground ,func :inherit bold))))
     `(font-lock-keyword-face       ((,class (:foreground ,keyword :slant ,(if railgun-themes-keyword-italic 'italic 'normal) :inherit bold))))
     `(font-lock-negation-char-face ((,class (:foreground ,const))))
     `(font-lock-preprocessor-face  ((,class (:foreground ,func))))
     `(font-lock-reference-face     ((,class (:foreground ,const))))
     `(font-lock-string-face        ((,class (:foreground ,str))))
     `(font-lock-type-face          ((,class (:foreground ,type :inherit bold))))
     `(font-lock-variable-name-face ((,class (:foreground ,var))))
     `(font-lock-warning-face       ((,class (:foreground ,war :background ,bg1))))
     `(fringe                       ((,class (:foreground ,base :background ,bg1))))
     `(header-line                  ((,class (:background ,bg2))))
     `(help-key-binding             ((,class (:foreground ,blue :box (:color ,blue-bg-s :line-width 1)))))
     `(highlight                    ((,class (:foreground ,base :background ,highlight))))
     `(hl-line                      ((,class (:background ,bg2 :extend t))))
     `(isearch                      ((,class (:foreground ,bg1 :background ,mat))))
     `(lazy-highlight               ((,class (:background ,green-bg-s))))
     `(link                         ((,class (:foreground ,comment :underline t))))
     `(link-visited                 ((,class (:foreground ,comp :underline t))))
     `(match                        ((,class (:foreground ,mat :background ,highlight))))
     `(minibuffer-prompt            ((,class (:foreground ,keyword :inherit bold))))
     `(page-break-lines             ((,class (:foreground ,act2))))
     `(region                       ((,class (:background ,highlight :extend t))))
     `(secondary-selection          ((,class (:background ,bg3))))
     `(shadow                       ((,class (:foreground ,base-dim))))
     `(success                      ((,class (:foreground ,suc))))
     `(tooltip                      ((,class (:foreground ,base :background ,ttip-sl :underline nil))))
     `(vertical-border              ((,class (:foreground ,border))))
     `(warning                      ((,class (:foreground ,war))))
     `(widget-button-pressed        ((,class (:foreground ,green))))

     `(ansi-color-black   ((,class (:foreground ,bg4 :background ,bg4))))
     `(ansi-color-red     ((,class (:foreground ,red :background ,red))))
     `(ansi-color-green   ((,class (:foreground ,green :background ,green))))
     `(ansi-color-yellow  ((,class (:foreground ,yellow :background ,yellow))))
     `(ansi-color-blue    ((,class (:foreground ,blue :background ,blue))))
     `(ansi-color-magenta ((,class (:foreground ,magenta :background ,magenta))))
     `(ansi-color-cyan    ((,class (:foreground ,cyan :background ,cyan))))
     `(ansi-color-gray    ((,class (:foreground ,base :background ,base))))

     `(avy-lead-face   ((,class (:foreground ,green :background ,green-bg))))
     `(avy-lead-face-0 ((,class (:foreground ,yellow :background ,green-bg))))
     `(avy-lead-face-1 ((,class (:foreground ,magenta :background ,green-bg))))
     `(avy-lead-face-2 ((,class (:foreground ,blue :background ,green-bg))))

     `(diff-added             ((,class (:foreground ,green :background unspecified :extend t))))
     `(diff-changed           ((,class (:foreground ,blue :background unspecified))))
     `(diff-header            ((,class (:foreground ,func :background ,cblk-ln-bg :extend t))))
     `(diff-file-header       ((,class (:foreground ,cblk :background ,cblk-ln-bg :extend t))))
     `(diff-indicator-added   ((,class (:foreground ,green :background unspecified :extend t))))
     `(diff-indicator-changed ((,class (:foreground ,blue :background unspecified))))
     `(diff-indicator-removed ((,class (:foreground ,red :background unspecified))))
     `(diff-refine-added      ((,class (:foreground ,bg1 :background ,green))))
     `(diff-refine-changed    ((,class (:foreground ,bg1 :background ,blue))))
     `(diff-refine-removed    ((,class (:foreground ,bg1 :background ,red))))
     `(diff-removed           ((,class (:foreground ,red :background unspecified :extend t))))

     `(diff-hl-insert ((,class (:foreground ,green :background ,green))))
     `(diff-hl-delete ((,class (:foreground ,red :background ,red))))
     `(diff-hl-change ((,class (:foreground ,blue :background ,blue))))

     `(dired-directory  ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
     `(dired-flagged    ((,class (:foreground ,red))))
     `(dired-header     ((,class (:foreground ,comp :inherit bold))))
     `(dired-ignored    ((,class (:inherit shadow))))
     `(dired-mark       ((,class (:foreground ,comp :inherit bold))))
     `(dired-marked     ((,class (:foreground ,magenta :inherit bold))))
     `(dired-perm-write ((,class (:foreground ,base :underline t))))
     `(dired-symlink    ((,class (:foreground ,cyan :background ,bg1 :inherit bold))))
     `(dired-warning    ((,class (:foreground ,war))))

     `(ediff-current-diff-A        ((,class (:foreground ,red :background ,red-bg :extend t))))
     `(ediff-current-diff-Ancestor ((,class (:foreground ,aqua :background ,aqua-bg :extend t))))
     `(ediff-current-diff-B        ((,class (:foreground ,green :background ,green-bg :extend t))))
     `(ediff-current-diff-C        ((,class (:foreground ,blue :background ,blue-bg :extend t))))
     `(ediff-even-diff-A           ((,class (:background ,bg3 :extend t))))
     `(ediff-even-diff-Ancestor    ((,class (:background ,bg3 :extend t))))
     `(ediff-even-diff-B           ((,class (:background ,bg3 :extend t))))
     `(ediff-even-diff-C           ((,class (:background ,bg3 :extend t))))
     `(ediff-fine-diff-A           ((,class (:foreground ,bg1 :background ,red :extend t))))
     `(ediff-fine-diff-Ancestor    ((,class (:background unspecified :extend t :inherit bold))))
     `(ediff-fine-diff-B           ((,class (:foreground ,bg1 :background ,green))))
     `(ediff-fine-diff-C           ((,class (:foreground ,bg1 :background ,blue))))
     `(ediff-odd-diff-A            ((,class (:background ,bg4 :extend t))))
     `(ediff-odd-diff-Ancestor     ((,class (:background ,bg4 :extend t))))
     `(ediff-odd-diff-B            ((,class (:background ,bg4 :extend t))))
     `(ediff-odd-diff-C            ((,class (:background ,bg4 :extend t))))

     `(eldoc-highlight-function-argument ((,class (:foreground ,mat :inherit bold))))

     `(erc-input-face        ((,class (:foreground ,func))))
     `(erc-my-nick-face      ((,class (:foreground ,keyword))))
     `(erc-nick-default-face ((,class (:foreground ,keyword))))
     `(erc-nick-prefix-face  ((,class (:foreground ,yellow))))
     `(erc-notice-face       ((,class (:foreground ,str))))
     `(erc-prompt-face       ((,class (:foreground ,mat :inherit bold))))
     `(erc-timestamp-face    ((,class (:foreground ,keyword))))

     `(eshell-ls-archive    ((,class (:foreground ,red :inherit bold))))
     `(eshell-ls-backup     ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-clutter    ((,class (:inherit font-lock-comment-face))))
     `(eshell-ls-directory  ((,class (:foreground ,keyword :inherit bold))))
     `(eshell-ls-executable ((,class (:foreground ,suc :inherit bold))))
     `(eshell-ls-missing    ((,class (:inherit font-lock-warning-face))))
     `(eshell-ls-product    ((,class (:inherit font-lock-doc-face))))
     `(eshell-ls-special    ((,class (:foreground ,yellow :inherit bold))))
     `(eshell-ls-symlink    ((,class (:foreground ,cyan :inherit bold))))
     `(eshell-ls-unreadable ((,class (:foreground ,base))))
     `(eshell-prompt        ((,class (:foreground ,keyword :inherit bold))))

     `(flymake-error   ((,(append '((supports :underline (:style line))) class) (:underline (:style line :color ,err)))
                        (,class (:foreground ,base :background ,err :underline t :inherit bold))))
     `(flymake-note    ((,(append '((supports :underline (:style line))) class) (:underline (:style wave :color ,keyword)))
                        (,class (:foreground ,base :background ,keyword :underline t :inherit bold))))
     `(flymake-warning ((,(append '((supports :underline (:style line))) class) (:underline (:style line :color ,war)))
                        (,class (:foreground ,base :background ,war :underline t :inherit bold))))

     `(flyspell-incorrect ((,(append '((supports :underline (:style line))) class) (:underline (:style wave :color ,war)))
                           (,class (:foreground ,base :background ,war :underline t :inherit bold))))
     `(flyspell-duplicate ((,(append '((supports :underline (:style line))) class) (:underline (:style wave :color ,keyword)))
                           (,class (:foreground ,base :background ,keyword :underline t :inherit bold))))

     `(hi-green  ((,class (:foreground ,green :background ,green-bg))))
     `(hi-yellow ((,class (:foreground ,yellow :background ,yellow-bg))))

     `(ido-first-match         ((,class (:foreground ,comp :inherit bold))))
     `(ido-only-match          ((,class (:foreground ,mat :inherit bold))))
     `(ido-subdir              ((,class (:foreground ,keyword))))
     `(ido-vertical-match-face ((,class (:foreground ,comp :underline nil))))

     `(info-header-xref    ((,class (:foreground ,func :underline t))))
     `(info-menu           ((,class (:foreground ,suc))))
     `(info-node           ((,class (:foreground ,func :inherit bold))))
     `(info-quoted-name    ((,class (:foreground ,keyword))))
     `(info-reference-item ((,class (:background unspecified :underline t :inherit bold))))
     `(info-string         ((,class (:foreground ,str))))
     `(info-title-1        ((,class (:height 1.4 :inherit bold))))
     `(info-title-2        ((,class (:height 1.3 :inherit bold))))
     `(info-title-3        ((,class (:height 1.3))))
     `(info-title-4        ((,class (:height 1.2))))

     `(font-latex-bold-face                ((,class (:foreground ,comp))))
     `(font-latex-italic-face              ((,class (:foreground ,keyword :slant italic))))
     `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
     `(font-latex-match-variable-keywords  ((,class (:foreground ,var))))
     `(font-latex-sectioning-0-face        ((,class (:foreground ,head3 :background ,head3-bg :height 1.3 :inherit bold))))
     `(font-latex-sectioning-1-face        ((,class (:foreground ,head4 :background ,head4-bg :height 1.3 :inherit bold))))
     `(font-latex-sectioning-2-face        ((,class (:foreground ,head1 :background ,head1-bg :height 1.3 :inherit bold))))
     `(font-latex-sectioning-3-face        ((,class (:foreground ,head2 :background ,head2-bg :height 1.2 :inherit bold))))
     `(font-latex-sectioning-4-face        ((,class (:foreground ,head3 :background ,head3-bg :height 1.1 :weight normal))))
     `(font-latex-sectioning-5-face        ((,class (:foreground ,head4 :background ,head4-bg :weight normal))))
     `(font-latex-string-face              ((,class (:foreground ,str))))
     `(font-latex-warning-face             ((,class (:foreground ,war))))

     `(magit-blame-culprit               ((,class (:foreground ,yellow :background ,yellow-bg))))
     `(magit-blame-date                  ((,class (:foreground ,green :background ,yellow-bg))))
     `(magit-blame-hash                  ((,class (:foreground ,func :background ,yellow-bg))))
     `(magit-blame-header                ((,class (:foreground ,green :background ,yellow-bg))))
     `(magit-blame-heading               ((,class (:foreground ,green :background ,yellow-bg))))
     `(magit-blame-name                  ((,class (:foreground ,yellow :background ,yellow-bg))))
     `(magit-blame-sha1                  ((,class (:foreground ,func :background ,yellow-bg))))
     `(magit-blame-subject               ((,class (:foreground ,yellow :background ,yellow-bg))))
     `(magit-blame-summary               ((,class (:foreground ,yellow :background ,yellow-bg :extend t))))
     `(magit-blame-time                  ((,class (:foreground ,green :background ,yellow-bg))))
     `(magit-branch                      ((,class (:foreground ,const :inherit bold))))
     `(magit-branch-current              ((,class (:foreground ,blue :background ,blue-bg :box t :inherit bold))))
     `(magit-branch-local                ((,class (:foreground ,blue :background ,blue-bg :inherit bold))))
     `(magit-branch-remote               ((,class (:foreground ,aqua :background ,aqua-bg :inherit bold))))
     `(magit-diff-context-highlight      ((,class (:foreground ,base :background ,bg2 :extend t))))
     `(magit-diff-hunk-heading           ((,class (:foreground ,ttip :background ,ttip-bg :extend t))))
     `(magit-diff-hunk-heading-highlight ((,class (:foreground ,base :background ,ttip-sl :extend t))))
     `(magit-hash                        ((,class (:foreground ,var))))
     `(magit-hunk-heading                ((,class (:background ,bg3 :extend t))))
     `(magit-hunk-heading-highlight      ((,class (:background ,bg3 :extend t))))
     `(magit-item-highlight              ((,class (:background ,bg2 :extend t))))
     `(magit-log-author                  ((,class (:foreground ,func))))
     `(magit-log-head-label-head         ((,class (:foreground ,bg1 :background ,yellow :inherit bold))))
     `(magit-log-head-label-local        ((,class (:foreground ,bg1 :background ,keyword :inherit bold))))
     `(magit-log-head-label-remote       ((,class (:foreground ,bg1 :background ,suc :inherit bold))))
     `(magit-log-head-label-tags         ((,class (:foreground ,bg1 :background ,magenta :inherit bold))))
     `(magit-log-head-label-wip          ((,class (:foreground ,bg1 :background ,cyan :inherit bold))))
     `(magit-log-sha1                    ((,class (:foreground ,str))))
     `(magit-process-ng                  ((,class (:foreground ,war :inherit bold))))
     `(magit-process-ok                  ((,class (:foreground ,func :inherit bold))))
     `(magit-reflog-amend                ((,class (:foreground ,magenta))))
     `(magit-reflog-checkout             ((,class (:foreground ,blue))))
     `(magit-reflog-cherry-pick          ((,class (:foreground ,green))))
     `(magit-reflog-commit               ((,class (:foreground ,green))))
     `(magit-reflog-merge                ((,class (:foreground ,green))))
     `(magit-reflog-other                ((,class (:foreground ,cyan))))
     `(magit-reflog-rebase               ((,class (:foreground ,magenta))))
     `(magit-reflog-remote               ((,class (:foreground ,cyan))))
     `(magit-reflog-reset                ((,class (:foreground ,red))))
     `(magit-section-heading             ((,class (:foreground ,keyword :extend t :inherit bold))))
     `(magit-section-highlight           ((,class (:background ,bg2 :extend t))))
     `(magit-section-title               ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))

     `(Man-overstrike ((,class (:foreground ,head1 :inherit bold))))
     `(Man-reverse    ((,class (:foreground ,highlight))))
     `(Man-underline  ((,class (:foreground ,comp :underline t))))

     `(markdown-header-face-1 ((,class (:foreground ,head1 :background ,head1-bg :inherit bold))))
     `(markdown-header-face-2 ((,class (:foreground ,head2 :background ,head2-bg :inherit bold))))
     `(markdown-header-face-3 ((,class (:foreground ,head3 :background ,head3-bg :weight normal))))
     `(markdown-header-face-4 ((,class (:foreground ,head4 :background ,head4-bg :weight normal))))
     `(markdown-header-face-5 ((,class (:foreground ,head1 :weight normal))))
     `(markdown-header-face-6 ((,class (:foreground ,head2 :weight normal))))
     `(markdown-table-face    ((,class (:foreground ,base :background ,head1-bg))))

     `(mode-line           ((,class (:foreground ,base :background ,act1 :box (:color ,border :line-width 1)))))
     `(mode-line-buffer-id ((,class (:foreground ,func :inherit bold))))
     `(mode-line-inactive  ((,class (:foreground ,base :background ,bg1 :box (:color ,border :line-width 1)))))

     `(org-agenda-clocking           ((,class (:foreground ,comp :background ,highlight))))
     `(org-agenda-date               ((,class (:foreground ,var :height 1.1))))
     `(org-agenda-date-today         ((,class (:foreground ,keyword :height 1.3 :inherit bold))))
     `(org-agenda-date-weekend       ((,class (:foreground ,var :inherit bold))))
     `(org-agenda-done               ((,class (:foreground ,suc :height 1.2))))
     `(org-agenda-structure          ((,class (:foreground ,comp :inherit bold))))
     `(org-block                     ((,class (:foreground ,cblk :background ,cblk-bg :extend t))))
     `(org-block-begin-line          ((,class (:foreground ,cblk-ln :background ,cblk-ln-bg :extend t))))
     `(org-block-end-line            ((,class (:foreground ,cblk-ln :background ,cblk-ln-bg :extend t))))
     `(org-clock-overlay             ((,class (:foreground ,comp))))
     `(org-code                      ((,class (:foreground ,cyan))))
     `(org-column                    ((,class (:background ,highlight :inherit default))))
     `(org-column-title              ((,class (:background ,highlight))))
     `(org-date                      ((,class (:foreground ,var :underline t))))
     `(org-date-selected             ((,class (:foreground ,bg1 :background ,func))))
     `(org-document-info-keyword     ((,class (:foreground ,meta))))
     `(org-document-title            ((,class (:foreground ,func :underline t :height 1.4 :inherit bold))))
     `(org-done                      ((,class (:foreground ,suc :background ,green-bg :inherit bold))))
     `(org-ellipsis                  ((,class (:foreground ,keyword))))
     `(org-footnote                  ((,class (:foreground ,base :underline t))))
     `(org-headline-done             ((,class (:foreground ,aqua))))
     `(org-headline-todo             ((,class (:foreground ,meta))))
     `(org-hide                      ((,class (:foreground ,base))))
     `(org-kbd                       ((,class (:foreground ,base :box (:line-width 1 :style released-button) :inherit region))))
     `(org-level-1                   ((,class (:foreground ,head1 :background ,head1-bg :height 1.3 :inherit bold))))
     `(org-level-2                   ((,class (:foreground ,head2 :background ,head2-bg :height 1.2 :inherit bold))))
     `(org-level-3                   ((,class (:foreground ,head3 :background ,head3-bg :height 1.1 :weight normal))))
     `(org-level-4                   ((,class (:foreground ,head4 :background ,head4-bg :weight normal))))
     `(org-level-5                   ((,class (:foreground ,head1 :weight normal))))
     `(org-level-6                   ((,class (:foreground ,head2 :weight normal))))
     `(org-level-7                   ((,class (:foreground ,head3 :weight normal))))
     `(org-level-8                   ((,class (:foreground ,head4 :weight normal))))
     `(org-link                      ((,class (:foreground ,comment :underline t))))
     `(org-meta-line                 ((,class (:foreground ,meta))))
     `(org-mode-line-clock-overrun   ((,class (:foreground ,err))))
     `(org-priority                  ((,class (:foreground ,war :inherit bold))))
     `(org-quote                     ((,class (:slant italic :inherit org-block))))
     `(org-scheduled                 ((,class (:foreground ,comp))))
     `(org-scheduled-today           ((,class (:foreground ,func :height 1.2))))
     `(org-scheduled-previously      ((,class (:foreground ,base :slant italic))))
     `(org-sexp-date                 ((,class (:foreground ,base))))
     `(org-special-keyword           ((,class (:foreground ,func))))
     `(org-table                     ((,class (:foreground ,base :background ,head1-bg))))
     `(org-tag                       ((,class (:foreground ,meta))))
     `(org-time-grid                 ((,class (:foreground ,str))))
     `(org-todo                      ((,class (:foreground ,war :background ,yellow-bg :inherit bold))))
     `(org-upcoming-deadline         ((,class (:foreground ,war :inherit org-priority))))
     `(org-upcoming-distant-deadline ((,class (:foreground ,suc :inherit org-priority))))
     `(org-verbatim                  ((,class (:foreground ,keyword))))
     `(org-verse                     ((,class (:slant italic :inherit org-block))))
     `(org-warning                   ((,class (:foreground ,err :inherit org-priority))))

     `(outline-1 ((,class (:inherit org-level-1))))
     `(outline-2 ((,class (:inherit org-level-2))))
     `(outline-3 ((,class (:inherit org-level-3))))
     `(outline-4 ((,class (:inherit org-level-4))))
     `(outline-5 ((,class (:inherit org-level-5))))
     `(outline-6 ((,class (:inherit org-level-6))))
     `(outline-7 ((,class (:inherit org-level-7))))
     `(outline-8 ((,class (:inherit org-level-8))))

     `(sh-heredoc     ((,class :foreground ,str)))
     `(sh-quoted-exec ((,class :foreground ,func)))

     `(show-paren-match            ((,class (:foreground ,mat :underline ,railgun-themes-underline-parens :inherit bold))))
     `(show-paren-match-expression ((,class (:background ,green-bg-s))))
     `(show-paren-mismatch         ((,class (:foreground ,err :underline ,railgun-themes-underline-parens :inherit bold))))

     `(smerge-base            ((,class (:background ,yellow-bg :extend t))))
     `(smerge-markers         ((,class (:foreground ,ttip :background ,ttip-bg :extend t))))
     `(smerge-mine            ((,class (:background ,red-bg))))
     `(smerge-other           ((,class (:background ,green-bg))))
     `(smerge-refined-added   ((,class (:foreground ,green :background ,green-bg-s))))
     `(smerge-refined-changed ((,class (:foreground ,blue :background ,blue-bg-s))))
     `(smerge-refined-removed ((,class (:foreground ,red :background ,red-bg-s))))

     `(term               ((,class (:foreground ,base :background ,bg1))))
     `(term-color-black   ((,class (:foreground ,bg4 :background ,bg4))))
     `(term-color-blue    ((,class (:foreground ,keyword :background ,keyword))))
     `(term-color-cyan    ((,class (:foreground ,cyan :background ,cyan))))
     `(term-color-green   ((,class (:foreground ,green :background ,green))))
     `(term-color-magenta ((,class (:foreground ,magenta :background ,magenta))))
     `(term-color-red     ((,class (:foreground ,red :background ,red))))
     `(term-color-white   ((,class (:foreground ,base :background ,base))))
     `(term-color-yellow  ((,class (:foreground ,yellow :background ,yellow))))

     `(tab-bar              ((,class (:foreground ,base :background ,bg1))))
     `(tab-bar-tab          ((,class (:foreground ,base :background ,bg1 :weight bold))))
     `(tab-bar-tab-inactive ((,class (:foreground ,base-dim :background ,bg2 :weight light))))

     `(tab-line              ((,class (:foreground ,base :background ,bg1))))
     `(tab-line-tab-current  ((,class (:foreground ,base :background ,bg1 :weight bold))))
     `(tab-line-tab-inactive ((,class (:foreground ,base-dim :background ,bg2 :weight light))))

     `(which-key-command-description-face ((,class (:foreground ,base))))
     `(which-key-group-description-face   ((,class (:foreground ,keyword))))
     `(which-key-key-face                 ((,class (:foreground ,func :inherit bold))))
     `(which-key-separator-face           ((,class (:foreground ,str :background unspecified))))
     `(which-key-special-key-face         ((,class (:foreground ,bg1 :background ,func))))

     `(which-func ((,class (:foreground ,func))))

     `(whitespace-empty            ((,class (:background unspecified :foreground ,yellow))))
     `(whitespace-indentation      ((,class (:background unspecified :foreground ,war))))
     `(whitespace-line             ((,class (:background unspecified :foreground ,comp))))
     `(whitespace-newline          ((,class (:background unspecified :foreground ,comp))))
     `(whitespace-space            ((,class (:background unspecified :foreground ,act2))))
     `(whitespace-space-after-tab  ((,class (:background unspecified :foreground ,yellow))))
     `(whitespace-space-before-tab ((,class (:background unspecified :foreground ,yellow))))
     `(whitespace-tab              ((,class (:background unspecified :foreground ,act2))))
     `(whitespace-trailing         ((,class (:background ,err :foreground ,war))))

     `(window-tool-bar-button          ((,class (:foreground ,base :background ,bg1 :weight bold :box (:line-width -1 :style released-button)))))
     `(window-tool-bar-button-hover    ((,class (:inverse-video t :inherit window-tool-bar-button))))
     `(window-tool-bar-button-disabled ((,class (:foreground ,base-dim :background ,bg2 :inherit window-tool-bar-button))))

     `(slime-repl-inputed-output-face ((,class (:foreground ,comp)))))

    (custom-theme-set-variables
     theme-name

     `(org-fontify-done-headline nil)
     `(org-fontify-todo-headline nil))

    ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'railgun-themes)

;;; railgun-themes.el ends here
