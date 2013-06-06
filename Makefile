
DRAFTS=draft-dukhovni-dane-ops-01.txt draft-dukhovni-smtp-opportunistic-tls-01.txt

all: $(DRAFTS)

%.txt: %.xml
	xml2rfc $<
