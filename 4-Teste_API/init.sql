CREATE DATABASE IF NOT EXISTS db_cadastro_ans;
USE db_cadastro_ans;

DROP TABLE IF EXISTS tbl_empresas;

CREATE TABLE tbl_empresas (
  registro_ans VARCHAR(6) NOT NULL,
  cnpj VARCHAR(14) NOT NULL,
  razao_social VARCHAR(255) NOT NULL,
  nome_fantasia VARCHAR(255) DEFAULT NULL,
  modalidade VARCHAR(255) NOT NULL,
  logradouro VARCHAR(255) NOT NULL,
  numero VARCHAR(20) NOT NULL,
  complemento VARCHAR(255) DEFAULT NULL,
  bairro VARCHAR(255) NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  uf VARCHAR(3) NOT NULL,
  cep VARCHAR(8) NOT NULL,
  ddd VARCHAR(2) DEFAULT NULL,
  telefone VARCHAR(20) DEFAULT NULL,
  fax VARCHAR(30) DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL,
  representante VARCHAR(255) NOT NULL,
  cargo_representante VARCHAR(255) NOT NULL,
  regiao_de_comercializacao VARCHAR(1) DEFAULT NULL,
  data_registro DATE NOT NULL,
  PRIMARY KEY (cnpj),
  UNIQUE KEY cnpj (cnpj)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

load data infile '/var/lib/mysql-files/Relatorio_cadop.csv'
into table tbl_empresas
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;
