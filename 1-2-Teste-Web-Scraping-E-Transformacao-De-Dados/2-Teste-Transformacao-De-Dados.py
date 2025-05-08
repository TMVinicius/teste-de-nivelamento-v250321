import pdfplumber
import pandas as pd
import zipfile as zip
import os

if not os.path.exists("Anexos.zip"):
    print("Arquivo Anexos.zip não encontrado.")
    exit()

with zip.ZipFile("Anexos.zip", "r") as zipfile:
    if "AnexoI.pdf" not in zipfile.namelist():
        print("Arquivo AnexoI.pdf inexistente")
        exit()
    AnexoI = zipfile.open("AnexoI.pdf")

tabelas = []
try:
    with pdfplumber.open(AnexoI) as pdf:
        primeira_tabela = pdf.pages[2].extract_table()
        if primeira_tabela:
            tabelas.append(pd.DataFrame(primeira_tabela))
        for pagina in pdf.pages[3:]:
            tabela = pagina.extract_table()
            tabela = tabela[1:] 
            if tabela:
                tabelas.append(pd.DataFrame(tabela))

except Exception as ex:
    print(f"Erro ao tentar abrir PDF : {ex}")
    exit()

if not tabelas:
    print("Nenhuma tabela encontrada.")
    exit()

df = pd.concat(tabelas, ignore_index=True)

for linha in df.itertuples():
    df.loc[linha.Index] = df.loc[linha.Index].replace('OD', 'SEG. ODONTOLÓGICA')
    df.loc[linha.Index] = df.loc[linha.Index].replace('AMB', 'SEG. AMBULATORIAL')

df.columns = df.iloc[0]
df = df[1:]

arquivo_csv = "arquivo.csv"
df.to_csv(arquivo_csv, index=False)

with zip.ZipFile("Teste_Vinicius_Tavares.zip", "w") as zp:
    zp.write(arquivo_csv, arcname="arquivo.csv")
    
os.remove(arquivo_csv)
print("Arquivo convertido e compactado com sucesso!")

