ZSHRC:="\"zshrc.org\""
SETUP:="\"setup.org\""
EMACS:="/Applications/Emacs.app/Contents/MacOS/Emacs"
DIR:=$(shell pwd)

zshrc:
	@$(EMACS) -Q --batch -l setup.el \
		--eval "(progn \
			 (mapc (lambda (file) (find-file (expand-file-name file \"$(DIR)\")) (org-babel-tangle) (kill-buffer)) '($(ZSHRC))))"

fonts:
	@$(EMACS) -Q --batch -l setup.el \
		--eval "(progn \
			 (mapc (lambda (file) (find-file (expand-file-name file \"$(DIR)\")) (org-babel-tangle) (kill-buffer)) '($(SETUP))))"
	cd output
	chmod +x fonts.sh
	./fonts.sh

zsh:
	@$(EMACS) -Q --batch -l setup.el \
		--eval "(progn \
			 (mapc (lambda (file) (find-file (expand-file-name file \"$(DIR)\")) (org-babel-tangle) (kill-buffer)) '($(SETUP))))"
	cd output
	chmod +x zsh.sh
	./zsh.sh

.PHONY: zshrc fonts zsh
