
all: test.pdf
	Rscript -e "library(knitr);knit(\"test.Rnw\")"
	pdflatex test

clean:
	rm -rf *.tex *.aux *.pdf *.log figure
test.pdf: test.Rnw
