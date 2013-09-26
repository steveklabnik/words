TITLE=my-awesome-title-with-no-spaces

all: site $(TITLE).epub $(TITLE).pdf $(TITLE).mobi

CONTENT=$(wildcard content/*.md)

BOOK_CONTENT=content/title.txt \
             $(CHAPTERS)

ALL_FILES=$(CHAPTERS) \
          content/metadata.xml \
          content/title.txt \
          cover.png

EPUB_OPTS= --toc \
           -S -s \
           --epub-cover-image=cover.png \
           --epub-metadata=content/metadata.xml

HTML_OPTS= -S -s \
           --include-before-body=content/header.html \
           --include-after-body=content/footer.html

CLEAN_FILES=$(patsubst %.md,%.html,$(wildcard content/*.md)) \
						*.epub \
						*.pdf \
						*.mobi \
						content/single-page.html


$(TITLE).epub: $(ALL_FILES)
	pandoc $(EPUB_OPTS) -o $@ $(BOOK_CONTENT)

$(TITLE).pdf: $(ALL_FILES)
	pandoc $(EPUB_OPTS) -o $@ $(BOOK_CONTENT)

$(TITLE).mobi: $(TITLE).epub
	kindlegen $(TITLE).epub

content/single-page.html: $(CONTENT)
	pandoc -o $@ $(HTML_OPTS) $(CONTENT)

content/%.html : content/%.md
	pandoc -o $@ $(HTML_OPTS) $<

site: $(patsubst %.md,%.html,$(wildcard content/*.md)) content/single-page.html

ship: all
	s3deploy

.PHONY: clean check

clean:
	rm -f $(CLEAN_FILES)

check:
	./check
