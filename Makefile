XML	= \
	draft-ietf-dane-ops-02.xml \
	draft-ietf-dane-smtp-with-dane-05.xml
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
	idnits $<
