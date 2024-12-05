BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "alimento" (
    "id" bigserial PRIMARY KEY,
    "tipo" text NOT NULL,
    "caloriasGrama" bigint NOT NULL,
    "proteinasGrama" bigint NOT NULL,
    "descricao" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "opcao_alimento" (
    "id" bigserial PRIMARY KEY,
    "quantidade" bigint NOT NULL,
    "refeicaoId" bigint NOT NULL,
    "alimentoId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "opcao_alimento"
    ADD CONSTRAINT "opcao_alimento_fk_0"
    FOREIGN KEY("refeicaoId")
    REFERENCES "refeicao"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "opcao_alimento"
    ADD CONSTRAINT "opcao_alimento_fk_1"
    FOREIGN KEY("alimentoId")
    REFERENCES "alimento"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241204232649571', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241204232649571', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
