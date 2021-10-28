# Public variables
OUTPUT_DIR ?= out

# Private variables
obj = $(shell ls docs/*.md | sed -r 's@docs/(.*).md@\1@g')
all: build

# Build
build: build/archive
$(addprefix build/,$(obj)):
	$(MAKE) build-pdf/$(subst build/,,$@) build-pdf-slides/$(subst build/,,$@) build-html/$(subst build/,,$@) build-html-slides/$(subst build/,,$@) build-epub/$(subst build/,,$@) build-odt/$(subst build/,,$@) build-plaintext/$(subst build/,,$@)

# Build PDF
$(addprefix build-pdf/,$(obj)): build/qr
	mkdir -p "$(OUTPUT_DIR)"
	pandoc --template eisvogel --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs -M titlepage=true -M toc=true -M toc-own-page=true -M linkcolor="{HTML}{006666}" -o "$(OUTPUT_DIR)/$(subst build-pdf/,,$@).pdf" "docs/$(subst build-pdf/,,$@).md"
	
# Build PDF slides
$(addprefix build-pdf-slides/,$(obj)): build/qr
	mkdir -p "$(OUTPUT_DIR)"
	pandoc --to beamer --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs --slide-level=3 --variable theme=metropolis -o "$(OUTPUT_DIR)/$(subst build-pdf-slides/,,$@).slides.pdf" "docs/$(subst build-pdf-slides/,,$@).md"

# Build HTML
$(addprefix build-html/,$(obj)): build/qr
	mkdir -p "$(OUTPUT_DIR)"
	pandoc --shift-heading-level-by=-1 --to markdown --standalone "docs/$(subst build-html/,,$@).md" | pandoc --to html5 --listings --shift-heading-level-by=1 --number-sections --resource-path=docs --toc --katex --self-contained --number-offset=1 -o "$(OUTPUT_DIR)/$(subst build-html/,,$@).html"

# Build HTML slides
$(addprefix build-html-slides/,$(obj)): build/qr
	mkdir -p "$(OUTPUT_DIR)"
	pandoc --to slidy --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs --toc --katex --self-contained -o "$(OUTPUT_DIR)/$(subst build-html-slides/,,$@).slides.html" "docs/$(subst build-html-slides/,,$@).md"

# Build EPUB
$(addprefix build-epub/,$(obj)): build/qr
	mkdir -p "$(OUTPUT_DIR)"
	pandoc --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs -M titlepage=true -M toc=true -M toc-own-page=true -M linkcolor="{HTML}{006666}" -o "$(OUTPUT_DIR)/$(subst build-epub/,,$@).epub" "docs/$(subst build-epub/,,$@).md"

# Build ODT
$(addprefix build-odt/,$(obj)): build/qr
	mkdir -p "$(OUTPUT_DIR)"
	pandoc --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs -M titlepage=true -M toc=true -M toc-own-page=true -M linkcolor="{HTML}{006666}" -o "$(OUTPUT_DIR)/$(subst build-odt/,,$@).odt" "docs/$(subst build-odt/,,$@).md"

# Build plaintext
$(addprefix build-plaintext/,$(obj)): build/qr
	mkdir -p "$(OUTPUT_DIR)"
	pandoc --to plain --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs --toc --self-contained -o "$(OUTPUT_DIR)/$(subst build-plaintext/,,$@).txt" "docs/$(subst build-plaintext/,,$@).md"

# Build metadata
build/metadata:
	mkdir -p "$(OUTPUT_DIR)"
	git log > "$(OUTPUT_DIR)"/CHANGELOG
	cp LICENSE "$(OUTPUT_DIR)"
	pandoc --shift-heading-level-by=-1 --to markdown --standalone "README.md" | pandoc --to html5 --listings --shift-heading-level-by=1 --number-sections --resource-path=docs --toc --katex --self-contained --number-offset=1 -o "$(OUTPUT_DIR)/README.html"

# Build QR code
build/qr:
	mkdir -p docs/static
	qr "https://$$(git remote get-url origin | sed -r 's|^.*@(.*):|\1/|g' | sed 's@.*://@@g' | sed 's/.git$$//g')" | tee docs/static/qr.png>/dev/null

# Build tarball
build/tarball: build/qr build/metadata
	mkdir -p "$(OUTPUT_DIR)"
	tar zcvf "$(OUTPUT_DIR)"/source.tar.gz --exclude-from=.gitignore --exclude=.git --exclude="$(OUTPUT_DIR)" .

# Build tree
build/tree: $(addprefix build/,$(obj)) build/tarball
	mkdir -p "$(OUTPUT_DIR)"
	tree -T "$$(git remote get-url origin | sed -r 's|^.*@(.*):|\1/|g' | sed 's@.*://@@g' | sed 's/.git$$//g')" -H '.' -I 'index.html|release.zip' -o "$(OUTPUT_DIR)"/index.html "$(OUTPUT_DIR)"

# Build archive
build/archive: build/tree
	mkdir -p "$(OUTPUT_DIR)"
	zip -j -x 'release.zip' -FSr "$(OUTPUT_DIR)"/release.zip "$(OUTPUT_DIR)"/*

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

# Open EPUB
$(addprefix open-epub/,$(obj)):
	xdg-open "$(OUTPUT_DIR)/$(subst open-epub/,,$@).epub"

# Open ODT
$(addprefix open-odt/,$(obj)):
	xdg-open "$(OUTPUT_DIR)/$(subst open-odt/,,$@).odt"

# Open plaintext
$(addprefix open-plaintext/,$(obj)):
	xdg-open "$(OUTPUT_DIR)/$(subst open-plaintext/,,$@).txt"

# Clean
clean:
	rm -rf "$(OUTPUT_DIR)" docs/static/qr.png

# Dependencies
depend:
	pip install pillow qrcode
	curl -L -o /tmp/Eisvogel.zip 'https://github.com/Wandmalfarbe/pandoc-latex-template/releases/latest/download/Eisvogel.zip'
	mkdir -p "$${HOME}/.local/share/pandoc/templates"
	unzip -p /tmp/Eisvogel.zip eisvogel.latex | tee "$${HOME}/.local/share/pandoc/templates/eisvogel.latex">/dev/null
