Prima CREA IMMAGINE MONGO
Poi DOCKER COMPOSE UP -D

PER RUNNARE LOCALMENTE COI PROGETTI

CLONA i microservizi direttamente nella repository

docker-compose -f docker-composelocale.yml up

## CREA IMMAGINE MONGO
con ./CREATE_NOVOLUME_BASE_IMAGE

## RUNNA PROGETTI DAI PACKAGE
docker compose up -d

## RUNNA PROGETTI LOCALMENTE

### METTI I PROGETTI IN src/

docker-compose -f docker-composelocale.yml up
