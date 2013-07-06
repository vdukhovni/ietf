XML	= \
	draft-dukhovni-dane-ops-01.xml \
	draft-dukhovni-smtp-opportunistic-tls-01.xml
TXT	= ${XML:%.xml=%.txt}
HTML	= ${XML:%.xml=%.html}

all: ${TXT} ${HTML}

%.txt: %.xml
	xml2rfc $<

%.html: %.xml
	xml2rfc $< --html
