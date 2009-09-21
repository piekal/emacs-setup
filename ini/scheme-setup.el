;;; ==================================================================
;;; Author:  Jim Weirich
;;; File:    scheme.el
;;; Purpose: Setups for working in scheme
;;; ==================================================================

(require 'xscheme)

(defun jw-scheme-load-and-go ()
  (interactive)
  (xscheme-send-buffer)
  (pop-to-buffer "*scheme*") )

(add-hook 'scheme-mode-hook
          '(lambda ()
             (define-key scheme-mode-map "\C-c\C-p" 'scheme-trace-procedure)
             (define-key scheme-mode-map "\C-c\C-t" 'jw-toggle-buffer)
             (define-key scheme-mode-map "\C-c\C-g" 'jw-scheme-load-and-go)))

(defun jw-scheme-send-expression ()
  (interactive)
  (move-end-of-line 1)
  (advertised-xscheme-send-previous-expression))

(add-hook 'scheme-interaction-mode-hook
          '(lambda ()
            (define-key scheme-interaction-mode-map [S-return]
               'jw-scheme-send-expression)))
