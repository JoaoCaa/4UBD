-- Gerado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   em:        2024-12-03 11:06:12 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE condominios (
    idCondominio       NUMBER(10) NOT NULL,
    nome               VARCHAR2(100) NOT NULL,
    endereco           VARCHAR2(200) NOT NULL,
    numero             NUMBER(10) NOT NULL,
    cep                NUMBER(8) NOT NULL,
    bairro             VARCHAR2(100) NOT NULL,
    cidade             VARCHAR2(100) NOT NULL,
    estado             VARCHAR2(2) NOT NULL,
    proprietario       VARCHAR2(100),
    cnpj               NUMBER(14)
);

ALTER TABLE condominios
    ADD CONSTRAINT pk_condominios PRIMARY KEY (idCondominio);

CREATE TABLE condominhos (
    idCondomino        NUMBER(10) NOT NULL,
    nome               VARCHAR2(100) NOT NULL,
    cpf                NUMBER(11) NOT NULL,
    email              VARCHAR2(100),
    senha              VARCHAR2(50) NOT NULL,
    user               VARCHAR2(50) NOT NULL,
    Condominios_idCondominio NUMBER(10) NOT NULL
);

ALTER TABLE condominhos
    ADD CONSTRAINT pk_condominhos PRIMARY KEY (idCondomino);

ALTER TABLE condominhos
    ADD CONSTRAINT fk_condomino_condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES condominios (idCondominio);

CREATE TABLE moradores (
    idMorador          NUMBER(10) NOT NULL,
    bloco              VARCHAR2(10) NOT NULL,
    numApart           NUMBER(5) NOT NULL,
    valorAluguel       NUMBER(10, 2) NOT NULL,
    Condominios_idCondominio NUMBER(10) NOT NULL
);

ALTER TABLE moradores
    ADD CONSTRAINT pk_moradores PRIMARY KEY (idMorador);

ALTER TABLE moradores
    ADD CONSTRAINT fk_morador_condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES condominios (idCondominio);

CREATE TABLE sindicos (
    idSindico          NUMBER(10) NOT NULL,
    inicioMandato      DATE NOT NULL,
    fimMandato         DATE,
    Condominios_idCondominio NUMBER(10) NOT NULL
);

ALTER TABLE sindicos
    ADD CONSTRAINT pk_sindicos PRIMARY KEY (idSindico);

ALTER TABLE sindicos
    ADD CONSTRAINT fk_sindico_condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES condominios (idCondominio);

CREATE TABLE tarefas (
    idTarefa           NUMBER(10) NOT NULL,
    nome               VARCHAR2(100) NOT NULL,
    status             VARCHAR2(20) NOT NULL,
    dataConclusao      DATE,
    descricao          VARCHAR2(500),
    Condominios_idCondominio NUMBER(10) NOT NULL
);

ALTER TABLE tarefas
    ADD CONSTRAINT pk_tarefas PRIMARY KEY (idTarefa);

ALTER TABLE tarefas
    ADD CONSTRAINT fk_tarefa_condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES condominios (idCondominio);

CREATE TABLE portarias (
    idPortaria         NUMBER(10) NOT NULL,
    portaria           VARCHAR2(100) NOT NULL,
    Condominios_idCondominio NUMBER(10) NOT NULL
);

ALTER TABLE portarias
    ADD CONSTRAINT pk_portarias PRIMARY KEY (idPortaria);

ALTER TABLE portarias
    ADD CONSTRAINT fk_portaria_condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES condominios (idCondominio);

CREATE TABLE mensagens (
    idMensagem         NUMBER(10) NOT NULL,
    destinatario       VARCHAR2(100) NOT NULL,
    mensagem           VARCHAR2(1000) NOT NULL,
    Condominios_idCondominio NUMBER(10),
    idPortaria         NUMBER(10)
);

ALTER TABLE mensagens
    ADD CONSTRAINT pk_mensagens PRIMARY KEY (idMensagem);

ALTER TABLE mensagens
    ADD CONSTRAINT fk_mensagem_condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES condominios (idCondominio);

ALTER TABLE mensagens
    ADD CONSTRAINT fk_mensagem_portaria FOREIGN KEY (idPortaria)
        REFERENCES portarias (idPortaria);


CREATE TABLE solicitacoes (
    idSolicitacao      NUMBER(10) NOT NULL,
    solicitacao        VARCHAR2(500) NOT NULL,
    justificativa      VARCHAR2(500),
    Condominios_idCondominio NUMBER(10) NOT NULL
);

ALTER TABLE solicitacoes
    ADD CONSTRAINT pk_solicitacoes PRIMARY KEY (idSolicitacao);

ALTER TABLE solicitacoes
    ADD CONSTRAINT fk_solicitacao_condominio FOREIGN KEY (Condominios_idCondominio)
        REFERENCES condominios (idCondominio);



-- Relatório do Resumo do Oracle SQL Developer Data Modeler:
--
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   0
-- WARNINGS                                 0
