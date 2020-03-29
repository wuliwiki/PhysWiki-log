PhysWiki:
	latexmk -xelatex main.tex
	#xelatex main.tex

debug:
	latexmk -xelatex Debug.tex
	#xelatex Debug.tex

clean:
	rm -f *.toc *.aux *.log *.gz *.out contents/*.log *.dvi *.fdb_latexmk *.fls main.pdf Debug.pdf
