# 3-Teste de Banco de Daods

## Preparando o ambiente
Foi utilizado para a execução dos testes: 

- Docker Desktop 
- MySQL Workbench 8.0 
- Python 3.12

Tenha todos os arquivos `.zip` dos últimos 2 anos, o `.csv` dos dados cadastrais e os scripts `.sql` organizados em uma única pasta local.

Na pasta do arquivo, execute o script descompactacao_arquivos.py:
```bash
    python descompactacao_arquivos
```
Inicie o docker 
```bash
    docker-compose up
```

## Execução dos scripts SQL

Execute os scripts SQL dentro do Workbench sequencialmente:

Estruturação do Banco de Dados:
3_3-Teste_Banco_de_Dados.sql

Copulando os Dados:
3_4-Teste_Banco_de_Dados.sql

Queries para filtrar as informações  referente ao último trimestre e último ano:
3_5-Teste_Banco_de_Dados.sql



