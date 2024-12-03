BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "pessoa" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pessoa" (
    "id" bigserial PRIMARY KEY,
    "nome" text NOT NULL,
    "altura" double precision NOT NULL,
    "idade" bigint NOT NULL,
    "email" text NOT NULL,
    "senha" text NOT NULL,
    "cpf" text NOT NULL,
    "sex" text NOT NULL
);


--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241203092400017', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241203092400017', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
