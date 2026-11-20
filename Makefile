.DEFAULT_GOAL := help

.PHONY: help install build lint typecheck test up down logs backend-test hooks

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

up: ## Sobe Postgres, Mailpit e o mock do WhatsApp
	docker compose --env-file .env -f infra/compose/compose.yaml up -d

down: ## Derruba os servicos locais (mantem os dados)
	docker compose --env-file .env -f infra/compose/compose.yaml down

logs: ## Acompanha os logs dos servicos locais
	docker compose --env-file .env -f infra/compose/compose.yaml logs -f

backend-test: ## Roda os testes do backend (requer Docker e o Gradle Wrapper)
	cd backend && ./gradlew test

hooks: ## Instala o pre-commit (via uv) e ativa os hooks de commit e de mensagem
	uv tool install pre-commit
	pre-commit install --hook-type pre-commit --hook-type commit-msg
