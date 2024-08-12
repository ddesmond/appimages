SHELL := /bin/bash

# development
apps:
	@rm -rf deb2appimage-0.0.5-x86_64.AppImage
	@wget https://github.com/simoniz0r/deb2appimage/releases/download/v0.0.5/deb2appimage-0.0.5-x86_64.AppImage
	@chmod +x deb2appimage-0.0.5-x86_64.AppImage
	@apt install alien -y
	@mkdir -p converted
	@mkdir -p deb


install: apps

# testing
dependencies:
	@echo "Installing dependencies..."

alien-%:
	@echo "$(subst alien-,,$@)"
	alien "$(subst alien-,,$@)" --scripts -d

%:
	@echo $@
	@./deb2appimage-0.0.5-x86_64.AppImage -j $@ -o converted --debug

