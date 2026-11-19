# Guia de contribuição

Obrigado por contribuir com o ClinicOS. Este guia descreve o fluxo de branches, o padrão de commits e as regras de Pull Request.

## Princípios

- A fonte da verdade de produto e arquitetura é o PRD em `docs/prd/`; decisões de arquitetura ficam em `docs/adr/`.
- Nunca versione segredos. `.env` fica fora do Git; apenas `.env.example` é versionado.
- Use somente dados sintéticos em desenvolvimento, testes e demonstrações. Dados pessoais e de saúde são sensíveis (LGPD) e não devem aparecer em logs, traces, analytics ou relatórios de erro.

## Branches (trunk-based)

`main` é a única branch de longa duração: sempre estável e implantável. O merge na `main` implanta em staging; produção sai por tag SemVer (`vX.Y.Z`) com aprovação.

- Crie branches a partir da `main` atualizada, deixe-as viver poucos dias e devolva-as por Pull Request.
- Mudanças grandes ou arriscadas entram atrás de feature flag, não em branch longa.
- Não faça commit nem push direto na `main`.
- Uma branch por assunto.

Formato: `<tipo>/<nome-curto>`, em minúsculas, com hífens e sem acento. Com issue: `<tipo>/<numero>-<nome-curto>`.

Tipos: `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `style`, `ci`, `perf`, `build`, `revert`.

```
feat/agenda-semanal
fix/conflito-de-reserva
chore/atualiza-spring-boot
feat/123-bloqueio-de-agenda
```

## Commits

Seguimos o [Conventional Commits 1.0](https://www.conventionalcommits.org/pt-br/v1.0.0/), em português, no imperativo, em minúsculas, sem ponto final e com título de até 72 caracteres.

```
<tipo>(<escopo opcional>): <descrição no imperativo>

<corpo opcional: o porquê da mudança, linhas de até 100 caracteres>

<rodapé opcional: Closes #12 | Refs #12 | BREAKING CHANGE: ...>
```

| Tipo | Quando usar |
|---|---|
| `feat` | Nova funcionalidade |
| `fix` | Correção de bug |
| `docs` | Somente documentação |
| `style` | Formatação, sem mudar comportamento |
| `refactor` | Reestruturação sem mudar comportamento |
| `perf` | Melhoria de desempenho |
| `test` | Testes |
| `build` | Sistema de build e dependências |
| `ci` | Pipelines e workflows |
| `chore` | Manutenção e configuração |
| `revert` | Reversão de commit anterior |

Escopos usuais: `web`, `backend`, módulos (`identity`, `tenancy`, `patients`, `scheduling`, `notifications`, `analytics`, `audit`, `platformadmin`, `integrations`), `tokens`, `ui`, `contracts`, `db`, `infra`, `ci`, `deps`, `docs`, `repo`, `a11y`.

```
feat(scheduling): adiciona cálculo de slots livres com buffers
fix(web): corrige foco do botão de confirmar na agenda
perf(scheduling): reduz consulta de disponibilidade da semana
refactor(notifications): extrai adaptador de e-mail
test(tenancy): cobre acesso cruzado em /patients
chore(deps): atualiza spring boot para 4.0.x
ci(repo): adiciona varredura de segredos
feat(contracts)!: remove campo legado de /appointments
```

Regras:

- Commits pequenos e atômicos: uma mudança lógica por commit. A migração Flyway vai no mesmo commit do código que depende dela.
- Mudança incompatível usa `!` no tipo e `BREAKING CHANGE:` no rodapé.
- Reversão: `revert: <título original>` com `This reverts commit <sha>.` no corpo.
- Referencie a issue no rodapé quando existir (`Closes #12` ao concluir, `Refs #12` quando parcial).
- Evite mensagens vagas ("update", "wip", "ajustes").

## Pull Requests

- Base: `main`. O título segue o padrão de commits, pois o merge por squash o usa como mensagem final.
- Preencha o template em `.github/pull_request_template.md`: o que mudou, por quê, como testar, riscos e capturas de tela quando houver UI.
- Mantenha a PR pequena e focada; use rascunho (draft) enquanto estiver incompleta.
- Checklist de pronto:
  - testes verdes;
  - teste de acesso cruzado entre tenants para endpoint novo ou alterado;
  - OpenAPI e `api-client` regenerados quando o contrato mudar;
  - migração compatível com a versão anterior;
  - acessibilidade verificada em mudanças de UI (WCAG 2.2 AA).
- O merge é feito por **squash**.

## Convenções de código

- Identificadores em inglês; textos de interface e comentários em português do Brasil.
- Siga o lint e o formatador do repositório (ESLint + Prettier, Spotless + Checkstyle).
- Rode lint e testes do que foi alterado antes de abrir a PR.

## Issues

Tarefas e bugs ficam em GitHub Issues. Referencie o número no rodapé do commit e na PR.
