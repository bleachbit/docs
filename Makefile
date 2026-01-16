# Makefile for BleachBit documentation site


.PHONY: help clean serve build install update

# Default target
help:
	@echo "Available targets:"
	@echo "  help     - Show this help message"
	@echo "  clean    - Remove generated files and dependencies"
	@echo "  serve    - Start local development server"
	@echo "  build    - Build the static site"
	@echo "  install  - Install Ruby dependencies"
	@echo "  update   - Update Ruby dependencies"

# Clean generated files and dependencies
clean:
	@echo "Cleaning generated files..."
	rm -rf _site/
	rm -rf .jekyll-cache/
	rm -rf _pages/
	@echo "Cleaning Ruby dependencies..."
	rm -rf .bundle/
	rm -rf vendor/
	rm -f Gemfile.lock
	@echo "Cleaning editor temporary files..."
	find . -name "*.sw?" -delete
	find . -name "*~" -delete
	@echo "Clean complete."

# Install Ruby dependencies
install:
	@echo "Installing Ruby dependencies..."
	bundle install
	@echo "Dependencies installed."

# Update Ruby dependencies
update:
	@echo "Updating Ruby dependencies..."
	bundle update
	@echo "Dependencies updated."

# Build the static site
build:
	@echo "Building site..."
	bundle exec jekyll build
	@echo "Site built in _site/"

# Serve locally for development
serve:
	@echo "Starting development server..."
	bundle exec jekyll serve --watch --drafts

# Serve locally without drafts (production-like)
serve-prod:
	@echo "Starting production-like server..."
	bundle exec jekyll serve --watch
