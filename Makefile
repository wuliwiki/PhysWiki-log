compiler = xelatex

PhysWiki:
	xelatex PhysWiki.tex

debug:
	xelatex Debug.tex

clean:
	rm -f *.toc *.aux *.log *.gz *.out

