import os
import zipfile

caminho = os.getcwd()  
arquivos = os.listdir(caminho)

for arquivo in arquivos:
    if arquivo.endswith('.zip'):
        caminho_completo = os.path.join(caminho, arquivo)
        with zipfile.ZipFile(caminho_completo, 'r') as zip_ref:
            zip_ref.extractall(caminho)

print("Arquivos extraídos com sucesso.")