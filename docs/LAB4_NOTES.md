# Lab 4 - Notes (DevOps Data)

## Objectif
- Workflow Git/GitHub (PR)
- App Node/Express + scripts NPM
- Docker (build/run)
- Tests Jest/Supertest + bug volontaire

## Commandes clés
- npm start
- npm test
- docker build -t sample-app:1.0.2 .
- docker run --rm -p 3001:3001 sample-app:1.0.2

## Pièges rencontrés
- Conflit de port (diagnostic: netstat -ano | findstr :3000)
- Docker Desktop pas démarré -> docker version pour vérifier
- Port déjà alloué -> arrêter le process/containeur
