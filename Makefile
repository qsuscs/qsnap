docs = qsnap.8.html qsnap.8 README.html

doc: $(docs)

%.8: %.8.asciidoc
	a2x -f manpage $<

%.html: %.asciidoc
	asciidoc $<

clean:
	-rm -rf $(docs)

.PHONY: clean
