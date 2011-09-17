# Variable declarations
DOCBOOKXSL=./xsl/docbook
STYLESHEET_XHTML=$(DOCBOOKXSL)/xhtml/chunkfast.xsl
STYLESHEET_FO=$(DOCBOOKXSL)/fo/docbook.xsl
SOURCE=./src
BUILD=./procbuild
BUILD_FO=./procbuild_fo

FO_OUTPUT=stflibrary.fo

all: html pdf

html:
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

pdf:
	# We may be able to merge these into a single fop command when the build
	# errors are resolved.
	mkdir -p $(BUILD_FO)
	xsltproc \
	--xinclude \
	--timing \
	--stringparam fop1.extensions 1 \
	--output $(FO_OUTPUT) \
	$(STYLESHEET_FO) \
	$(SOURCE)/set.xml
	fop -fo $(FO_OUTPUT) -pdf library.pdf


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
