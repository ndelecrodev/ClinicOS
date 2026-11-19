# 0010. Reserva de recurso fica no Scheduling no R1

- **Status:** Aceita
- **Data:** 2026-11-19

## Contexto

O PRD pede, já no R1, a reserva de recursos (sala, equipamento) modelada no dado, com UI mínima (RF-AGD-05, BR-02). Pela tabela de módulos (seção 8.3), Salas e equipamentos pertencem ao módulo `resources`, que é entregue no R2 (RF-RES-01 e 02). O Scheduling depende do `resources`.

## Decisão

- Não criar o módulo `resources` no R1.
- A tabela `scheduling_resource_reservation` fica no módulo Scheduling, com `resource_id` **sem chave estrangeira**, porque ainda não existe tabela de recursos.
- A restrição de exclusão por recurso (BR-02) já é criada nessa tabela.
- No R2, o módulo `resources` nasce com o cadastro de salas e equipamentos, e a chave estrangeira entra por migração (expandir, migrar, contrair).

## Alternativas consideradas

- Criar um módulo `resources` mínimo agora: antecipa código de fase futura e aumenta o escopo do R1.
- Deixar a reserva de recurso fora do R1: contraria o PRD, que pede o dado modelado desde o início.

## Consequências

- O R1 não cadastra recursos nem tem UI de salas.
- Há uma migração de ligação planejada para o R2.
- Os limites entre módulos continuam válidos: nenhum SQL cruza módulos.

## Verificação

`ApplicationModules.verify()` no build e teste de integração da constraint de exclusão por recurso.
