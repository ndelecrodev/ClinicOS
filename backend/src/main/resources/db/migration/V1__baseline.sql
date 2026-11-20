-- Base para a constraint de exclusão do agendamento (anti double-booking).
-- Permite combinar igualdade (profissional) com sobreposição de intervalo (horário) num índice GiST.
CREATE EXTENSION IF NOT EXISTS btree_gist;
