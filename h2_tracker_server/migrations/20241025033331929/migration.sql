BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "treino" DROP CONSTRAINT "treino_fk_0";
ALTER TABLE ONLY "treino"
    ADD CONSTRAINT "treino_fk_0"
    FOREIGN KEY("pessoaId")
    REFERENCES "pessoa"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "treino_exercicio" DROP CONSTRAINT "treino_exercicio_fk_0";
ALTER TABLE ONLY "treino_exercicio"
    ADD CONSTRAINT "treino_exercicio_fk_0"
    FOREIGN KEY("treinoId")
    REFERENCES "treino"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "treino_exercicio_historico" DROP CONSTRAINT "treino_exercicio_historico_fk_0";
ALTER TABLE ONLY "treino_exercicio_historico"
    ADD CONSTRAINT "treino_exercicio_historico_fk_0"
    FOREIGN KEY("treinoExercicioId")
    REFERENCES "treino_exercicio"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "treino_historico" DROP CONSTRAINT "treino_historico_fk_0";
ALTER TABLE ONLY "treino_historico"
    ADD CONSTRAINT "treino_historico_fk_0"
    FOREIGN KEY("treinoId")
    REFERENCES "treino"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241025033331929', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241025033331929', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
