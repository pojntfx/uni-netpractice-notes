# Public variables
DESTDIR ?=
OUTPUT_DIR ?= out

# Private variables
obj = $(shell ls docs/*.md | sed -r 's@docs/(.*).md@\1@g')
all: build

# Build
build: build/archive
$(addprefix build/,$(obj)):
	$(MAKE) build-pdf/$(subst build/,,$@) build-pdf-slides/$(subst build/,,$@) build-html/$(subst build/,,$@) build-html-slides/$(subst build/,,$@) build-epub/$(subst build/,,$@) build-odt/$(subst build/,,$@) build-md/$(subst build/,,$@) 

# Build PDF
$(addprefix build-pdf/,$(obj)): build/qr
	mkdir -p out
	pandoc --template eisvogel --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs -M titlepage=true -M toc=true -M toc-own-page=true -M linkcolor="{HTML}{006666}" -o "$(OUTPUT_DIR)/$(subst build-pdf/,,$@).pdf" "docs/$(subst build-pdf/,,$@).md"
	
# Build PDF slides
$(addprefix build-pdf-slides/,$(obj)): build/qr
	mkdir -p out
	pandoc --to beamer --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs --slide-level=3 --variable theme=metropolis -o "$(OUTPUT_DIR)/$(subst build-pdf-slides/,,$@).slides.pdf" "docs/$(subst build-pdf-slides/,,$@).md"

# Build HTML
$(addprefix build-html/,$(obj)): build/qr
	mkdir -p out
	pandoc --to html5 --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs --toc --katex --self-contained -o "$(OUTPUT_DIR)/$(subst build-html/,,$@).html" "docs/$(subst build-html/,,$@).md"

# Build HTML slides
$(addprefix build-html-slides/,$(obj)): build/qr
	mkdir -p out
	pandoc --to slidy --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs --toc --katex --self-contained -o "$(OUTPUT_DIR)/$(subst build-html-slides/,,$@).slides.html" "docs/$(subst build-html-slides/,,$@).md"

# Build EPUB
$(addprefix build-epub/,$(obj)): build/qr
	mkdir -p out
	pandoc --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs -M titlepage=true -M toc=true -M toc-own-page=true -M linkcolor="{HTML}{006666}" -o "$(OUTPUT_DIR)/$(subst build-epub/,,$@).epub" "docs/$(subst build-epub/,,$@).md"

# Build ODT
$(addprefix build-odt/,$(obj)): build/qr
	mkdir -p out
	pandoc --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs -M titlepage=true -M toc=true -M toc-own-page=true -M linkcolor="{HTML}{006666}" -o "$(OUTPUT_DIR)/$(subst build-odt/,,$@).odt" "docs/$(subst build-odt/,,$@).md"

# Build Markdown
$(addprefix build-md/,$(obj)): build/qr
	mkdir -p out
	cp "docs/$(subst build-md/,,$@).md" "$(OUTPUT_DIR)/$(subst build-md/,,$@).md"

# Build QR code
build/qr:
	mkdir -p docs/static
	qr "https://$$(git remote get-url origin | sed -r 's|^.*@(.*):|\1/|g' | sed 's@.*://@@g' | sed 's/.git$$//g')" | tee docs/static/qr.png>/dev/null

# Build tree
build/tree: $(addprefix build/,$(obj))
	mkdir -p out
	tree -T "$$(git remote get-url origin | sed -r 's|^.*@(.*):|\1/|g' | sed 's@.*://@@g' | sed 's/.git$$//g')" -H '.' -I 'index.html|release.zip' -o out/index.html out

# Build archive
build/archive: build/tree
	mkdir -p out
	zip -j -x 'release.zip' -FSr out/release.zip out/*

# Open PDF
$(addprefix open-pdf/,$(obj)):
	xdg-open "$(OUTPUT_DIR)/$(subst open-pdf/,,$@).pdf"

# Open PDF slides
$(addprefix open-pdf-slides/,$(obj)):
	xdg-open "$(OUTPUT_DIR)/$(subst open-pdf-slides/,,$@).slides.pdf"

# Open HTML
$(addprefix open-html/,$(obj)):
	xdg-open "$(OUTPUT_DIR)/$(subst open-html/,,$@).html"

# Open HTML slides
$(addprefix open-html-slides/,$(obj)):
	xdg-open "$(OUTPUT_DIR)/$(subst open-html-slides/,,$@).slides.html"

# Clean
clean:
	rm -rf "$(OUTPUT_DIR)" docs/static/qr.png

# Dependencies
depend:
	pip install pillow qrcode
	curl -L -o /tmp/Eisvogel.zip 'https://github.com/Wandmalfarbe/pandoc-latex-template/releases/latest/download/Eisvogel.zip'
	mkdir -p "$${HOME}/.local/share/pandoc/templates"
	unzip -p /tmp/Eisvogel.zip eisvogel.latex | tee "$${HOME}/.local/share/pandoc/templates/eisvogel.latex">/dev/null
