# Public variables
DESTDIR ?=
OUTPUT_DIR ?= out

# Private variables
obj = $(shell ls docs/*.md | sed 's/.md//g' | sed 's@docs/@@g')
all: $(addprefix build/,$(obj))

# Build
build: $(addprefix build/,$(obj))
$(addprefix build/,$(obj)):
	mkdir -p out docs/static
	qr "$$(cat docs/metadata.txt)" > docs/static/qr.png
	pandoc --template eisvogel --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs -o "$(OUTPUT_DIR)/$(subst build/,,$@).pdf" "docs/$(subst build/,,$@).md"

# Run
$(addprefix run/,$(obj)):
	xdg-open "$(OUTPUT_DIR)/$(subst run/,,$@).pdf"

# Clean
clean:
	rm -rf "$(OUTPUT_DIR)" docs/static/qr.png

# Dependencies
depend:
	pip install pillow qrcode
	curl -L -o /tmp/Eisvogel.zip 'https://github.com/Wandmalfarbe/pandoc-latex-template/releases/latest/download/Eisvogel.zip'
	mkdir -p "$${HOME}/.local/share/pandoc/templates"
	unzip -p /tmp/Eisvogel.zip eisvogel.latex > "$${HOME}/.local/share/pandoc/templates/eisvogel.latex"
