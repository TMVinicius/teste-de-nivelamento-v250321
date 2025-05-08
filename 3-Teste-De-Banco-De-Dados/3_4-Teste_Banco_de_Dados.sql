use db_dados_ans;
load data infile '/var/lib/mysql-files/Relatorio_cadop.csv'
into table tbl_empresas
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data infile '/var/lib/mysql-files/1T2023.csv'
into table tbl_registros_contabeis
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(data_registro, registro_ans, conta_contabil, descricao, @saldo_inicial, @saldo_final)
SET
    saldo_inicial = REPLACE(@saldo_inicial, ',', '.'),
    saldo_final = REPLACE(@saldo_final, ',', '.');

load data infile '/var/lib/mysql-files/2t2023.csv'
into table tbl_registros_contabeis
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(data_registro, registro_ans, conta_contabil, descricao, @saldo_inicial, @saldo_final)
SET
    saldo_inicial = REPLACE(@saldo_inicial, ',', '.'),
    saldo_final = REPLACE(@saldo_final, ',', '.');

load data infile '/var/lib/mysql-files/3T2023.csv'
into table tbl_registros_contabeis
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(data_registro, registro_ans, conta_contabil, descricao, @saldo_inicial, @saldo_final)
SET
    saldo_inicial = REPLACE(@saldo_inicial, ',', '.'),
    saldo_final = REPLACE(@saldo_final, ',', '.');

load data infile '/var/lib/mysql-files/4T2023.csv'
into table tbl_registros_contabeis
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(@data_registro, registro_ans, conta_contabil, descricao, @saldo_inicial, @saldo_final)
SET
	data_registro = STR_TO_DATE(replace(@data_registro, '/', '-'),'%d-%m-%Y'),
    saldo_inicial = REPLACE(@saldo_inicial, ',', '.'),
    saldo_final = REPLACE(@saldo_final, ',', '.');
    
load data infile '/var/lib/mysql-files/1T2024.csv'
into table tbl_registros_contabeis
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(data_registro, registro_ans, conta_contabil, descricao, @saldo_inicial, @saldo_final)
SET
    saldo_inicial = REPLACE(@saldo_inicial, ',', '.'),
    saldo_final = REPLACE(@saldo_final, ',', '.');
    
load data infile '/var/lib/mysql-files/2T2024.csv'
into table tbl_registros_contabeis
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(data_registro, registro_ans, conta_contabil, descricao, @saldo_inicial, @saldo_final)
SET
    saldo_inicial = REPLACE(@saldo_inicial, ',', '.'),
    saldo_final = REPLACE(@saldo_final, ',', '.');

load data infile '/var/lib/mysql-files/3T2024.csv'
into table tbl_registros_contabeis
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(data_registro, registro_ans, conta_contabil, descricao, @saldo_inicial, @saldo_final)
SET
    saldo_inicial = REPLACE(@saldo_inicial, ',', '.'),
    saldo_final = REPLACE(@saldo_final, ',', '.');

load data infile '/var/lib/mysql-files/4T2024.csv'
into table tbl_registros_contabeis
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(data_registro, registro_ans, conta_contabil, descricao, @saldo_inicial, @saldo_final)
SET
    saldo_inicial = REPLACE(@saldo_inicial, ',', '.'),
    saldo_final = REPLACE(@saldo_final, ',', '.');
