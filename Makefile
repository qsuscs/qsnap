all: qsnap.8.html qsnap.8

%.8: qsnap.8.asciidoc
	a2x -f manpage $<

%.html: qsnap.8.asciidoc
	asciidoc $<
