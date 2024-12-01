BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "exercicio" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "exercicio" (
    "id" bigserial PRIMARY KEY,
    "nome" text NOT NULL,
    "grupoMuscular" text NOT NULL,
    "descricao" text NOT NULL,
    "imagem" text NOT NULL
);


--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241201161309211', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241201161309211', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
