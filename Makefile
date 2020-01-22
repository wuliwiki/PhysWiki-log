compiler = xelatex

PhysWiki:
	xelatex main.tex

debug:
	xelatex Debug.tex

clean:
	rm -f *.toc *.aux *.log *.gz *.out

