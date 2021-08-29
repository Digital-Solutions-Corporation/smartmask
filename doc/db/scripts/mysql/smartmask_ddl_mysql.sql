
-- DROP TABLE tb_sensor CASCADE ;
-- DROP TABLE tb_smartmask CASCADE ;
-- DROP TABLE tb_usuario CASCADE ;

CREATE TABLE tb_sensor (
    id_sensor     NUMERIC(12) NOT NULL,
    id_smartmask  NUMERIC(12) NOT NULL,
    nm_sensor     VARCHAR(200) NOT NULL,
    ds_sensor     VARCHAR(1000) NOT NULL,
    status        CHAR(1) NOT NULL
);

ALTER TABLE tb_sensor ADD CONSTRAINT pk_sensor PRIMARY KEY ( id_sensor,
                                                             id_smartmask );

CREATE TABLE tb_smartmask (
    id_smartmask   NUMERIC(12) NOT NULL,
    id_usuario     NUMERIC(12) NOT NULL,
    nm_smartmask   VARCHAR(120) NOT NULL,
    ds_smartmask   VARCHAR(600) NOT NULL,
    dt_fabricacao  DATE NOT NULL
);

ALTER TABLE tb_smartmask ADD CONSTRAINT pk_smartmask PRIMARY KEY ( id_smartmask );

CREATE TABLE tb_usuario (
    id_usuario   NUMERIC(12) NOT NULL,
    nm_usuario   VARCHAR(100) NOT NULL,
    ds_email     VARCHAR(120) NOT NULL,
    ds_senha     VARCHAR(20) NOT NULL,
    ds_telefone  NUMERIC(11) NOT NULL,
    nr_idade     NUMERIC(3),
    ds_genero    VARCHAR(2),
    url_foto     BLOB
);

ALTER TABLE tb_usuario ADD CONSTRAINT pk_usuario PRIMARY KEY ( id_usuario );

ALTER TABLE tb_usuario
    ADD CONSTRAINT un_usuario UNIQUE ( ds_email,
                                       ds_senha,
                                       ds_telefone );

ALTER TABLE tb_sensor
    ADD CONSTRAINT fk_sensor_smartmask FOREIGN KEY ( id_smartmask )
        REFERENCES tb_smartmask ( id_smartmask );

ALTER TABLE tb_smartmask
    ADD CONSTRAINT fk_smartmask_usuario FOREIGN KEY ( id_usuario )
        REFERENCES tb_usuario ( id_usuario );
