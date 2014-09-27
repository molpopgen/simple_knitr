
all: test.pdf
	Rscript -e "library(knitr);knit(\"test.tex\")"
	pdflatex test

test.pdf: test.Rnw
