.DEFAULT_GOAL := help
BASE ?= /devops-social-contract/

node_modules: package.json
	npm install
	@touch node_modules

.PHONY: dev
dev: node_modules ## Запустить dev-сервер
	npx slidev --open

.PHONY: build
build: node_modules ## Собрать статический сайт в dist/ (BASE=/имя-репозитория/)
	npx slidev build --base $(BASE)

.PHONY: export
export: node_modules ## Собрать PDF со всеми шагами анимации
	npx slidev export --with-clicks --output slides-export.pdf

.PHONY: clean
clean: ## Удалить dist/ и кеш
	rm -rf dist .slidev

.PHONY: help
help: ## Показать цели
	@grep -E '^[a-z-]+:.*## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "  %-10s %s\n", $$1, $$2}'
