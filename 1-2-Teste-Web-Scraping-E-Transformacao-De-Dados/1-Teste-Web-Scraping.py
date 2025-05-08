import requests
import zipfile


url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"
AnexoI = requests.get(url)

url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos/Anexo_II_DUT_2021_RN_465.2021_RN628.2025_RN629.2025.pdf"
AnexoII = requests.get(url)

with zipfile.ZipFile("Anexos.zip", "w") as zp:
    zp.writestr("AnexoI.pdf", AnexoI.content)
    zp.writestr("AnexoII.pdf", AnexoII.content)

print("Arquivos PDF baixados e compactados com sucesso!")