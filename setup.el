;;; ~/org/workbench/setup.el -*- lexical-binding: t; -*-

(require 'org)
(require 'ob)
(require 'ob-tangle)

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (shell . t)))

(setq org-confirm-babel-evaluate nil)
