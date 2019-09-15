compiler = xelatex

PhysWiki:
	xelatex PhysWiki.tex

debug:
	xelatex Debut.tex

clean:
	rm -f *.toc *.aux *.log *.gz *.out

