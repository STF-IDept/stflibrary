# Variable declarations
DOCBOOKXSL=./xsl/docbook
DOCBOOKXSL_CUSTOMIZED=./xsl

STYLESHEET_XHTML=$(DOCBOOKXSL_CUSTOMIZED)/xhtml.xsl
STYLESHEET_EPUB=$(DOCBOOKXSL)/epub/docbook.xsl
STYLESHEET_FO=$(DOCBOOKXSL)/fo/docbook.xsl

SOURCE=./src
BUILD_HTML=./build
BUILD_FO=./procbuild_fo
BUILD_EPUB=./build_epub

UPLOAD_SERVER=www.star-fleet.com
UPLOAD_USER=stfleet
UPLOAD_PATH=/usr/home/stfleet/public_html/library/newbookshelf/

FO_OUTPUT=stflibrary.fo
EPUB_FILE_NAME=stflibrary.epub

all: html

html:
	mkdir -p $(BUILD_HTML)
	xsltproc \
	--xinclude \
	--timing \
	--stringparam base.dir $(BUILD_HTML)/ \
	$(STYLESHEET_XHTML) \
	$(SOURCE)/set.xml

# This is not yet complete.  The customization layer needs to be written,
# and we need to get images linked up properly.
# Also for some reason the zip command is very unstable and doesn't work in
# a make file.  I haven't figured out why yet.
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
	cd $(BUILD_EPUB)
	zip -r $(EPUB_FILE_NAME) META-INF/ OEBPS/
	mv $(EPUB_FILE_NAME) ../$(BUILD_HTML)/$(EPUB_FILE_NAME)

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
	@echo "Deleting HTML files"
	@find ./$(BUILD_HTML) -name '*.html' -exec rm {} \;
	@rm $(BUILD_HTML)/$(EPUB_FILE_NAME)
	@echo "Deleting intermediary Epub files"
	@rm -rf $(BUILD_EPUB)
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

upload:
	@echo "Uploading files to production"
	@scp -r $(BUILD_HTML)/* $(UPLOAD_USER)@$(UPLOAD_SERVER):$(UPLOAD_PATH)
