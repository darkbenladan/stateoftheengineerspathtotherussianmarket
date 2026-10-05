.DEFAULT_GOAL := help

node_modules: package.json package-lock.json
	npm ci
	@touch node_modules

.PHONY: install
install: node_modules 

.PHONY: dev
dev: node_modules ## Run the Slidev dev server
	npm run dev

.PHONY: build
build: node_modules ## Build the static site into dist/
	npm run build

THEME ?= light

.PHONY: export
export: node_modules ## Export the slides to PDF (THEME=dark for dark mode)
	npm run export -- $(if $(filter dark,$(THEME)),--dark --output slides-export-dark.pdf)

.PHONY: clean
clean: ## Remove node_modules and build artifacts
	rm -rf node_modules dist

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'