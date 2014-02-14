XML	= \
	draft-ietf-dane-ops-03.xml \
	draft-ietf-dane-smtp-with-dane-08.xml
TXT	= ${XML:%.xml=%.txt}
HTML	= ${XML:%.xml=%.html}

all: ${TXT} ${HTML}

clean:
	$(RM) *.html *.txt

%.txt: %.xml
	xml2rfc $<

%.html: %.xml
	xml2rfc $< --html

idnits: $(TXT)
	for i in $(TXT) ; do  \
		idnits $$i ; \
	done
