TEXC = pdflatex
BIBC = bibtex

FILE = main

FINAL = julio

all: $(FILE).pdf view

final: $(FILE).pdf
	cp $(FILE).pdf $(FINAL).pdf

viewFinal: $(FINAL).pdf
	evince $(FINAL).pdf

view: $(FILE).pdf
	evince $(FILE).pdf

$(FILE).pdf: $(FILE).bbl
	$(TEXC) $(FILE).tex
	$(TEXC) $(FILE).tex

$(FILE).bbl : $(FILE).aux $(FILE).bib
	$(BIBC) $(FILE).aux

$(FILE).aux: $(FILE).tex
	$(TEXC) $(FILE).tex

clean:
	rm -f $(FILE).pdf
	rm -f $(FILE).aux
	rm -f $(FILE).bbl
	rm -f $(FILE).blg
	rm -f $(FILE).dvi
	rm -f $(FILE).log

cleanFinal:
	rm -f $(FINAL).pdf
