doc: qsnap.8.html qsnap.8 README.html

%.8: %.8.asciidoc
	a2x -f manpage $<

%.html: %.asciidoc
	asciidoc $<
