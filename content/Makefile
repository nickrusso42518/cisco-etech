# @! grep line lint.log

.DEFAULT_GOAL := all

.PHONY: all
all: clean lint pdf

.PHONY: lint
lint:
	@date > lint.log
	@lacheck main.tex | tee -a lint.log
	@chktex main.tex | tee -a lint.log

.PHONY: pdf
pdf:
	@pdflatex -jobname etech --interaction=batchmode --halt-on-error main.tex
	@pdflatex -jobname etech --interaction=batchmode --halt-on-error main.tex
	@open etech.pdf

.PHONY: clean
clean:
	@rm -f lint.log etech.*
