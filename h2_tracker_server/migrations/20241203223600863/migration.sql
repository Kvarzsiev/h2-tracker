BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "treino_exercicio_historico" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "treino_exercicio_historico" (
    "id" bigserial PRIMARY KEY,
    "progressao" text NOT NULL,
    "treinoExercicioId" bigint NOT NULL,
    "treinoHistoricoId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "treino_exercicio_historico"
    ADD CONSTRAINT "treino_exercicio_historico_fk_0"
    FOREIGN KEY("treinoExercicioId")
    REFERENCES "treino_exercicio"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "treino_exercicio_historico"
    ADD CONSTRAINT "treino_exercicio_historico_fk_1"
    FOREIGN KEY("treinoHistoricoId")
    REFERENCES "treino_historico"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241203223600863', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241203223600863', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
