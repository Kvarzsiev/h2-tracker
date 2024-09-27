BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "peso" DROP CONSTRAINT "peso_fk_0";
ALTER TABLE ONLY "peso"
    ADD CONSTRAINT "peso_fk_0"
    FOREIGN KEY("pessoaId")
    REFERENCES "pessoa"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20240927204030070', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240927204030070', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
