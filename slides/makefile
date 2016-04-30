
targets := $(wildcard tex/* img/*)

slides.pdf: $(targets)
	export TEXINPUTS=.:./tex:./mtheme/source/: && pdflatex tex/slides.tex