# CryptoMonitor – Cryptocurrency Monitoring Platform

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

## Overview

CryptoMonitor is a microservices-based web application designed to monitor and manage cryptocurrencies effectively. It offers real-time market data, personalized watchlists, interactive charts, and portfolio management tools. Whether you're a professional trader or a beginner, CryptoMonitor provides the tools to stay informed and make knowledge-based decisions.

### Project Details

- **University:** University of Bologna  
- **Course:** Master's Degree in Computer Science and Engineering – Software Process Engineering Project

#### Team Members

- Alessandro Becci – alessandro.becci@studio.unibo.it
- Ludovico Nollino – ludovico.nollino@studio.unibo.it
- Luca Tonelli – luca.tonelli11@studio.unibo.it

---

## Live Documentation

Access the full project documentation here:  
[https://cryptomonitorasw-spe.github.io/documentation/](https://cryptomonitorasw-spe.github.io/documentation/)

---

## Features

- **Real-Time Market Data:** Stay updated with live cryptocurrency prices and market trends.
- **User Authentication:** Secure login and registration system.
- **Personalized Watchlists:** Track your favorite cryptocurrencies.
- **Interactive Charts:** Analyze historical data with customizable charts.
- **Portfolio Management:** Monitor your investments and performance over time.
- **Notifications:** Receive alerts for significant market changes.

---

## Setup Instructions

1. **Environment Variables**

  Create a `.env` file in the root directory and set the following variables:

  ```bash
  COINGECKO_API_KEY=YOUR_COINGECKO_API_KEY
  JWT_SIMMETRIC_KEY=$(node -e "console.log(require('crypto').randomBytes(32).toString('hex'))")
  ```

2. **Build MongoDB Image**

  Run the following script to create the MongoDB Docker image:

  ```bash
  ./CREATE_NOVOLUME_BASE_IMAGE
  ```

3. **Run Projects from Online Packages**

  Start the services using Docker Compose:

  ```bash
  docker compose up -d
  ```

4. **Run Projects Locally**

  Place the projects in the `src/` directory and use the following command:

  ```bash
  docker-compose -f docker-composelocale.yml up --build
  ```

5. **Database Configuration**

  The database includes two test users:

  - **User 1:**  
    Email: a@gmail.com  
    Password: test  

  - **User 2:**  
    Email: b@gmail.com  
    Password: test

---

## Available Scripts

### Update Repositories

- **Linux:** `./update-projects.sh`
- **Windows:** `./update-project.ps1`

_Updates all project repositories located in the `src/` directory._

### Stop Services

- **Linux:** `./stop.sh`
- **Windows:** `./stop.ps1`

_Stops all running Docker containers defined in `docker-composelocale.yml`._

### Rebuild Services

- **Linux:** `./rebuild.sh`
- **Windows:** `./rebuild.ps1`

_Rebuilds all services except MongoDB to preserve data integrity._

---

## Continuous Integration (CI)

- **Git Hooks:** Pre-commit and pre-push hooks enforce code standards and run tests before changes are committed or pushed.
- **Branch Management:** A structured branching strategy manages feature development, releases, and hotfixes.
- **Build Automation:** Automated scripts handle building and testing to catch issues early in the development cycle.
- **Dockerized Environment:** Docker ensures consistency across development, testing, and production environments.

---

## License

This project is licensed under the MIT License.