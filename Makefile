XML	= \
	draft-ietf-dane-ops-00.xml \
	draft-dukhovni-smtp-opportunistic-tls-01.xml
TXT	= ${XML:%.xml=%.txt}
HTML	= ${XML:%.xml=%.html}

all: ${TXT} ${HTML}

clean:
	$(RM) *.html *.txt

%.txt: %.xml
	xml2rfc $<

%.html: %.xml
	xml2rfc $< --html
