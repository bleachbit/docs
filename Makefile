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
	git clean -dfx
	@echo "Collecting garbage in git..."
	git gc
	@echo "Clean complete."

# Install Ruby dependencies
install:
	@echo "Installing Ruby dependencies..."
	bundle install
	@echo "Dependencies installed"

# Update Ruby dependencies
update:
	@echo "Updating Ruby dependencies..."
	bundle update
	@echo "Dependencies updated."
	@echo "Listing outdated dependencies..."
	bundle outdated

# Build the static site
build:
	@echo "Building site..."
	bundle exec jekyll build
	@echo "Site built in _site/"

# Serve locally for development
serve:
	@echo "Starting development server..."
	bundle exec jekyll serve --drafts

# Serve locally without drafts (production-like)
serve-prod:
	@echo "Starting production-like server..."
	bundle exec jekyll serve
