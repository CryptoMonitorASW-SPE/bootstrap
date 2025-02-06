## .env NECESSARIO
COINGECKO_API_KEY=SECRETSECRET
JWT_SIMMETRIC_KEY=${node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"}
USER_MANAGEMENT_SERVICE_NAME: user-management
USER_MANAGEMENT_SERVICE_PORT: 3000

## CREA IMMAGINE MONGO
con ./CREATE_NOVOLUME_BASE_IMAGE

## RUNNA PROGETTI DAI PACKAGE ONLINE
docker compose up -d

## RUNNA PROGETTI LOCALMENTE

### METTI I PROGETTI IN src/

docker-compose -f docker-composelocale.yml up --build

## CONFIGURAZIONE DATABASE
2 Utenti di prova sono già inseriti:

a@gmail.com test
b@gmail.com test