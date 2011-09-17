# Variable declarations
DOCBOOKXSL=./xsl/docbook
STYLESHEET_XHTML=$(DOCBOOKXSL)/xhtml/chunkfast.xsl
STYLESHEET_EPUB=$(DOCBOOKXSL)/epub/docbook.xsl
STYLESHEET_FO=$(DOCBOOKXSL)/fo/docbook.xsl
SOURCE=./src
BUILD=./procbuild
BUILD_FO=./procbuild_fo
BUILD_EPUB=./procbuild_epub

DOCBOOKXSL_CUSTOMIZED=./xsl/xsltproc
STYLESHEET_XHTML=$(DOCBOOKXSL_CUSTOMIZED)/html-set.xsl

FO_OUTPUT=stflibrary.fo
EPUB_OUTPUT=stflibrary.epub

all: html pdf

html:
	mkdir -p $(BUILD)
	xsltproc \
	--xinclude \
	--timing \
	--stringparam base.dir $(BUILD)/ \
	$(STYLESHEET_XHTML) \
	$(SOURCE)/set.xml

epub:
	mkdir -p $(BUILD_EPUB)
	xsltproc \
	--xinclude \
	--timing \
	--stringparam chunk.section.depth 0 \
	--stringparam chunker.output.indent yes \
	--stringparam use.id.as.filename 1 \
	--output $(BUILD_EPUB)/$(EPUB_OUTPUT) \
	$(STYLESHEET_EPUB) \
	$(SOURCE)/set.xml
	# Need to add an epub packager here, I think.

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
