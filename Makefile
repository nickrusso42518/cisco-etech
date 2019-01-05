# File:    Makefile
# Version: GNU Make 3.81
# Author:  Nicholas Russo (njrusmc@gmail.com)
# Purpose: Phony targets used for linting TeX and typesetting a PDF
#          for some quick testing.
.DEFAULT_GOAL := all

.PHONY: all
all: lint pdf

.PHONY: lint
lint:
	@date > lint.log
	@chktex main.tex | tee -a lint.log

.PHONY: draft
draft:
	@pdflatex -shell-escape -jobname etech --interaction=nonstopmode --halt-on-error -draftmode main.tex

.PHONY: pdf
pdf:
	@pdflatex -shell-escape -jobname etech --interaction=batchmode --halt-on-error main.tex
	@pdflatex -shell-escape -jobname etech --interaction=batchmode --halt-on-error main.tex
	@open etech.pdf

.PHONY: clean
clean:
	@rm -f lint.log etech.*
	@rm -rf _minted-etech/
