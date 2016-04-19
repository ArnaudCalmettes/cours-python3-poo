CC = pandoc
FLAGS = --toc --chapters -N
HTMLFLAGS = -s -t html5 -c default.css -N
DOCNAME = cours-python3-poo
SRCDIR = src
SRCFILES = $(sort $(SRCDIR)/*.md)

.PHONY: clean all

all: pdf html epub

pdf:
	$(info $(DOCNAME).pdf)
	@$(CC) -o $(DOCNAME).pdf $(SRCFILES) $(FLAGS)

html:
	$(info $(DOCNAME).html)
	@$(CC) -o $(DOCNAME).html $(SRCFILES) $(FLAGS) $(HTMLFLAGS)

epub:
	$(info $(DOCNAME).epub)
	@$(CC) -o $(DOCNAME).epub $(SRCFILES) $(FLAGS)

clean:
	@rm -f *.html *.pdf *.epub
