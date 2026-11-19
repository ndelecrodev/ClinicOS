.DEFAULT_GOAL := help

.PHONY: help install build lint typecheck test

help: ## Lista os comandos disponíveis
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-12s %s\n", $$1, $$2}'

install: ## Instala as dependências do monorepo web
	pnpm install

build: ## Compila os pacotes e o app web
	pnpm build

lint: ## Roda o lint do monorepo web
	pnpm lint

typecheck: ## Verifica os tipos do monorepo web
	pnpm typecheck

test: ## Roda os testes do monorepo web
	pnpm test
