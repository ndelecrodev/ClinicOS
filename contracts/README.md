# contracts

Contrato da API em OpenAPI.

- `openapi.json` é o snapshot versionado do contrato, gerado pelo backend (springdoc).
- O CI compara o contrato gerado com este snapshot e falha em mudança incompatível.
- `packages/api-client` é gerado a partir deste arquivo. Nunca edite o cliente à mão.

Para mudar o contrato: altere o backend, regenere o snapshot e inclua os dois no mesmo commit.
