
DRAFTS=draft-dukhovni-dane-ops-00.txt draft-dukhovni-smtp-opportunistic-tls-00.txt

all: $(DRAFTS)

%.txt: %.xml
	xml2rfc $<
