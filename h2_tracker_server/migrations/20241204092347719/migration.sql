BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "dieta" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "dieta" (
    "id" bigserial PRIMARY KEY,
    "caloriasMaximasDia" bigint NOT NULL,
    "objetivo" text NOT NULL,
    "descricao" text NOT NULL,
    "dataFim" timestamp without time zone NOT NULL,
    "imagem" text NOT NULL,
    "pessoaId" bigint NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "refeicao" DROP COLUMN "imagem";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "dieta"
    ADD CONSTRAINT "dieta_fk_0"
    FOREIGN KEY("pessoaId")
    REFERENCES "pessoa"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241204092347719', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241204092347719', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
