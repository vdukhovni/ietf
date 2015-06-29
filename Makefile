SMTP_VERSION = 19
OPS_VERSION = 13

OPS	= draft-ietf-dane-ops
SMTP	= draft-ietf-dane-smtp-with-dane

SMTP_XML	= ${SMTP:%=%-${SMTP_VERSION}.xml}
SMTP_HTML	= ${SMTP:%=%-${SMTP_VERSION}.html}
SMTP_TXT	= ${SMTP:%=%-${SMTP_VERSION}.txt}
OPS_XML		= ${OPS:%=%-${OPS_VERSION}.xml}
OPS_HTML	= ${OPS:%=%-${OPS_VERSION}.html}
OPS_TXT		= ${OPS:%=%-${OPS_VERSION}.txt}

HTML	= ${SMTP_HTML} ${OPS_HTML}
TXT	= ${SMTP_TXT} ${OPS_TXT}

all: ${TXT} ${HTML}

clean:
	$(RM) *.html *.txt *.xml

${SMTP_XML}: ${SMTP}
	sed -e 's/@@VERSION@@/${SMTP_VERSION}/g' $< > $@
${OPS_XML}: ${OPS}
	sed -e 's/@@VERSION@@/${OPS_VERSION}/g' $< > $@

%.txt: %.xml
	xml2rfc --text -o $@ $<

%.html: %.xml
	xml2rfc --html -o $@ $<

idnits: $(TXT)
	for i in $(TXT) ; do  \
		idnits $$i ; \
	done
