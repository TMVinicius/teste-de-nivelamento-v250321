-- 3.5 Query para o ultimo trimestre:  
SELECT e.razao_social, e.cnpj, r.registro_ans, SUM(r.saldo_final) AS total_despesas
FROM tbl_registros_contabeis r
JOIN tbl_empresas e ON r.registro_ans = e.registro_ans
WHERE r.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
AND r.data_registro = '2024-10-01'
GROUP BY e.razao_social, e.cnpj, r.registro_ans
ORDER BY total_despesas DESC
LIMIT 10;

-- 3.5 Query para o ultimo ano:
SELECT e.razao_social, e.cnpj, r.registro_ans, SUM(r.saldo_final) AS total_despesas
FROM tbl_registros_contabeis r
JOIN tbl_empresas e ON r.registro_ans = e.registro_ans
WHERE r.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
AND r.data_registro >= '2024-01-01'  
GROUP BY e.razao_social, e.cnpj, r.registro_ans
ORDER BY total_despesas DESC
LIMIT 10;