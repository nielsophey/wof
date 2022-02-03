# Voraussetzung

- Node 14 oder höher
- Azure Function Tools
- VS Code
- Azure CLI

az login
az account show
az account set --subscription


## Fehler in der live demo heute 03.02.2022

in der function.json von getProduct war die Collection falsch gesetzt:

Es war:
      "collection": "products",

Es muss:
      "collectionName": "products",

Sorry noch mal dafür!
