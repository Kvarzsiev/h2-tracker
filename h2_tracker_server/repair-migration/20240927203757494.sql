BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "peso" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "pessoa" CASCADE;


--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20240927181141269', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240927181141269', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR _repair
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('_repair', '20240927203757494', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240927203757494', "timestamp" = now();


COMMIT;
