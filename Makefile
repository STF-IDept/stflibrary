# Variable declarations
DOCBOOKXSL=./xsl/docbook
STYLESHEET_XHTML=$(DOCBOOKXSL)/xhtml/chunkfast.xsl
SOURCE=./src
BUILD=./procbuild

RESOLVED=resolved.xml
STYLESHEET=/usr/share/xml/docbook/stylesheet/docbook-xsl/xhtml/chunkfast.xsl

all: main

main:
	mkdir -p $(BUILD)
	xsltproc \
	--xinclude \
	--timing \
	--stringparam base.dir $(BUILD)/ \
	--stringparam chunk.section.depth 0 \
	--stringparam chunker.output.indent yes \
	--stringparam use.id.as.filename 1 \
	$(STYLESHEET_XHTML) \
	$(SOURCE)/set.xml

clean:
	@echo "Deleting output files"
	@find ./$(BUILD) -name '*.html' -exec rm {} \;
	@echo "Deleting redundant backup saves"
	@find . -name '*~' -exec rm {} \;

valid:
	@echo "Validating Handbook"
	@xmllint \
	--noout \
	--xinclude \
	--postvalid \
	--noent \
	--dtdvalid $(DBDTD) \
	$(SOURCE)/set.xml
