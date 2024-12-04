BEGIN;

--
-- Class Dieta as table dieta
--
CREATE TABLE "dieta" (
    "id" bigserial PRIMARY KEY,
    "caloriasMaximasDia" bigint NOT NULL,
    "objetivo" text NOT NULL,
    "descricao" text NOT NULL,
    "dataFim" timestamp without time zone NOT NULL,
    "pessoaId" bigint NOT NULL
);

--
-- Class Exercicio as table exercicio
--
CREATE TABLE "exercicio" (
    "id" bigserial PRIMARY KEY,
    "nome" text NOT NULL,
    "grupoMuscular" text NOT NULL,
    "descricao" text NOT NULL,
    "imagem" text NOT NULL
);

--
-- Class Peso as table peso
--
CREATE TABLE "peso" (
    "id" bigserial PRIMARY KEY,
    "peso" double precision NOT NULL,
    "imc" double precision NOT NULL,
    "dataPesagem" timestamp without time zone NOT NULL,
    "pessoaId" bigint NOT NULL
);

--
-- Class Pessoa as table pessoa
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
-- Class Refeicao as table refeicao
--
CREATE TABLE "refeicao" (
    "id" bigserial PRIMARY KEY,
    "calorias" bigint NOT NULL,
    "proteinas" bigint NOT NULL,
    "descricao" text NOT NULL,
    "dietaId" bigint NOT NULL
);

--
-- Class Treino as table treino
--
CREATE TABLE "treino" (
    "id" bigserial PRIMARY KEY,
    "descricao" text NOT NULL,
    "objetivo" text NOT NULL,
    "pessoaId" bigint NOT NULL
);

--
-- Class TreinoExercicio as table treino_exercicio
--
CREATE TABLE "treino_exercicio" (
    "id" bigserial PRIMARY KEY,
    "repeticoes" bigint NOT NULL,
    "series" bigint NOT NULL,
    "treinoId" bigint NOT NULL,
    "exercicioId" bigint NOT NULL
);

--
-- Class TreinoExercicioHistorico as table treino_exercicio_historico
--
CREATE TABLE "treino_exercicio_historico" (
    "id" bigserial PRIMARY KEY,
    "progressao" text NOT NULL,
    "treinoExercicioId" bigint NOT NULL,
    "treinoHistoricoId" bigint NOT NULL
);

--
-- Class TreinoHistorico as table treino_historico
--
CREATE TABLE "treino_historico" (
    "id" bigserial PRIMARY KEY,
    "horarioInicio" timestamp without time zone NOT NULL,
    "horarioFim" timestamp without time zone NOT NULL,
    "treinoId" bigint NOT NULL
);

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Foreign relations for "dieta" table
--
ALTER TABLE ONLY "dieta"
    ADD CONSTRAINT "dieta_fk_0"
    FOREIGN KEY("pessoaId")
    REFERENCES "pessoa"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "peso" table
--
ALTER TABLE ONLY "peso"
    ADD CONSTRAINT "peso_fk_0"
    FOREIGN KEY("pessoaId")
    REFERENCES "pessoa"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "refeicao" table
--
ALTER TABLE ONLY "refeicao"
    ADD CONSTRAINT "refeicao_fk_0"
    FOREIGN KEY("dietaId")
    REFERENCES "dieta"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "treino" table
--
ALTER TABLE ONLY "treino"
    ADD CONSTRAINT "treino_fk_0"
    FOREIGN KEY("pessoaId")
    REFERENCES "pessoa"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "treino_exercicio" table
--
ALTER TABLE ONLY "treino_exercicio"
    ADD CONSTRAINT "treino_exercicio_fk_0"
    FOREIGN KEY("treinoId")
    REFERENCES "treino"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "treino_exercicio"
    ADD CONSTRAINT "treino_exercicio_fk_1"
    FOREIGN KEY("exercicioId")
    REFERENCES "exercicio"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "treino_exercicio_historico" table
--
ALTER TABLE ONLY "treino_exercicio_historico"
    ADD CONSTRAINT "treino_exercicio_historico_fk_0"
    FOREIGN KEY("treinoExercicioId")
    REFERENCES "treino_exercicio"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "treino_exercicio_historico"
    ADD CONSTRAINT "treino_exercicio_historico_fk_1"
    FOREIGN KEY("treinoHistoricoId")
    REFERENCES "treino_historico"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "treino_historico" table
--
ALTER TABLE ONLY "treino_historico"
    ADD CONSTRAINT "treino_historico_fk_0"
    FOREIGN KEY("treinoId")
    REFERENCES "treino"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR h2_tracker
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('h2_tracker', '20241203223600863', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241203223600863', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
