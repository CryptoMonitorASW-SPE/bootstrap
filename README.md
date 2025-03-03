# Welcome to the Bootstrap Project!

## Required .env Variables
Make sure to set the following environment variables:
```
COINGECKO_API_KEY=SECRETSECRET
JWT_SIMMETRIC_KEY=${node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"}
```

## Create MongoDB Image
Run the following command to create the MongoDB image:
```
./CREATE_NOVOLUME_BASE_IMAGE
```

## Run Projects from Online Packages
Use the following command to start the projects:
```
docker compose up -d
```

## Run Projects Locally

### Place the Projects in `src/`
Use the following command to build and start the projects locally:
```
docker-compose -f docker-composelocale.yml up --build
```

## Database Configuration
Two test users are already inserted:

- `a@gmail.com` with password `test`
- `b@gmail.com` with password `test`

## Available Scripts

The project includes scripts for both Windows and Linux environments:

- **Update Repositories:**  
  - Linux: `./update-projects.sh`  
  - Windows: *(If you have a corresponding PowerShell script, you can use that instead)*

- **Stop Services:**  
  - Linux: `./stop.sh`  
  - Windows: `./stop.ps1`

- **Rebuild Services:**  
  - Linux: `./rebuild.sh`  
  - Windows: `./rebuild.ps1`

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 