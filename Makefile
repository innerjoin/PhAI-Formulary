OUTPUTDIR=_build

LATEX=pdflatex
LATEXOPT=-interaction=nonstopmode -halt-on-error -output-directory $(OUTPUTDIR)

LATEXMK=latexmk
LATEXMKOPT=-pdf -jobname=$(OUTPUTDIR)/Formelsammlung
CONTINUOUS=

MAIN=Formelsammlung

all:    $(MAIN).pdf 

.refresh:
		touch $(OUTPUTDIR)/.refresh

$(MAIN).pdf: $(MAIN).tex .refresh | $(OUTPUTDIR)
		$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) $(MAIN)

force:
		touch $(OUTPUTDIR)/.refresh
		rm $(OUTPUTDIR)/$(MAIN).pdf
		$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) $(MAIN)

clean:
		$(LATEXMK) $(LATEXMKOPT) -C $(MAIN)

once:
		$(LATEXMK) $(LATEXMKOPT) $(MAIN)

debug:
		$(LATEX) $(LATEXOPT) $(MAIN)

$(OUTPUTDIR):
		mkdir $(OUTPUTDIR)

.PHONY: clean force once all
