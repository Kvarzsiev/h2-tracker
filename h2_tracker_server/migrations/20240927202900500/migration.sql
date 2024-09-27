BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "peso" (
    "id" bigserial PRIMARY KEY,
    "peso" double precision NOT NULL,
    "imc" double precision NOT NULL,
    "dataPesagem" timestamp without time zone NOT NULL,
    "pessoaId" bigint NOT NULL
);

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
    "cpf" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "peso"
    ADD CONSTRAINT "peso_fk_0"
    FOREIGN KEY("pessoaId")
    REFERENCES "pessoa"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20240927202900500', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240927202900500', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
