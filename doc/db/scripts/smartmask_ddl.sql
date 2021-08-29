-- drop tables comentados, para caso de necessidade de deleção das tabelas
--DROP TABLE tb_sensor CASCADE CONSTRAINTS;
--DROP TABLE tb_smartmask CASCADE CONSTRAINTS;
--DROP TABLE tb_usuario CASCADE CONSTRAINTS;

-- criação da tabela tb_sensor
CREATE TABLE tb_sensor (
    id_sensor     NUMBER(12) NOT NULL,
    id_smartmask  NUMBER(12) NOT NULL,
    nm_sensor     VARCHAR2(200 CHAR) NOT NULL,
    ds_sensor     VARCHAR2(1000 CHAR) NOT NULL,
    status        CHAR(1) NOT NULL
);

-- criação da constraint primary key da tabela tb_sensor
ALTER TABLE tb_sensor ADD CONSTRAINT pk_sensor PRIMARY KEY ( id_sensor, id_smartmask );

-- criação da tabela tb_smartmask
CREATE TABLE tb_smartmask (
    id_smartmask   NUMBER(12) NOT NULL,
    id_usuario     NUMBER(12) NOT NULL,
    nm_smartmask   VARCHAR2(120) NOT NULL,
    ds_smartmask   VARCHAR2(600) NOT NULL,
    dt_fabricacao  TIMESTAMP  NOT NULL
);

-- criação da constraint primary key da tabela tb_smartmask
ALTER TABLE tb_smartmask ADD CONSTRAINT pk_smartmask PRIMARY KEY ( id_smartmask );

-- criação da tabela tb_usuario
CREATE TABLE tb_usuario (
    id_usuario   NUMBER(12) NOT NULL,
    nm_usuario   VARCHAR2(100) NOT NULL,
    ds_email     VARCHAR2(120 CHAR) NOT NULL,
    ds_senha     VARCHAR2(20 CHAR) NOT NULL,
    nr_telefone  NUMBER(11) NOT NULL,
    nr_idade     NUMBER(3),
    ds_genero    VARCHAR2(2),
    url_foto     VARCHAR2(400 CHAR)
);

-- criação da constraint primary key da tabela tb_usuario
ALTER TABLE tb_usuario ADD CONSTRAINT pk_usuario PRIMARY KEY ( id_usuario );

-- criação das constraints unique da tabela tb_usuario
ALTER TABLE tb_usuario
    ADD CONSTRAINT un_usuario UNIQUE (  ds_email,
                                        ds_senha,
                                        nr_telefone );

-- criação da constraint foreign key na tabela tb_sensor
--representando relacionamento entre tb_sensor e tb_smartmask
ALTER TABLE tb_sensor
    ADD CONSTRAINT fk_sensor_smartmask FOREIGN KEY ( id_smartmask )
        REFERENCES tb_smartmask ( id_smartmask )
        ON DELETE CASCADE;

-- criação da constraint foreign key na tabela tb_smartmask
--representando relacionamento entre tb_smartmask e tb_usuario 
ALTER TABLE tb_smartmask
    ADD CONSTRAINT fk_smartmask_usuario FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario )
        ON DELETE CASCADE;
