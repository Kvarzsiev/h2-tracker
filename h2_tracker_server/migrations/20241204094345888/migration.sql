BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "dieta" DROP COLUMN "imagem";

--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241204094345888', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241204094345888', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
