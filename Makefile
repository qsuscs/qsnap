docs = qsnap.8.html qsnap.8 README.html
prefix ?= /usr/local
DESTDIR ?=

all: doc qsnap@.service

doc: $(docs)

%.8: %.8.asciidoc
	a2x -f manpage $<

%.html: %.asciidoc
	asciidoc $<

qsnap@.service: qsnap@.service.in
	awk '{ gsub(/@PREFIX@/, "$(prefix)") }; 1' $< > $@

install: all
	install -D -m 755 qsnap "$(DESTDIR)/$(prefix)/bin/qsnap"
	install -D -m 644 qsnap@.timer "$(DESTDIR)/$(prefix)/lib/systemd/system/qsnap@.timer"
	install -D -m 644 qsnap@.service "$(DESTDIR)/$(prefix)/lib/systemd/system/qsnap@.service"
	install -D -m 644 qsnap.conf "$(DESTDIR)/etc/qsnap.conf"
	install -D -m 644 LICENSE "$(DESTDIR)/$(prefix)/share/doc/qsnap/LICENSE"
	install -D -m 644 README.asciidoc "$(DESTDIR)/$(prefix)/share/doc/qsnap/README.asciidoc"
	install -D -m 644 README.html "$(DESTDIR)/$(prefix)/share/doc/qsnap/README.html"
	install -D -m 644 qsnap.8.html "$(DESTDIR)/$(prefix)/share/doc/qsnap/qsnap.8.html"
	install -D -m 644 qsnap.8 "$(DESTDIR)/$(prefix)/share/man/man8/qsnap.8"

clean:
	-rm -rf $(docs) qsnap@.service

uninstall:
	rm "$(DESTDIR)/$(prefix)/bin/qsnap"
	rm "$(DESTDIR)/$(prefix)/lib/systemd/system/qsnap@.timer"
	rm "$(DESTDIR)/$(prefix)/lib/systemd/system/qsnap@.service"
	rm "$(DESTDIR)/etc/qsnap.conf"
	rm "$(DESTDIR)/$(prefix)/share/doc/qsnap/LICENSE"
	rm "$(DESTDIR)/$(prefix)/share/doc/qsnap/README.asciidoc"
	rm "$(DESTDIR)/$(prefix)/share/doc/qsnap/README.html"
	rm "$(DESTDIR)/$(prefix)/share/doc/qsnap/qsnap.8.html"
	rm "$(DESTDIR)/$(prefix)/share/man/man8/qsnap.8"

.PHONY: clean install
