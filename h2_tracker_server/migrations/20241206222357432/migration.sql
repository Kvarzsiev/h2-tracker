BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "treino_exercicio" DROP CONSTRAINT "treino_exercicio_fk_1";
ALTER TABLE ONLY "treino_exercicio"
    ADD CONSTRAINT "treino_exercicio_fk_1"
    FOREIGN KEY("exercicioId")
    REFERENCES "exercicio"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241206222357432', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241206222357432', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
