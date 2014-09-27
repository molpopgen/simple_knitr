

all: test.pdf
	Rscript -e "library(knitr);knit(\"test.Rnw\")"
	pdflatex test
#Uncomment out if needing a biblio...
#	bibtex test
	latex_count=5 ;\
	while egrep -s 'Rerun (LaTeX|to get cross-references right)' test.log && [ $$latex_count -gt 0 ] ;\
	    do \
	      echo "Rerunning latex...." ;\
	      pdflatex test ;\
	      latex_count=`expr $$latex_count - 1` ;\
	    done

clean:
	rm -rf *.tex *.aux *.pdf *.log figure
test.pdf: test.Rnw
