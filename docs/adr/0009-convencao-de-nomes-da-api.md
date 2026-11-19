# 0009. Convenção de nomes dos recursos da API

- **Status:** Aceita
- **Data:** 2026-11-19

## Contexto

O PRD (PA-15) deixa em aberto o idioma e o formato dos nomes de recursos da API REST. O contrato OpenAPI é a fonte do cliente TypeScript, então a convenção precisa ser única e estável desde o início.

## Decisão

- Recursos em **inglês**, no **plural** e em **kebab-case**: `/appointments`, `/patients`, `/notification-templates`.
- Ações de estado como sub-recurso com verbo: `/appointments/{id}/cancel`, `/appointments/{id}/check-in`.
- Prefixo de versão no caminho: `/api/v1`.
- Campos JSON em `camelCase`.
- O tenant nunca aparece no caminho, nos parâmetros ou no corpo: vem da sessão.
- Textos para o usuário (mensagens de erro, rótulos) ficam em português do Brasil; identificadores ficam em inglês.

## Alternativas consideradas

- Nomes em português (`/consultas`, `/pacientes`): combinaria com a interface, mas mistura idiomas no código, que usa identificadores em inglês.
- Singular (`/appointment`): foge da convenção REST mais comum.

## Consequências

O mapa de endpoints do PRD (seção 8.7) já segue esta convenção. Todo endpoint novo precisa respeitá-la, e o lint do contrato pode verificá-la no CI.

## Verificação

Revisão da PR e, depois, regra automatizada sobre o `contracts/openapi.json`.
