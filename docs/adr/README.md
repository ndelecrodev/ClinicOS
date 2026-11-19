# Decisões de arquitetura (ADRs)

Cada decisão relevante fica em um arquivo curto `NNNN-titulo.md`, baseado em [0000-modelo.md](0000-modelo.md). Uma ADR nunca é apagada: quando muda, ganha uma nova que a substitui.

Status possíveis: **Proposta**, **Aceita**, **Substituída** e **Rejeitada**.

| ADR | Decisão | Status | Arquivo |
|---|---|---|---|
| 01 | Monolito modular Java com limites verificados no build | Proposta (fecha com a verificação de módulos na etapa b) | a criar |
| 02 | RLS no PostgreSQL como defesa em profundidade | Proposta (fecha com a PoC da etapa e2) | a criar |
| 03 | Anti double-booking por constraint de exclusão + transação curta | Proposta (fecha com a PoC da etapa e1) | a criar |
| 04 | Jobs e outbox no PostgreSQL, sem Redis nem RabbitMQ no MVP | Proposta (fecha com a PoC da etapa e3) | a criar |
| 05 | Remarcar mantém o ID da consulta e grava histórico | Proposta | a criar |
| 06 | Python só em R5, sem escrita em dados de negócio | Proposta | a criar |
| 07 | Analytics de produto e e-mail condicionados a revisão de privacidade | Pendente (PA-12) | a criar |
| 08 | Biblioteca de calendário | Pendente (PoC de desempenho e licença) | a criar |
| 09 | Convenção de nomes dos recursos da API | Aceita | [0009](0009-convencao-de-nomes-da-api.md) |
| 10 | Reserva de recurso fica no Scheduling no R1 | Aceita | [0010](0010-reserva-de-recurso-no-scheduling-no-r1.md) |

As ADR 01 a 08 vêm do PRD (seção 11.1). As ADR 09 em diante nascem durante a implementação.
