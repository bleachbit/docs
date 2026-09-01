# Makefile for BleachBit documentation site

.PHONY: help clean serve build install update \
	docker-serve docker-build docker-shell docker-down

# Default target
help:
	@echo "Available targets:"
	@echo "  help     - Show this help message"
	@echo "  clean    - Remove generated files and dependencies"
	@echo "  serve    - Start local development server"
	@echo "  build    - Build the static site"
	@echo "  install  - Install Ruby dependencies"
	@echo "  update   - Update Ruby dependencies"
	@echo ""
	@echo "  docker-serve - Start the development server in a container"
	@echo "  docker-build - Build the static site in a container"
	@echo "  docker-shell - Open a shell in the container"
	@echo "  docker-down  - Stop the container"

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

# Compose reads .env automatically, so the container runs as the host user
# instead of root. Delete this file if your uid changes.
.env:
	@printf 'HOST_UID=%s\nHOST_GID=%s\n' $$(id -u) $$(id -g) > $@
	@echo "Wrote $@"

# Serve in a container
docker-serve: .env
	docker compose up --build

# Build the static site in a container
docker-build: .env
	docker compose run --rm --build docs jekyll build
	@echo "Site built in _site/"

# Shell in the container, for bundle update and friends
docker-shell: .env
	docker compose run --rm --build --entrypoint bash docs

# Stop the container
docker-down:
	docker compose down
