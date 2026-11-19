## O que mudou

<!-- Resumo objetivo da mudança. -->

## Por quê

<!-- Motivação, issue relacionada (Closes #N / Refs #N) e requisito do PRD, se houver. -->

## Como testar

<!-- Passo a passo para validar, incluindo comandos e dados sintéticos usados. -->

## Riscos

<!-- Impacto em dados, migrações, compatibilidade, desempenho, segurança. Plano de rollback. -->

## Capturas de tela (se houver UI)

<!-- Antes/depois; telas em desktop e 360 px; temas claro e escuro. -->

## Checklist de pronto

- [ ] Testes relevantes passam (unitários, integração, concorrência/isolamento quando aplicável)
- [ ] Endpoint novo ou alterado tem teste de acesso cruzado entre tenants
- [ ] Autorização verificada no servidor, com testes negativos
- [ ] OpenAPI e `api-client` regenerados, se o contrato mudou
- [ ] Migração revisada e compatível com a versão anterior (expandir, migrar, contrair)
- [ ] Acessibilidade verificada (teclado, foco visível, contraste, WCAG 2.2 AA) em mudanças de UI
- [ ] Estados de interface completos: carregando, vazio, erro, sem permissão
- [ ] Nenhum dado pessoal ou segredo em código, logs, testes ou capturas de tela
- [ ] Título da PR segue Conventional Commits em português
