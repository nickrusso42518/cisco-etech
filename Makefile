# File:    Makefile
# Version: GNU Make 3.81
# Author:  Nicholas Russo (njrusmc@gmail.com)
# Purpose: Phony targets used for linting TeX and typesetting a PDF
#          for some quick testing.

# When "make" is run by itself, run the linter and build a PDF for local review
.DEFAULT_GOAL := all
.PHONY: all
all: lint pdf

# Add the date/time to the top of the log, then run the linter and
# write to stdout and to the log file
.PHONY: lint
lint:
	@date > lint.log
	@chktex main.tex | tee -a lint.log

# Generate a detailed compilation report while not importing images (runs fast)
.PHONY: draft
draft:
	@pdflatex -shell-escape -jobname etech --interaction=nonstopmode --halt-on-error -draftmode main.tex

# Run two passes of the pdflatex compiler with minimal output
.PHONY: pass2
pass2:
	@pdflatex -shell-escape -jobname etech --interaction=batchmode --halt-on-error main.tex
	@pdflatex -shell-escape -jobname etech --interaction=batchmode --halt-on-error main.tex

# After running the pass2 target, use the Mac-specific "open" command to
# view the PDF in whatever application is set as the default. Never use
# this target in a CI pipeline or the error "Couldn't get a file descriptor
# referring to the console" will get raised.
.PHONY: pdf
pdf: pass2
	@open etech.pdf

# Remove all temporary files. Not that removing the minted directory will
# significantly slow down compilation, so use sparingly
.PHONY: clean
clean:
	@rm -f lint.log etech.*
	@rm -rf _minted-etech/
