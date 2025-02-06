## CREA IMMAGINE MONGO
con ./CREATE_NOVOLUME_BASE_IMAGE

## RUNNA PROGETTI DAI PACKAGE ONLINE
docker compose up -d

## RUNNA PROGETTI LOCALMENTE

### METTI I PROGETTI IN src/

docker-compose -f docker-composelocale.yml up --build

