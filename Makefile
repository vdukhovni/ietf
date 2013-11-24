XML	= \
	draft-ietf-dane-ops-01.xml \
	draft-ietf-dane-smtp-with-dane-04.xml
TXT	= ${XML:%.xml=%.txt}
HTML	= ${XML:%.xml=%.html}

all: ${TXT} ${HTML}

clean:
	$(RM) *.html *.txt

%.txt: %.xml
	xml2rfc $<

%.html: %.xml
	xml2rfc $< --html
