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
	qr $$(cat docs/metadata.txt) > docs/static/qr.png
	pandoc --template eisvogel --listings --shift-heading-level-by=-1 --number-sections --resource-path=docs -o $(OUTPUT_DIR)/$(subst build/,,$@).pdf docs/$(subst build/,,$@).md

# Run
$(addprefix run/,$(obj)):
	xdg-open out/$(subst run/,,$@).pdf

# Clean
clean:
	rm -rf out docs/static/qr.png

# Dependencies
depend:
	[ -x "$$(command -v apt)" ] && sudo apt install -y curl python3-pip pandoc texlive-full || sudo dnf install -y curl python3-pip pandoc texlive-scheme-full
	pip install qrcode
	mkdir -p $${HOME}/.local/share/pandoc/templates
	unzip -p /tmp/Eisvogel.zip eisvogel.latex > $${HOME}/.local/share/pandoc/templates/eisvogel.latex
